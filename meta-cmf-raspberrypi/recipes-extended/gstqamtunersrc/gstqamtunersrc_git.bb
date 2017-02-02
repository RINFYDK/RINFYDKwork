#
# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================
#
SUMMARY = "RDK playersinkbin Gstreamer plugins implementation for RDK emulator"
DESCRIPTION = "RDK playersinkbin for genric mediaplayersink "

SECTION = "console/utils"

LICENSE = "CLOSED"

DEPENDS += "libtinyxml e2fsprogs rmfgeneric gstreamer hdhomerun"

PR = "r0"
SRCREV = "${AUTOREV}"
PV = "${RDK_RELEASE}+git${SRCPV}"

SRC_URI = "${RDK_GENERIC_ROOT_GIT}/gst-plugins-rdk/soc/intel-x86-pc/rdkemulator/qamtunersrc;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH}"
S = "${WORKDIR}/git"

FILES_${PN} += "${libdir}/gstreamer-*/*.so"
FILES_${PN}-dev += "${libdir}/gstreamer-*/*.la"
FILES_${PN}-dbg += "${libdir}/gstreamer-*/.debug/*"
FILES_${PN}-staticdev += "${libdir}/gstreamer-*/*.a "

DEPENDS += "${@base_contains('DISTRO_FEATURES', 'gstreamer1', 'gstreamer1.0', 'gstreamer', d)}"

ENABLE_GST1 = "--enable-gstreamer1=${@base_contains('DISTRO_FEATURES', 'gstreamer1', 'yes', 'no', d)}"
EXTRA_OECONF = " ${ENABLE_GST1}"

CFLAGS += " -I${PKG_CONFIG_SYSROOT_DIR}${includedir}/hdhomerun"

LIB_DIRS += "-L${PKG_CONFIG_SYSROOT_DIR}/lib"
LDFLAGS += "${LIB_DIRS} -lhdhomerun"

INSANE_SKIP_${PN} = "dev-deps"

inherit autotools pkgconfig
