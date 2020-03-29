PAINTCHER RELEASE 1
=================================================================== MAR 29, 2020

Paintcher generates a patch to change the colour palette on the version of
MS Paint bundled with Windows Vista, the last to be based on the Windows 95
version.

                                  === HOW? ===
Run paintcher.cmd directly from Windows Explorer or from the command line. Then,
type in the hex values of the colours you want to add to the palette -- the
values are added horizontally, meaning that the first fourteen colours will
occupy the first row of the palette and the last fourteen colours will occupy
the second row of the palette. Do not prepend the colour codes with # or 0x,
otherwise everything will go wrong. If you leave a slot blank, the last colour
you entered will be duplicated.

The program will output a 125 B file named patch.ips. As the name suggests, it
is merely a patch; to apply it, you need a patcher. I recommend Flips by Alcaro,
which can be found here: https://dl.smwcentral.net/11474/floating.zip

You must apply the patch on the version of MS Paint that was bundled with
Windows Vista. You may apply it either on a clean copy or on a copy that had
another palette patch applied before. If you want the patched Paint to coexist
with other copies of Vista Paint in the same folder, you must duplicate
mspaint.exe.mui and rename it to match the patched version's filename, otherwise
it will spew an error on startup and won't open.

                                  === WHY? ===
When Microsoft decided to scrap Classic MS Paint in favour of Playskool Paint,
paraphrasing eevee, many useful features were removed, including:
    * the ability to work with three simultaneous colours;
    * the ability to stretch and skew images;
    * the ability to use brushes larger than 50px of diameter.
Besides, all brushes had antialiasing applied to them, meaning that operations
as simple as drawing a form with a thick border and applying colour to it became
impossible without some cleanup work. Furthermore, the new UI sucks.

However, it has come to my attention the fact that the very first versions of
Classic MS Paint -- the ones bundled with Windows 95 and NT 4.0 -- had one
functionality that was scrapped in Windows 98: the ability to export and import
palette files, in a binary format labeled .PAL. I grabbed a copy of NT Paint and
figured out the structure of these files with the aid of a hex editor:
    * The header is RIFF[0x80][0x00][0x00][0x00]PAL data, followed by 0x74 00 00
      00 00 03 1c 00;
    * All 28 colours in the palette are then enumerated horizontally, separated
      by 0x00;
    * The last colour also has a following x00;
    * The footer is simply the letters EOF.
I suspected that the way the palette is stored inside the Paint executable must
be similar and wondered if there was a way to patch Vista Paint to work with
different palettes. A couple hours later, Paintcher was born.

                                  === WHO? ===
I’m rari_teh, nice to meet you. You can find me on Twitter at @rari_teh or shoot
me an email at rari-teh @t yandex dot ru.

Paintcher uses and comes bundled with Hexciting, a command-line hex editor by
samoz3. The author didn't release it with a license, but since it's open source
I'm assuming it's GPL. If you're samoz3 and you're not content with its
inclusion with Paintcher, shoot me an email and I'll rerelease it without
Hexciting.

Despite not using its code, Paintcher wouldn't be possible without Flips, so
Alcaro also deserves some credit here.

                                  === BUG! ===
If by "bug" you mean "if I type something that's not a colour code into the
program funny stuff happens", then that's not a bug, it's a *feature*. Paintcher
was designed to be usable only by fully literate individuals who know what a
colour code is. If you want to change it so that it's QA-proof, feel free to do
so. Just credit me as the original author afterwards.

On the other hand, if by "bug" you do mean "I did everything right and something
caught fire", by all means do send me an email or Twitter DM.

                                === LICENSE? ===
CC-BY rari_teh 2020. Just remember that samoz3 might not be OK with Hexciting
being bundled into something for profit, so please ask them for permission if
you plan to include it on a commercial product for some mad improbable reason.
If you modify Paintcher so that it doesn't depend on Hexciting anymore, you have
my permission to do whatever you want with it -- as long as I am credited.

                                                                       ~rari_teh