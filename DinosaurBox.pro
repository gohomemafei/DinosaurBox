TEMPLATE = app

QT += qml quick widgets core

CONFIG += c++11

include($$PWD/lib/DinosaurUI/DinosaurUi.pri)
include($$PWD/lib/DinosaurTools/DinosaurTools.pri)
include($$PWD/lib/DinosaurItem/DinosaurItem.pri)

SOURCES += \
    main.cpp

RESOURCES += \
    qml.qrc
