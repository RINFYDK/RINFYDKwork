require recipes-ccsp/ccsp/ccsp_common_rpi.inc

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append = " \
    file://0001-dhcpv4c-api.patch \
    file://0002-platform-api.patch \
    file://0003-wifi_Makefile.am.patch \
"


do_compile_prepend(){
rm ${WORKDIR}/git/source/wifi/wifi_hal.c
rm ${WORKDIR}/git/include/wifi_hal.h
ln -sf ${RDK_ROOT_PATH}/rdkb/devices/raspberrypi/hal/source/wifi/wifi_hal.c ${WORKDIR}/git/source/wifi/wifi_hal.c
ln -sf ${RDK_ROOT_PATH}/rdkb/devices/raspberrypi/hal/source/wifi/wifi_hostapd_interface.c ${WORKDIR}/git/source/wifi/wifi_hostapd_interface.c
ln -sf ${RDK_ROOT_PATH}/rdkb/devices/raspberrypi/hal/include/wifi_hal.h ${WORKDIR}/git/include/wifi_hal.h
}
