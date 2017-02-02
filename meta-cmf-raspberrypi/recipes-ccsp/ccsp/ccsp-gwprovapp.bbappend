require ccsp_common_rpi.inc

DEPENDS_remove = " ruli"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://ccsp-gw-provapp-rpi.patch \
    file://start_webgui_service.patch \
    file://crond.patch \
"

FILES_${PN} += " \
    /usr/bin/gw_prov_utopia \
"
