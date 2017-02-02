require ccsp_common_rpi.inc

DEPENDS_append = " utopia virtual/ccsp-hal curl "

SSTATE_DUPWHITELIST += "${STAGING_DIR_TARGET}/usr/include/middle_layer_src/"

CFLAGS_append = " \
    -I=${includedir}/utctx \
    -I=${includedir}/utapi \
"

LDFLAGS_remove = " \
    -lmoca_mgnt \
"

do_install_append(){
    # Config files and scripts
    install -m 644 ${S}/config-arm/CcspDmLib.cfg ${D}/usr/ccsp/pam/CcspDmLib.cfg
    install -m 644 ${S}/config-arm/CcspPam.cfg -t ${D}/usr/ccsp/pam
    install -m 644 ${S}/config-arm/TR181-USGv2.XML -t ${D}/usr/ccsp/pam
    install -m 755 ${S}/scripts/email_notification_monitor.sh ${D}/usr/ccsp/pam/email_notification_monitor.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/calc_random_time_to_reboot_dev.sh ${D}/usr/ccsp/pam/calc_random_time_to_reboot_dev.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/network_response.sh ${D}/usr/ccsp/pam/network_response.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/network_response.sh ${D}/etc/network_response.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/process_monitor.sh ${D}/usr/ccsp/pam/process_monitor.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/redirect_url.sh ${D}/usr/ccsp/pam/redirect_url.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/revert_redirect.sh ${D}/usr/ccsp/pam/revert_redirect.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/whitelist.sh ${D}/usr/ccsp/pam/whitelist.sh
    install -m 755 ${S}/arch/intel_usg/boards/arm_shared/scripts/moca_status.sh ${D}/usr/ccsp/pam/moca_status.sh

    install -m 777 ${D}/usr/bin/CcspPandMSsp -t ${D}/usr/ccsp/pam/

    install -d ${D}/fss/gw/usr/sbin
    ln -sf /sbin/ip.iproute2 ${D}/fss/gw/usr/sbin/ip
}

FILES_${PN}-ccsp += " \
    ${prefix}/ccsp/pam/CcspPandMSsp \
    /fss/gw/usr/sbin/ip \
"
