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

EXTRA_OECONF_append_hybrid += " --enable-emulator-qam --enable-trm"
#EXTRA_OECONF_remove_hybrid += " --enable-recorder"


PACKAGECONFIG_remove_hybrid = "frontpanel ppv qam pod sdv"

SRC_URI += "${RDK_GENERIC_ROOT_GIT}/rmf_mediastreamer/devices/intel-x86-pc/rdkri;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH};destsuffix=git/platform/rdkemulator;name=mediastreamerplatx86"

do_fetch[vardeps] += "SRCREV_mediastreamerplatx86"

inherit systemd

do_install_append() {
    install -d ${D}${bindir}
    install -m 0755 ${S}/platform/rdkemulator/streamerSetup ${D}${bindir}

    install -d ${D}${systemd_unitdir}/system
    install -m 0644 ${S}/platform/rdkemulator/rmfstreamersetup.service ${D}${systemd_unitdir}/system/
    install -m 0644 ${S}/platform/rdkemulator/rmfstreamer.service ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE_${PN} += "rmfstreamersetup.service"
FILES_${PN} += "${systemd_unitdir}/system/rmfstreamersetup.service"
FILES_${PN} += "${bindir}/streamerSetup"
