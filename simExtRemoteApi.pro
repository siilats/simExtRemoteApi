QT -= core
QT -= gui

TARGET = simExtRemoteApi
TEMPLATE = lib

DEFINES -= UNICODE
DEFINES += QT_COMPIL
CONFIG += shared plugin
INCLUDEPATH += "../include"
INCLUDEPATH += "../include/simLib"

*-msvc* {
    QMAKE_CXXFLAGS += -O2
    QMAKE_CXXFLAGS += -W3
}
*-g++* {
    QMAKE_CXXFLAGS += -O3
    QMAKE_CXXFLAGS += -Wall
    QMAKE_CXXFLAGS += -Wno-unused-parameter
    QMAKE_CXXFLAGS += -Wno-strict-aliasing
    QMAKE_CXXFLAGS += -Wno-empty-body
    QMAKE_CXXFLAGS += -Wno-write-strings

    QMAKE_CXXFLAGS += -Wno-unused-but-set-variable
    QMAKE_CXXFLAGS += -Wno-unused-local-typedefs
    QMAKE_CXXFLAGS += -Wno-narrowing

    QMAKE_CFLAGS += -O3
    QMAKE_CFLAGS += -Wall
    QMAKE_CFLAGS += -Wno-strict-aliasing
    QMAKE_CFLAGS += -Wno-unused-parameter
    QMAKE_CFLAGS += -Wno-unused-but-set-variable
    QMAKE_CFLAGS += -Wno-unused-local-typedefs
}


win32 {
    DEFINES += WIN_SIM
    LIBS += -lwinmm
    LIBS += -lWs2_32
    LIBS += -lKernel32
}

macx {
    DEFINES += MAC_SIM
#    LIBS += -lrt
}

unix:!macx {
    DEFINES += LIN_SIM
    LIBS += -lrt
}

SOURCES += \
    simExtRemoteApi.cpp \
    confReader.cpp \
    inConnection.cpp \
    porting.cpp \
    simxCmd.cpp \
    simxConnections.cpp \
    simxContainer.cpp \
    simxSocket.cpp \
    simxUtils.cpp \
    ../include/simLib/scriptFunctionData.cpp \
    ../include/simLib/scriptFunctionDataItem.cpp \
    ../include/simLib/shared_memory.c \
    ../include/simLib/simLib.cpp \

HEADERS +=\
    simExtRemoteApi.h \
    confReader.h \
    inConnection.h \
    porting.h \
    simxCmd.h \
    simxConnections.h \
    simxContainer.h \
    simxSocket.h \
    simxUtils.h \
    ../include/simLib/scriptFunctionData.h \
    ../include/simLib/scriptFunctionDataItem.h \
    ../include/simLib/shared_memory.h \
    ../include/simLib/simLib.h \

unix:!symbian {
    maemo5 {
        target.path = /opt/usr/lib
    } else {
        target.path = /usr/lib
    }
    INSTALLS += target
}
