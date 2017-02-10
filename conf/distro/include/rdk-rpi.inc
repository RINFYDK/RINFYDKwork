QEMUVER_jethro = "2.4.0"
QEMUVER_krogoth = "2.5.0"

PREFERRED_VERSION_lighttpd = "1.5%"
PREFERRED_VERSION_dbus_jethro = "1.8.%"
PREFERRED_VERSION_dbus_krogoth = "1.10.%"

PREFERRED_VERSION_libnetfilter-conntrack = "1.0.4"
PREFERRED_VERSION_net-snmp = "5.7.3"
PREFERRED_PROVIDER_libevent = "libevent"

PREFERRED_VERSION_iksemel = "1.5"
PREFERRED_VERSION_libsoup-2.4_krogoth ?= "2.52.%"
PREFERRED_VERSION_systemd_krogoth = "216%"

PREFERRED_VERSION_gstreamer1.0_krogoth = "1.6.3"
PREFERRED_VERSION_gstreamer1.0-plugins-base_krogoth = "1.6.3"
PREFERRED_VERSION_gstreamer1.0-plugins-bad_krogoth = "1.6.3"
PREFERRED_VERSION_gstreamer1.0-plugins-good_krogoth = "1.6.3"
PREFERRED_VERSION_gstreamer1.0-plugins-ugly_krogoth = "1.6.3"

PREFERRED_VERSION_breakpad = "git"

IMAGE_FSTYPES_DEBUGFS = "tar.gz"

BBMASK .= "|meta-rdk/recipes-rdkb/tdkb/tdk-b.bb"
BBMASK .= "|openembedded-core/meta/recipes-core/dbus/dbus_1.4.14.bb"
BBMASK .= "|openembedded-core/meta/recipes-devtools/gcc/gcc-source_4.8.bb"

