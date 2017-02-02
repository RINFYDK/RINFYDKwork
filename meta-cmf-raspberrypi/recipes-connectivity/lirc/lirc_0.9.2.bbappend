FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = " \
    file://lircd.conf \
    file://lirc_options.conf \
    file://lircd.service \
    file://0001-lircd-uinput-support.patch \
"

FILES_${PN} += "/etc/systemd \
    /etc/systemd/system \
    /etc/systemd/system/multi-user.target.wants \
    /etc/systemd/system/multi-user.target.wants/lircd.service \
"

SYSTEMD_SERVICE_${PN} += "lircd.service"
