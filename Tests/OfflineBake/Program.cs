using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace SerenBiotechExtended.OfflineBake
{
    // Offline look at the mask 6 bake: runs MaskBakeCore on the PNG pictures of the bodies (south view) and of the mask, and
    // writes one sheet, body then body with mask, for every body. No game, no ticket.
    //   OfflineBake <bodies folder> <mask 6 south png> <output png>
    internal static class Program
    {
        // Share of the skin height from the feet where the pants start (same table as MaskBake.NavelShare).
        private static readonly Dictionary<string, float> WaistLine = new Dictionary<string, float>
        {
            { "Male", 0.35f }, { "Female", 0.47f }, { "Thin", 0.33f }, { "Thin_Female", 0.41f },
            { "Fat", 0.44f }, { "Fat_Female", 0.44f }, { "Hulk", 0.38f }, { "Hulk_Female", 0.42f },
        };

        // OFFLINE_WAIST=table uses the per-body table, a number is a share of the skin height from the feet, nothing means half.
        private static float Waist(string key)
        {
            string v = Environment.GetEnvironmentVariable("OFFLINE_WAIST");
            if (v == "table") return WaistLine[key];
            return string.IsNullOrEmpty(v) ? -1f : float.Parse(v, System.Globalization.CultureInfo.InvariantCulture);
        }

        private static readonly string Facing = Environment.GetEnvironmentVariable("OFFLINE_FACING") ?? "south";

        private static int Main(string[] args)
        {
            if (args.Length != 3)
            {
                Console.Error.WriteLine("usage: OfflineBake <bodies folder> <mask 6 south png> <output png>");
                return 2;
            }
            RgbaImage art = Load(args[1]);
            var keys = new List<string>(WaistLine.Keys);
            keys.Sort();
            const int Cell = 512, Scale = 1;
            using (var sheet = new Bitmap(Cell * 2 * keys.Count, Cell, PixelFormat.Format32bppArgb))
            using (Graphics g = Graphics.FromImage(sheet))
            {
                g.Clear(Color.FromArgb(214, 190, 150));
                for (int i = 0; i < keys.Count; i++)
                {
                    string key = keys[i];
                    string path = Path.Combine(args[0], "Naked_" + key + "_" + Facing + ".png");
                    if (!File.Exists(path))
                    {
                        Console.WriteLine("missing " + path);
                        continue;
                    }
                    RgbaImage body = Load(path);
                    Rgba[] mask;
                    string report = "clip";
                    if (Environment.GetEnvironmentVariable("OFFLINE_CLIP") != null)
                        mask = MaskBakeCore.BakeClip(art, body, 256);
                    else
                        mask = MaskBakeCore.Bake(art, body, Waist(key), out report);
                    Console.WriteLine(key + ": " + report);
                    Draw(sheet, body, null, i * 2 * Cell);
                    Draw(sheet, body, mask, (i * 2 + 1) * Cell);
                }
                sheet.Save(args[2], ImageFormat.Png);
            }
            return 0;
        }

        // The body picture tinted like a purple skin, then the mask in the pale accent colour, alpha blended.
        private static void Draw(Bitmap sheet, RgbaImage body, Rgba[] mask, int left)
        {
            Color skin = Color.FromArgb(128, 56, 140), accent = Color.FromArgb(235, 228, 250);
            for (int y = 0; y < body.Height; y++)
                for (int x = 0; x < body.Width; x++)
                {
                    Rgba b = body.Data[y * body.Width + x];
                    if (b.A == 0)
                        continue;
                    float r = b.R / 255f * skin.R, gr = b.G / 255f * skin.G, bl = b.B / 255f * skin.B;
                    int ms = mask == null ? 0 : (int)Math.Sqrt(mask.Length);
                    int mi = mask == null ? 0 : (y * ms / body.Height) * ms + x * ms / body.Width;
                    if (mask != null && mask[mi].A > 0)
                    {
                        Rgba m = mask[mi];
                        float a = m.A / 255f;
                        r = r * (1 - a) + accent.R * m.R / 255f * a;
                        gr = gr * (1 - a) + accent.G * m.G / 255f * a;
                        bl = bl * (1 - a) + accent.B * m.B / 255f * a;
                    }
                    int px = left + x, py = sheet.Height - 1 - y;
                    if (px < sheet.Width && py >= 0 && py < sheet.Height)
                        sheet.SetPixel(px, py, Color.FromArgb(b.A, (int)r, (int)gr, (int)bl));
                }
        }

        private static RgbaImage Load(string path)
        {
            using (var bmp = new Bitmap(path))
            {
                var image = new RgbaImage { Width = bmp.Width, Height = bmp.Height, Data = new Rgba[bmp.Width * bmp.Height] };
                for (int y = 0; y < bmp.Height; y++)
                    for (int x = 0; x < bmp.Width; x++)
                    {
                        Color c = bmp.GetPixel(x, bmp.Height - 1 - y);
                        image.Data[y * bmp.Width + x] = new Rgba { R = c.R, G = c.G, B = c.B, A = c.A };
                    }
                return image;
            }
        }
    }
}
