FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://lighttpd_1.5.conf \
    file://0001-bind-to-interface-in-lighttpd.patch \
"

DEPENDS_append = " openssl"
EXTRA_OECONF_append = " --without-bzip2  --without-mysql --with-openssl"
CFLAGS_append = " -DSO_BINDTODEVICE"

RDEPENDS_${PN} += " \
    lighttpd-module-proxy-core \
    lighttpd-module-proxy-backend-http \
    lighttpd-module-proxy-backend-fastcgi \
"

SYSTEMD_SERVICE_${PN} = ""

do_install_append() {
    install -d ${D}${sysconfdir}
    install -m 777 ${WORKDIR}/lighttpd_1.5.conf ${D}${sysconfdir}/lighttpd.conf
}
