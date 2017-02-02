# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================

RDEPENDS_packagegroup-rdk-generic-mediaserver_remove = " \
    gtestapp \
    diagnostics-snmp2json \
	sys-utils \
	linux-fusion \
	directfb \
	power-state-monitor \
"
RDEPENDS_packagegroup-rdk-generic-mediaserver_remove_krogoth = "udhcpc-opt43"

RDEPENDS_packagegroup-rdk-generic-mediaserver_append = " \
    sysint \
    hdhomerun \
"
