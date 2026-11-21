"""Downsample the 2x Chrome screenshot to a 1024x1024 PNG under 1 MiB."""
import sys
from PIL import Image

src, dst = sys.argv[1], sys.argv[2]
im = Image.open(src).convert("RGB")
im = im.resize((1024, 1024), Image.LANCZOS)
im.save(dst, optimize=True)
size = __import__("os").path.getsize(dst)
if size > 1_000_000:
    # fall back to a 256-colour palette if the full-colour file is too big
    im.quantize(colors=256, method=Image.Quantize.MEDIANCUT, dither=Image.Dither.NONE).save(dst, optimize=True)
    size = __import__("os").path.getsize(dst)
print(f"{dst}: {im.size[0]}x{im.size[1]}, {size} bytes")
