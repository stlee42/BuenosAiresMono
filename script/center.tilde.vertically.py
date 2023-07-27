# https://www.reddit.com/r/FontForge/comments/11r6x4q/vertically_centering_glyphs/
fontfile = "/Users/stl/src/BuenosAiresMono/BuenosAiresMono-Regular.sfd"
startglyph = 94
endglyph = 94

thisfont = fontforge.open(fontfile)
for i in range(startglyph,endglyph+1):
    ytop = thisfont[i].boundingBox()[-1]
    ybot = thisfont[i].boundingBox()[1]
    thisfont[i].transform( psMat.translate( 0, thisfont.ascent - (thisfont.ascent + thisfont.descent - (ytop - ybot)) / 2 - ytop))
