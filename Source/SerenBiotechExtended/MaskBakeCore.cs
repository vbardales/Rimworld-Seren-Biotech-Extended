using System;

namespace SerenBiotechExtended
{
    // The pixel work of the mask 6 bake, with no Unity type so that Tests/OfflineBake can run it on PNG files and write
    // pictures to look at. Rows count from the bottom, like the textures the game reads.
    internal struct Rgba
    {
        public byte R, G, B, A;
    }

    internal sealed class RgbaImage
    {
        public int Width, Height;
        public Rgba[] Data;
    }

    internal static class MaskBakeCore
    {
        internal const byte BodyAlpha = 40;
        internal const byte ArtAlpha = 8;
        // Darker pixels of a body are its outline, not skin.
        internal const int OutlineLight = 80;
        // The three tones of the art are alpha levels 25, 50 and 75 percent of white: over a dark skin they nearly vanish, so
        // they are raised to about 60, 75 and 90 percent (the original draws them nearly opaque).
        internal const float ToneBase = 0.45f, ToneRange = 0.6f;
        // Without a measured waist line, the navel is half of the body height counted from the feet.
        internal const float DefaultNavelFromFeet = 0.5f;
        private const float DenseRow = 0.6f;
        // The extension copies a pixel a few columns inside the row ends: the end pixels are antialiased and made streaks.
        private const int EdgeInset = 4;

        private static bool IsDark(Rgba c) => c.A < BodyAlpha || (c.R + c.G + c.B) / 3 <= OutlineLight;

        // The skin of a body picture: every opaque pixel except the outline, which is the dark (or transparent) band connected to
        // the outside. Dark marks inside the body (navel, crotch) are skin, so the pants cover them.
        internal static bool[] SkinOf(RgbaImage body)
        {
            int w = body.Width, h = body.Height;
            var outside = new bool[w * h];
            var queue = new System.Collections.Generic.Queue<int>();
            for (int x = 0; x < w; x++) { Seed(body, outside, queue, x, 0); Seed(body, outside, queue, x, h - 1); }
            for (int y = 0; y < h; y++) { Seed(body, outside, queue, 0, y); Seed(body, outside, queue, w - 1, y); }
            while (queue.Count > 0)
            {
                int i = queue.Dequeue(), x = i % w, y = i / w;
                if (x > 0) Seed(body, outside, queue, x - 1, y);
                if (x < w - 1) Seed(body, outside, queue, x + 1, y);
                if (y > 0) Seed(body, outside, queue, x, y - 1);
                if (y < h - 1) Seed(body, outside, queue, x, y + 1);
            }
            var skin = new bool[w * h];
            for (int i = 0; i < skin.Length; i++)
                skin[i] = !outside[i] && body.Data[i].A >= BodyAlpha;
            return skin;
        }

        // The edge of the ink is soft once the picture is drawn (bilinear, mip levels): the pants stopped about two pixels short
        // of the outline. The skin grows by SkinGrow pixels per 512 of picture width into opaque pixels, nothing on the 128 px
        // vanilla pictures. Read on the WDI pictures: ink is pure black 13 px thick, skin starts right after it, no shading band.
        private const int SkinGrow = 2;

        private static bool[] Grow(RgbaImage body, bool[] skin)
        {
            int w = body.Width, h = body.Height, steps = w * SkinGrow / 512;
            bool[] current = (bool[])skin.Clone();
            for (int step = 0; step < steps; step++)
            {
                bool[] next = (bool[])current.Clone();
                for (int y = 0; y < h; y++)
                    for (int x = 0; x < w; x++)
                    {
                        int i = y * w + x;
                        if (current[i] || body.Data[i].A < BodyAlpha)
                            continue;
                        if ((x > 0 && current[i - 1]) || (x < w - 1 && current[i + 1]) || (y > 0 && current[i - w]) || (y < h - 1 && current[i + w]))
                            next[i] = true;
                    }
                current = next;
            }
            return current;
        }

        private static void Seed(RgbaImage body, bool[] outside, System.Collections.Generic.Queue<int> queue, int x, int y)
        {
            int i = y * body.Width + x;
            if (outside[i] || !IsDark(body.Data[i]))
                return;
            outside[i] = true;
            queue.Enqueue(i);
        }

        // The art bands taper (the bottom one is a bag): stretched over a body they leave bare skin along both sides. From the
        // first row that covers most of the art width down, each row is extended sideways with its own end pixels, so the
        // pants reach the body edge. The scalloped top rows are left as drawn.
        private static RgbaImage FillSides(RgbaImage art, int minX, int maxX, int minY, int maxY)
        {
            var data = (Rgba[])art.Data.Clone();
            int width = maxX - minX + 1;
            bool dense = false;
            for (int y = maxY; y >= minY; y--)
            {
                int first = -1, last = -1, count = 0;
                for (int x = minX; x <= maxX; x++)
                    if (art.Data[y * art.Width + x].A > ArtAlpha)
                    {
                        if (first < 0) first = x;
                        last = x;
                        count++;
                    }
                if (first < 0)
                    continue;
                if (count >= DenseRow * width)
                    dense = true;
                if (!dense)
                    continue;
                for (int x = minX; x < first; x++) data[y * art.Width + x] = art.Data[y * art.Width + System.Math.Min(last, first + EdgeInset)];
                for (int x = last + 1; x <= maxX; x++) data[y * art.Width + x] = art.Data[y * art.Width + System.Math.Max(first, last - EdgeInset)];
            }
            return new RgbaImage { Width = art.Width, Height = art.Height, Data = data };
        }

        // The art of a mask clipped to the skin of a body picture, as a size x size picture: each output pixel is the average
        // (weighted by alpha) of the art block it covers, and is erased where the body picture, read at the same relative
        // place, is not skin. Null when the art or the body is empty.
        internal static Rgba[] BakeClip(RgbaImage art, RgbaImage body, bool[] skin, int size)
        {
            if (art == null || body == null || size <= 0)
                return null;
            var output = new Rgba[size * size];
            bool any = false;
            for (int y = 0; y < size; y++)
            {
                int by = y * body.Height / size, ay0 = y * art.Height / size, ay1 = System.Math.Max(ay0 + 1, (y + 1) * art.Height / size);
                for (int x = 0; x < size; x++)
                {
                    if (!skin[by * body.Width + x * body.Width / size])
                        continue;
                    int ax0 = x * art.Width / size, ax1 = System.Math.Max(ax0 + 1, (x + 1) * art.Width / size);
                    float a = 0f, r = 0f, g = 0f, b = 0f;
                    int n = 0;
                    for (int ay = ay0; ay < ay1; ay++)
                        for (int ax = ax0; ax < ax1; ax++)
                        {
                            Rgba p = art.Data[ay * art.Width + ax];
                            float w = p.A / 255f;
                            a += w; r += p.R * w; g += p.G * w; b += p.B * w;
                            n++;
                        }
                    if (a <= 0f)
                        continue;
                    output[y * size + x] = new Rgba { R = (byte)(r / a), G = (byte)(g / a), B = (byte)(b / a), A = (byte)(255f * a / n) };
                    any = true;
                }
            }
            return any ? output : new Rgba[size * size];
        }

        // The art of a mask kept at its own size, erased where the node mapping (scale and offset, as fractions of the square, about
        // the centre) lands it outside the skin of a child or baby body picture. The node worker still draws the picture mapped.
        internal static Rgba[] BakeMappedClip(RgbaImage art, RgbaImage body, bool[] skin, float scaleX, float scaleZ, float offsetX, float offsetZ)
        {
            if (art == null || body == null || skin == null)
                return null;
            var output = new Rgba[art.Width * art.Height];
            for (int y = 0; y < art.Height; y++)
            {
                float v = (y + 0.5f) / art.Height;
                int by = (int)(((v - 0.5f) * scaleZ + 0.5f + offsetZ) * body.Height);
                if (by < 0 || by >= body.Height)
                    continue;
                for (int x = 0; x < art.Width; x++)
                {
                    float u = (x + 0.5f) / art.Width;
                    int bx = (int)(((u - 0.5f) * scaleX + 0.5f + offsetX) * body.Width);
                    if (bx >= 0 && bx < body.Width && skin[by * body.Width + bx])
                        output[y * art.Width + x] = art.Data[y * art.Width + x];
                }
            }
            return output;
        }

        // The art stretched over the body from the feet up to the waist row, each row fitted to the skin width of that row
        // (legs gap kept), clipped to the skin. waistFromFeet is where the pants start, as a share of the skin height
        // counted from the feet, or negative to take half of it. Null when the art or the body has no pixel.
        internal static Rgba[] Bake(RgbaImage art, RgbaImage body, float waistFromFeet, out string report)
        {
            report = null;
            if (art == null || body == null)
                return null;
            int aMinX = art.Width, aMaxX = -1, aMinY = art.Height, aMaxY = -1;
            for (int y = 0; y < art.Height; y++)
                for (int x = 0; x < art.Width; x++)
                    if (art.Data[y * art.Width + x].A > ArtAlpha)
                    {
                        if (x < aMinX) aMinX = x;
                        if (x > aMaxX) aMaxX = x;
                        if (y < aMinY) aMinY = y;
                        if (y > aMaxY) aMaxY = y;
                    }
            bool[] skin = Grow(body, SkinOf(body));
            int bMinX = body.Width, bMaxX = -1, bMinY = body.Height, bMaxY = -1;
            for (int y = 0; y < body.Height; y++)
                for (int x = 0; x < body.Width; x++)
                    if (skin[y * body.Width + x])
                    {
                        if (x < bMinX) bMinX = x;
                        if (x > bMaxX) bMaxX = x;
                        if (y < bMinY) bMinY = y;
                        if (y > bMaxY) bMaxY = y;
                    }
            if (aMaxX < 0 || bMaxX < 0)
                return null;
            report = "body " + body.Width + "x" + body.Height + " x " + bMinX + ".." + bMaxX + " y " + bMinY + ".." + bMaxY
                + ", art x " + aMinX + ".." + aMaxX + " y " + aMinY + ".." + aMaxY + ", waist " + waistFromFeet;
            int rectBottom = bMinY;
            int rectTop = bMinY + (int)((bMaxY - bMinY + 1) * (waistFromFeet >= 0f ? waistFromFeet : DefaultNavelFromFeet));
            int rectHeight = Math.Max(1, rectTop - rectBottom);
            int artWidth = aMaxX - aMinX + 1, artHeight = aMaxY - aMinY + 1;
            art = FillSides(art, aMinX, aMaxX, aMinY, aMaxY);
            var output = new Rgba[body.Width * body.Height];
            for (int y = rectBottom; y < rectTop && y < body.Height; y++)
            {
                int ay = aMinY + Math.Min(artHeight - 1, (y - rectBottom) * artHeight / rectHeight);
                int rowLeft = -1, rowRight = -1;
                for (int x = bMinX; x <= bMaxX; x++)
                    if (skin[y * body.Width + x])
                    {
                        if (rowLeft < 0) rowLeft = x;
                        rowRight = x;
                    }
                if (rowLeft < 0)
                    continue;
                int rowWidth = rowRight - rowLeft + 1;
                for (int x = rowLeft; x <= rowRight; x++)
                {
                    if (!skin[y * body.Width + x])
                        continue;
                    int ax = aMinX + Math.Min(artWidth - 1, (x - rowLeft) * artWidth / rowWidth);
                    Rgba pixel = art.Data[ay * art.Width + ax];
                    if (pixel.A > ArtAlpha)
                        pixel.A = (byte)(255f * (ToneBase + ToneRange * pixel.A / 255f));
                    output[y * body.Width + x] = pixel;
                }
            }
            return output;
        }
    }
}
