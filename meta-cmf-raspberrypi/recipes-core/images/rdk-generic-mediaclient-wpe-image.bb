# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2016 RDK Management, LLC. All rights reserved.
# ============================================================================

require ${RDKROOT}/meta-rdk/recipes-core/images/rdk-generic-mediaclient-image.bb

IMAGE_FEATURES_remove_rpi = "read-only-rootfs"

IMAGE_INSTALL_append = " \
    lirc \
    packagegroup-ml-wpe \
"

# Only compile WPE browser, remove QT
IMAGE_INSTALL_remove = " \
    packagegroup-rdk-qt5 \
"
