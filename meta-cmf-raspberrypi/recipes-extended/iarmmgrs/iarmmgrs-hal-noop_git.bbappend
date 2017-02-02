# satisfy configure dependency
do_configure_prepend_rpi() {
    ## satisfy configure errors
    touch ${S}/NEWS
    touch ${S}/README
    touch ${S}/AUTHORS
    touch ${S}/ChangeLog
}
