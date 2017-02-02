# these patches do not apply correctly, revisit these in future
SRC_URI_remove_jethro = "\
    file://0006-wayland-egl-Add-bcm_host-to-dependencies.patch \
    file://0008-zero-out-wl-buffers-in-egl_surface_free.patch \
    file://0009-initialize-front-back-wayland-buffers.patch \
    file://0013-Fix-for-framerate-with-nested-composition.patch \
    file://0014-build-shared-library-for-vchostif.patch \
    file://0015-wl-dispmanx-buffer-wrapping.patch \
"

SRC_URI_remove_krogoth = "\
    file://0004-wayland-egl-Add-bcm_host-to-dependencies.patch \
    file://0006-zero-out-wl-buffers-in-egl_surface_free.patch \
    file://0007-initialize-front-back-wayland-buffers.patch \
    file://0011-Fix-for-framerate-with-nested-composition.patch \
    file://0012-build-shared-library-for-vchostif.patch \
    file://013-implement-buffer-wrapping-interface-for-dispmanx.patch \
"

DEPENDS += "freetype"

CFLAGS_append = "\
    -I${PKG_CONFIG_SYSROOT_DIR}/usr/include/freetype2 \
    -I${PKG_CONFIG_SYSROOT_DIR}/usr/include/ \
    -I${S} \
    -I${S}/interface/khronos/include \
    -I${S}/interface/vcos/pthreads \
    -I${S}/host_applications/linux/libs/bcm_host/include \
    -I${S}/interface/vmcs_host/linux \
"

LDFLAGS_append = "\
    ${PKG_CONFIG_SYSROOT_DIR}/lib/libpthread.so.0 \
    -L${PKG_CONFIG_SYSROOT_DIR}/usr/lib \
    -L${PKG_CONFIG_SYSROOT_DIR}/lib \
"

do_compile_append(){
    oe_runmake -C ${S}/host_applications/linux/apps/hello_pi/libs/vgfont
}

do_install_append(){
    install -d ${D}${libdir}
    install -d ${D}${includedir}
    install -m 644 ${S}/host_applications/linux/apps/hello_pi/libs/vgfont/vgfont.h ${D}${includedir}
    install -m 644 ${S}/host_applications/linux/apps/hello_pi/libs/vgfont/libvgfont.a ${D}${libdir}
}

FILES_${PN}_append = "\
    ${D}${include}/vgfont.h \
    ${D}${libdir}/libvgfont.a \
"

do_package_qa(){
}
