do_install_append() {
    # Config files and scripts
    # delete files that are installed by some other package
    rm -f ${D}/usr/include/ccsp/cosa_apis.h
    rm -f ${D}/usr/include/ccsp/cosa_apis_busutil.h
    rm -f ${D}/usr/include/ccsp/cosa_dml_api_common.h
}

