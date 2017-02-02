do_install_append() {
    #copy as udhcpc.script as required by RDK
    if grep "CONFIG_UDHCPC=y" ${B}/.config; then
        install -d ${D}${sysconfdir}
        install -m 0755 ${WORKDIR}/simple.script ${D}${sysconfdir}/udhcpc.script
        sed -i "s:/SBIN_DIR/:${base_sbindir}/:" ${D}${sysconfdir}/udhcpc.script
    fi
}
