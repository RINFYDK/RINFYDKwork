CONFFILES_${PN}_remove = " ${localstatedir}/lib/logrotate.status "

do_install_append() {
    install -d {D}${localstatedir}/lib/
    touch ${S}/logrotate.status
    echo "logrotate state" > ${S}/logrotate.status
    install -p -m 644 ${S}/logrotate.status {D}${localstatedir}/lib/
}

FILES_${PN} += " \
    ${localstatedir}/lib/* \
"
