TEMPLATE = app

QT += qml quick widgets core

CONFIG += c++11

include($$PWD/lib/DinosaurUi/DinosaurUi.pri)
include($$PWD/lib/DinosaurTools/DinosaurTools.pri)

SOURCES += \
    main.cpp

RESOURCES += \
    qml.qrc
