SRC_URI += "${CMF_GIT_ROOT}/devices/raspberrypi/tdkb;protocol=${RDK_GIT_PROTOCOL};branch=${CCSP_GIT_BRANCH};destsuffix=git/platform/raspberrypi;name=tdkbraspberrypi"

SRCREV_tdkbraspberrypi = "${AUTOREV}"
do_fetch[vardeps] += "SRCREV_tdkbraspberrypi"
SRCREV_FORMAT = "tdk_tdkbraspberrypi"

do_install_append () {
    install -p -m 755 ${S}/platform/raspberrypi/agent/scripts/* ${D}${localstatedir}/TDK/
}
