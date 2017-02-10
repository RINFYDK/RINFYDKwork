FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SYSTEMD_AUTO_ENABLE_${PN} = "enable"
SRC_URI_append = " \
    file://hostapd0.conf \
    file://hostapd1.conf \
    file://sec_file.txt \
    file://hostapd.service \
"

do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/hostapd0.conf ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/hostapd1.conf ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/sec_file.txt ${D}${sysconfdir}
    install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
}
