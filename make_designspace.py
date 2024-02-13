#!/usr/bin/env python3

import os, re
from sys import argv
from fontTools.designspaceLib import DesignSpaceDocument, AxisDescriptor, SourceDescriptor, InstanceDescriptor

root = os.getcwd()
doc = DesignSpaceDocument()

familyName = "Inconsolata LGC"
isItalic = bool(re.search('Italic', argv[1]))

#------
# axes
#------

a1 = AxisDescriptor()
a1.maximum = 1000
a1.minimum = 0
a1.default = 400
a1.name = "Weight"
a1.tag = "wght"
doc.addAxis(a1)

#---------
# masters
#---------

s0 = SourceDescriptor()
s0.path = argv[2]
s0.name = "master.InconsolataLGC.Regular.0"
s0.familyName = familyName
s0.styleName = "Italic" if isItalic else "Regular"
s0.location = dict(Weight=400)
s0.copyLib = True
s0.copyInfo = True
s0.copyGroups = True
s0.copyFeatures = True
doc.addSource(s0)

s1 = SourceDescriptor()
s1.path = argv[4]
s1.name = "master.InconsolataLGC.Minimum.0"
s1.familyName = familyName
s1.styleName = "Minimum Italic" if isItalic else "Minimum"
s1.location = dict(Weight=0)
doc.addSource(s1)

s2 = SourceDescriptor()
s2.path = argv[3]
s2.name = "master.InconsolataLGC.Bold.0"
s2.familyName = familyName
s2.styleName = "Bold Italic" if isItalic else "Bold"
s2.location = dict(Weight=700)
doc.addSource(s2)

s3 = SourceDescriptor()
s3.path = argv[5]
s3.name = "master.InconsolataLGC.Maximum.0"
s3.familyName = familyName
s3.styleName = "Maximum Italic" if isItalic else "Maximum"
s3.location = dict(Weight=1000)
doc.addSource(s3)

#----------
# instances
#----------

i1 = InstanceDescriptor()
i1.styleName = "Thin Italic" if isItalic else "Thin"
i1.designLocation = dict(Weight=100)
doc.addInstance(i1)

i2 = InstanceDescriptor()
i2.styleName = "Extra Light Italic" if isItalic else "Extra Light"
i2.designLocation = dict(Weight=200)
doc.addInstance(i2)

i3 = InstanceDescriptor()
i3.styleName = "Light Italic" if isItalic else "Light"
i3.designLocation = dict(Weight=300)
doc.addInstance(i3)

i4 = InstanceDescriptor()
i4.styleName = "Italic" if isItalic else "Regular"
i4.designLocation = dict(Weight=400)
doc.addInstance(i4)

i5 = InstanceDescriptor()
i5.styleName = "Medium Italic" if isItalic else "Medium"
i5.designLocation = dict(Weight=500)
doc.addInstance(i5)

i6 = InstanceDescriptor()
i6.styleName = "DemiBold Italic" if isItalic else "DemiBold"
i6.designLocation = dict(Weight=600)
doc.addInstance(i6)

i7 = InstanceDescriptor()
i7.styleName = "Bold Italic" if isItalic else "Bold"
i7.designLocation = dict(Weight=700)
doc.addInstance(i7)

i8 = InstanceDescriptor()
i8.styleName = "Extra Bold Italic" if isItalic else "Extra Bold"
i8.designLocation = dict(Weight=800)
doc.addInstance(i8)


i9 = InstanceDescriptor()
i9.styleName = "Black Italic" if isItalic else "Black"
i9.designLocation = dict(Weight=900)
doc.addInstance(i9)


#--------
# saving
#--------

path = os.path.join(root, argv[1])
doc.write(path)
