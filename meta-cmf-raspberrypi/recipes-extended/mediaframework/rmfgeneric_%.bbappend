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

FILESEXTRAPATHS_prepend := "${THISDIR}/${BPN}:"

require rmfgeneric-rpi.inc

SRCREV_FORMAT = "rmfgeneric_rdkemulator"

SRC_URI_append = "${RDK_GENERIC_ROOT_GIT}/mediaframework/devices/intel-x86-pc/rdkri;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH};destsuffix=git/rdkri;name=rdkemulator"

CFLAGS += "-DRDK_EMULATOR  -DRMF_OSAL_LITTLE_ENDIAN -DDISABLE_XFS -DUSE_OOBMGR -DDISABLE_INBAND_MGR -DQAMSRC_FACTORY -UTEST_WITH_PODMGR -DSNMP_IPC_CLIENT -UIPPV_CLIENT_ENABLED -DUSE_POD_IPC -DUSE_PXYSRVC -UUSE_NEW_MSPOD_DRIVER -UUSE_CDL_SERVICE -UCOMMON_DOWNLOAD"

CXXFLAGS += "-DRDK_EMULATOR  -DRMF_OSAL_LITTLE_ENDIAN -DDISABLE_XFS -DUSE_OOBMGR -DDISABLE_INBAND_MGR -DQAMSRC_FACTORY -UTEST_WITH_PODMGR -DSNMP_IPC_CLIENT -UIPPV_CLIENT_ENABLED -DUSE_POD_IPC -DUSE_PXYSRVC -UUSE_NEW_MSPOD_DRIVER -UUSE_CDL_SERVICE -UCOMMON_DOWNLOAD"

CFLAGS_append_hybrid = " -I${S}/rdkri/soc_qamsource/sectionfilter/include"
CXXFLAGS_append_hybrid = " -I${S}/rdkri/soc_qamsource/sectionfilter/include"

CFLAGS_remove = "-DGLI"
CFLAGS_remove = "-DOOBSI_SUPPORT"
CFLAGS_remove = "-DQAMSRC_PMTBUFFER_PROPERTY"
CFLAGS_remove = "-DUSE_FRONTPANEL"
CFLAGS_remove = "-DUSE_FPTEXT"
CFLAGS_remove = "-DUSE_FPLED"
CFLAGS_remove = "-DUSE_TRM"

CXXFLAGS_remove = "-DGLI"
CXXFLAGS_remove = "-DOOBSI_SUPPORT"
CXXFLAGS_remove = "-DQAMSRC_PMTBUFFER_PROPERTY"
CXXFLAGS_remove = "-DUSE_FRONTPANEL"
CXXFLAGS_remove = "-DUSE_FPTEXT"
CXXFLAGS_remove = "-DUSE_FPLED"
CXXFLAGS_remove = "-DUSE_TRM"

LDFLAGS_append = " \
    -lIARMBus \
    "

do_install_append() {

    install -d ${D}${bindir} ${D}/opt ${D}${sysconfdir}

    install -m 0755 ${S}/rdkri/rmfconfig.ini ${D}${bindir}
    install -m 0755 ${S}/rdkri/rmfconfig.ini ${D}${sysconfdir}
    install -m 0755 ${S}/rdkri/rmfconfig.ini ${D}/opt
    install -m 0755 ${S}/rdkri/debug.ini ${D}${bindir}
    install -m 0755 ${S}/rdkri/dmslocation.dat ${D}${bindir}
    install -m 0755 ${S}/rdkri/hn_service_settings.conf ${D}/opt
    install -m 0755 ${S}/rdkri/sidb.xml ${D}${bindir}
    install -m 0755 ${S}/rdkri/tune.config ${D}${bindir}
    install -m 0755 ${S}/rdkri/channel_info.config ${D}${bindir}
    install -m 0755 ${S}/rdkri/bitrate.config ${D}${bindir}
    install -m 0755 ${S}/rdkri/wbdevice.dat ${D}${bindir}
    install -m 0755 ${S}/rdkri/hdhomerun.config ${D}${bindir}
}

FILES_${PN} += "/opt/*"

