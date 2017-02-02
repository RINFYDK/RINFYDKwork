do_install_append_rpi() {
    install -d ${D}${systemd_unitdir}/system
    install -m 0755 ${S}/device/lib/rdk/* ${D}${base_libdir}/rdk
    install -m 0755 ${S}/device/systemd_units/* ${D}${systemd_unitdir}/system/
}

SYSTEMD_SERVICE_${PN}_append_rpi = "dropbear.service"

FILES_${PN}_append_rpi = " ${systemd_unitdir}/system/*"
