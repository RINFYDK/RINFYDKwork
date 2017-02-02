require ccsp_common_rpi.inc

do_install_append() {
    # Config files and scripts
    install -m 644 ${S}/config/cr-deviceprofile_arm.xml ${D}/usr/ccsp/cr-deviceprofile.xml
}
