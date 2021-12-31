# cool-batches
The batches I use for texture conversion (mainly dds)

# Pre-reqs
You need ImageMagick installed for most of these, with old tools enabled (like "convert" command), it needs to be in your Windows PATH: https://imagemagick.org/script/download.php#windows

Noesis: https://richwhitehouse.com/index.php?content=inc_projects.php&showproject=91

old NVTT: https://developer.nvidia.com/gameworksdownload (GPU Accelerated Texture Tools)

new NVTT: https://developer.nvidia.com/nvidia-texture-tools-exporter (Standalone)

# Descriptions
paths.bat - set up paths for programs

scale.bat - automatically scale image to 128x128, 256x256, 512x512 and 1024x1024 variants (keeping aspect ratio)

sscale.bat - automatically scale image to ridiculously small sizes (8x8 - 32x32)

png.bat - convert image to png with noesis

pngd.bat - convert image to png with noesis (and delete the original)

resavepng.bat - resave png with noesis

extract alpha.bat - extract alpha from image to a separate grayscale image

combine alpha.bat - add alpha to some image from a separate grayscale image

extract all channels.bat - separate RGBA channels to different grayscale images

combine channels.bat - combine multiple grayscale images to a single RGB(A) image

edit gamma.bat - adjust image's gamma by some amount

rgb.bat - assume rgb color profile (makes image darker)

srgb.bat - assume srgb color profile (makes image brighter)

SSBU_Tex.bat - adjust image's colors to look better in SSBU (for mods)

SSBU_Untex.bat - Revert.bat - adjust SSBU textures colors to be more colorful (will look better in, say, P5R)

tga.bat - convert image to tga with noesis

tgad.bat - convert image to tga with noesis (and delete the original)

bdds.bat - new->old nvtt (auto bc1/bc3 based on alpha)

bddsm.bat - new->old nvtt (auto bc1/bc3 based on alpha, no mipmaps)

bdds1.bat - new->old nvtt (bc1)

bdds1m.bat - new->old nvtt (bc1, no mipmaps)

bddsu.bat - new->old nvtt (uncompressed)

bddsum.bat - new->old nvtt (uncompressed, no mipmaps)

ndds.bat - new nvtt (auto bc1/bc3 based on alpha)

nddsm.bat - new nvtt (auto bc1/bc3 based on alpha, no mipmaps)

ndds1.bat - new nvtt (bc1)

ndds1m.bat - new nvtt (bc1, no mipmaps)

ndds7.bat - new nvtt (bc7, normal quality compression)

ndds7m.bat - new nvtt (bc7, normal quality compression, no mipmaps)
