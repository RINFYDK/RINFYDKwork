FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_rpi = " \
    file://playersinkbinpmtinfo.c \
    file://playersinkbinpmtinfo.h \
    file://playersinkbinstreaminfo.h \
    file://playersinkbinstreaminfo.c \
    file://0001-playersinkbin-support-for-rpi.patch;patch=1;pnum=4 \
"

LIC_FILES_CHKSUM = "file://gstplayersinkbin.c;md5=43622f8b99bceb414b9e7257b2b838e9"

inherit pkgconfig
