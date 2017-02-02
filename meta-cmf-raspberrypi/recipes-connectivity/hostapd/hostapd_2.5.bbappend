FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SYSTEMD_AUTO_ENABLE_${PN} = "enable"
SRC_URI_append = " 		 \
    file://hostapd0.conf \
    file://hostapd1.conf \
    file://sec_file.txt  \
    file://hostapd.service \
	file://hostapd_start.sh \
	file://defconfig \
"

do_install_append() {
    install -d ${D}${sysconfdir}
    install -d ${D}${prefix}/hostapd
    install -m 755 ${WORKDIR}/hostapd0.conf ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/hostapd1.conf ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/sec_file.txt ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
	install -m 755 ${WORKDIR}/hostapd_start.sh ${D}${prefix}/hostapd/
}

FILES_${PN} += "${prefix}/hostapd/hostapd_start.sh"
