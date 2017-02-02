# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================

do_install_append_hybrid() {
        install -m 0755 ${S}/../lib/rdk/lighttpd-setup.sh ${D}${base_libdir}/rdk
		sed -i -e 's/DEVICE_TYPE=mediaclient/DEVICE_TYPE=hybrid/' ${D}${sysconfdir}/device.properties
}

