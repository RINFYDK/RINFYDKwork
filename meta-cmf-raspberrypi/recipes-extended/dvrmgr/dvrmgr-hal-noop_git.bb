# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================
SUMMARY = "DVRMGR no OP HAL sample implementation"
SECTION = "console/utils"

LICENSE = "CLOSED"
PV = "${RDK_RELEASE}+git${SRCPV}"

PV = "${RDK_RELEASE}+gitr${SRCPV}"
SRC_URI = "${RDK_GENERIC_ROOT_GIT}/mediaframework/devices/intel-x86-pc/rdkri;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH}"

S = "${WORKDIR}/git/dvr/common/dvrmgr/soc"

PROVIDES = "virtual/dvrmgr-hal"

DEPENDS="rmfgenericheaders util-linux"

LDFLAGS += "-luuid"

inherit autotools
