EXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI_append = "\
       file://hal.patch \
"
