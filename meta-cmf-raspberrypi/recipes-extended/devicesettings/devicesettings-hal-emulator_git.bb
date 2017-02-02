# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================
SUMMARY = "Devicesettings HAL Emulation"
SECTION = "console/utils"

LICENSE = "CLOSED"

PROVIDES = "virtual/devicesettings-hal"
SRCREV = "${AUTOREV}"

PV = "${RDK_RELEASE}+git${SRCPV}"

SRC_URI = "git://${RDK_GIT}/rdk/yocto_oe/layers/devicesettings-hal-emulator;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH}"

S = "${WORKDIR}/git"

DEPENDS="devicesettings-hal-headers"

INCLUDE_DIRS = " \
    -I${STAGING_DIR_TARGET}${includedir}/rdk/ds-hal \
    "

# note: we really on 'make -e' to control LDFLAGS and CFLAGS from here. This is
# far from ideal, but this is to workaround the current component Makefile
CFLAGS += "-fPIC -D_REENTRANT -Wall ${INCLUDE_DIRS}"

# a HAL is machine specific
PACKAGE_ARCH = "${MACHINE_ARCH}"

# Shared libs created by the RDK build aren't versioned, so we need
# to force the .so files into the runtime package (and keep them
# out of -dev package).
FILES_SOLIBSDEV = ""
FILES_${PN} += "${libdir}/*.so"
FILES_${PN} += "/opt/www/*.html"
FILES_${PN} += "/opt/persistent/ds/"
FILES_${PN} += "/opt/persistent/ds/*"

do_compile() {
        oe_runmake -C ${S}/
}

do_install() {
    # Install our HAL .h files required by the 'generic' devicesettings
    cd ${S}
    install -d ${D}${includedir}/rdk/ds-hal
    for i in *Settings.h ; do
        install -m 0644 $i ${D}${includedir}/rdk/ds-hal/
    done

    install -d ${D}${libdir}
    install -d ${D}/opt/persistent/ds
    for i in *.so; do
        install -m 0755 $i ${D}${libdir}/`basename $i`
    done

    install -d ${D}${bindir} ${D}/opt/www
    install -m 0644 ${S}/platform.cfg ${D}${bindir}
    install -m 0755 ${S}/resolutionsettings.html ${D}/opt/www
    install -m 0755 ${S}/hostData ${D}/opt/persistent/ds/
}
