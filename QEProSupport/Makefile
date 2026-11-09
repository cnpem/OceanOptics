TOP=..
include $(TOP)/configure/CONFIG

./fetch-modified-seabreeze.sh

SRC_DIRS += ../SeaBreeze/include

INC += api/SeaBreezeWrapper.h
INC += api/DllDecl.h

LIB_INSTALLS_Linux += ../SeaBreeze/lib/libseabreeze.so

include $(TOP)/configure/RULES
