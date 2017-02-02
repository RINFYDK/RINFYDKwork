FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-resolved-mtd-prob-build-error.patch \
"
do_install_append_rpi() {
    sed -i -e 's/^Restart=always/Restart=no/' ${D}/lib/systemd/system/systemd-timesyncd.service
    sed -i -e 's/^WatchdogSec=1min/WatchdogSec=11\nTimeoutSec=10/' ${D}/lib/systemd/system/systemd-timesyncd.service
}
