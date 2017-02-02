FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://remove-md4-dependency-for-rpi.patch \
    file://hostapd.conf \
"

do_patch() {
    # need to apply this patch explicity as the patch is applied
    # to a directory that is parent of the ${S} directory
    patch -p0 < ${WORKDIR}/remove-md4-dependency-for-rpi.patch
}

do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 755 ${WORKDIR}/hostapd.conf ${D}${sysconfdir}
}
