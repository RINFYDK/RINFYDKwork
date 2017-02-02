require ccsp_common_rpi.inc

do_install_append() {
    # Config files and scripts
    install -m 644 ${S}/config-arm/CcspMtaAgent.xml ${D}/usr/ccsp/mta/CcspMtaAgent.xml
    install -m 644 ${S}/config-arm/CcspMta.cfg ${D}/usr/ccsp/mta/CcspMta.cfg
    install -m 644 ${S}/config-arm/CcspMtaLib.cfg ${D}/usr/ccsp/mta/CcspMtaLib.cfg
}
