PACKAGECONFIG_remove = "systemd"

do_install_append() {
    sed -i 's/ --address=systemd://' ${D}${systemd_system_unitdir}/dbus.service
}
