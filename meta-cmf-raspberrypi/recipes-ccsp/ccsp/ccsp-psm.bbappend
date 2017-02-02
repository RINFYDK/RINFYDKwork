require ccsp_common_rpi.inc

do_configure_append() {
    install -m 644 ${S}/source-arm/psm_hal_apis.c -t ${S}/source/Ssp
}

do_install_append() {
    # Config files and scripts
    install -m 644 ${S}/config/bbhm_def_cfg_arm.xml ${D}/usr/ccsp/config/bbhm_def_cfg.xml
    install -m 755 ${S}/scripts/bbhm_patch.sh ${D}/usr/ccsp/psm/bbhm_patch.sh
}
