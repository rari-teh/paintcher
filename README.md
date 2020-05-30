# Paintcher
Classic MS Paint was born in Windows 95 from the ashes of Paintbrush and died with Windows Vista, being replaced by a largely inferior version whose only superiority is a larger Ctrl+Z buffer.

Paintcher allows you to patch the Vista version of MS Paint to change its entire colour palette in one go. It is inspired by the scrapped Get Colors/Save Colors function from the Windows 95 and NT 4.0 versions of MS Paint.

To use Paintcher, just run it from anywhere and type in the hex code of the 28 colours you want in your palette. The output file, `patch.ips`, may be applied on `mspaint.exe` with [Flips](https://dl.smwcentral.net/11474/floating.zip).

# Palips
Palips is a companion batchfile to Paintcher that allows you to convert your old Windows NT Paint palette files into IPS patches for Windows Vista Paint.

Usage:

    palips input.pal output.ips

# General notes

If you want to rename the patched Paint, you must make a copy of `mspaint.exe.mui` and rename it to match the patched executable’s filename.

The Vista version of MS Paint is abandonware and can be found at [The Internet Archive](https://archive.org/details/MSPaintWinVista).

Paintcher and Palips are CC-BY rari_teh. They use [Hexciting](https://sourceforge.net/projects/hexciting/), a command-line hex editor by samoz3.

For more info, refer to the readme included in the releases.
