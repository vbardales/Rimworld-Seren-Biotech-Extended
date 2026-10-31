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
        // they are raised to about 45, 65 and 85 percent.
        internal const float ToneBase = 0.25f, ToneRange = 0.8f;
        // Without a measured waist line, the navel is half of the body height counted from the feet.
        internal const float DefaultNavelFromFeet = 0.5f;

        internal static bool IsSkin(Rgba c) => c.A >= BodyAlpha && (c.R + c.G + c.B) / 3 > OutlineLight;

        // The art stretched over the body from the feet up to the waist row, each row fitted to the skin width of that row
        // (legs gap kept), clipped to the skin. waistLineFromTop is the row where the pants start, as a share of the
        // picture height counted from the top (WDI underwear line), or negative to take half of the skin height. Null when the art or the body has no pixel.
        internal static Rgba[] Bake(RgbaImage art, RgbaImage body, float waistLineFromTop, out string report)
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
            int bMinX = body.Width, bMaxX = -1, bMinY = body.Height, bMaxY = -1;
            for (int y = 0; y < body.Height; y++)
                for (int x = 0; x < body.Width; x++)
                    if (IsSkin(body.Data[y * body.Width + x]))
                    {
                        if (x < bMinX) bMinX = x;
                        if (x > bMaxX) bMaxX = x;
                        if (y < bMinY) bMinY = y;
                        if (y > bMaxY) bMaxY = y;
                    }
            if (aMaxX < 0 || bMaxX < 0)
                return null;
            report = "body " + body.Width + "x" + body.Height + " x " + bMinX + ".." + bMaxX + " y " + bMinY + ".." + bMaxY
                + ", art x " + aMinX + ".." + aMaxX + " y " + aMinY + ".." + aMaxY + ", waist line " + waistLineFromTop;
            int rectBottom = bMinY;
            int rectTop = waistLineFromTop >= 0f
                ? (int)((1f - waistLineFromTop) * body.Height)
                : bMinY + (int)((bMaxY - bMinY + 1) * DefaultNavelFromFeet);
            int rectHeight = Math.Max(1, rectTop - rectBottom);
            int artWidth = aMaxX - aMinX + 1, artHeight = aMaxY - aMinY + 1;
            var output = new Rgba[body.Width * body.Height];
            for (int y = rectBottom; y < rectTop && y < body.Height; y++)
            {
                int ay = aMinY + Math.Min(artHeight - 1, (y - rectBottom) * artHeight / rectHeight);
                int rowLeft = -1, rowRight = -1;
                for (int x = bMinX; x <= bMaxX; x++)
                    if (IsSkin(body.Data[y * body.Width + x]))
                    {
                        if (rowLeft < 0) rowLeft = x;
                        rowRight = x;
                    }
                if (rowLeft < 0)
                    continue;
                int rowWidth = rowRight - rowLeft + 1;
                for (int x = rowLeft; x <= rowRight; x++)
                {
                    if (!IsSkin(body.Data[y * body.Width + x]))
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
