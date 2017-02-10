FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = "\
       file://ccsp-common-library-wifi-cmf.patch \
"

do_install_append(){
    # install systemd services
    install -d ${D}${systemd_unitdir}/system
    install -D -m 0644 ${S}/systemd_units/CcspCMAgentSsp.service ${D}${systemd_unitdir}/system/CcspCMAgentSsp.service
}

SYSTEMD_SERVICE_${PN} += "CcspCMAgentSsp.service"

FILES_${PN}_append = " \
    ${systemd_unitdir}/system/CcspCMAgentSsp.service \
"
