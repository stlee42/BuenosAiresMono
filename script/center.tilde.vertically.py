#!/usr/local/bin/fontforge -script

import fontforge

colon = 26
tilde = 94

def alignTilde(fontfile):
    thisfont = fontforge.open(fontfile)

    colontop = thisfont[colon].boundingBox()[-1]
    colonbot = thisfont[colon].boundingBox()[1]
    ytop = thisfont[tilde].boundingBox()[-1]
    ybot = thisfont[tilde].boundingBox()[1]

    # Choose between these two

    # Vertically center tilde with respect to colon character
    # This is more like Apple's Menlo font
    #offset = colontop - (colontop + colonbot - (ytop - ybot)) / 2 - ytop

    # Vertically center tilde
    # This is more like Apple's SF Mono font
    offset = thisfont.ascent - (thisfont.ascent + thisfont.descent - (ytop - ybot)) / 2 - ytop

    #print(colontop )
    #print(colonbot )
    #print(ytop )
    #print(ybot )
    #print(offset )
    #print(thisfont.ascent)
    #print(thisfont.descent)
    #print()

    thisfont[tilde].transform( psMat.translate( 0, offset) )
    thisfont.save()

alignTilde("../BuenosAiresMono-Regular.sfd")
alignTilde("../BuenosAiresMono-Italic.sfd")
alignTilde("../BuenosAiresMono-BoldItalic.sfd")
alignTilde("../BuenosAiresMono-Bold.sfd")

# originally from
# https://www.reddit.com/r/FontForge/comments/11r6x4q/vertically_centering_glyphs/
