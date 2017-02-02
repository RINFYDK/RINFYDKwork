do_deploy_append() {
    # fix to enable audio with 4.4 kernel
    echo "dtparam=audio=on" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
    echo "dtoverlay=lirc-rpi" >> ${DEPLOYDIR}/bcm2835-bootfiles/config.txt
}
