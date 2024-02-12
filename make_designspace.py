#!/usr/bin/env python3

import os, re
from sys import argv
from fontTools.designspaceLib import DesignSpaceDocument, AxisDescriptor, SourceDescriptor, InstanceDescriptor

root = os.getcwd()
doc = DesignSpaceDocument()

familyName = "InconsolataLGC"
isItalic = bool(re.search('Italic', argv[1]))

#------
# axes
#------

a1 = AxisDescriptor()
a1.maximum = 700
a1.minimum = 400
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
s1.path = argv[3]
s1.name = "master.InconsolataLGC.Bold.0"
s1.familyName = familyName
s1.styleName = "Bold Italic" if isItalic else "Bold"
s1.location = dict(Weight=700)
doc.addSource(s1)

#----------
# instances
#----------

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

#--------
# saving
#--------

path = os.path.join(root, argv[1])
doc.write(path)
