BBMASK .= "|meta-rdk/recipes-qt/"
BBMASK .= "|meta-rdk/recipes-connectivity/openssl/"
BBMASK .= "|meta-rdk/recipes-rdkb/tdkb/"
BBMASK .= "|meta-rdk/recipes-extended/mediaframework/gtestapp_git.bb"
BBMASK .= "|meta-rdk/recipes-support/googletest/"
BBMASK .= "|meta-rdk/recipes-graphics/cairo/"
BBMASK .= "|meta-rdk/recipes-multimedia/libopus/libopus_1.0.2.bb"
BBMASK .= "|meta-rdk/recipes-extended/libqjson/libqjson-e_0.7.1.bb"
BBMASK .= "${@'' if "jethro" in d.getVar('DISTRO_CODENAME', True) else '|meta-rdk/recipes-extended/sys_mon_tools/udhcpc-opt43.bb'}"

BBMASK .= "|meta-metrological/recipes-qt/"
BBMASK .= "|meta-metrological/recipes-metrological/"
BBMASK .= "|meta-metrological/recipes-core/packagegroups/packagegroup-rpi-ml-middleware.bb"

BBMASK .= "|meta-openembedded/meta-oe/recipes-test/gtest"

BBMASK .= "|meta-cmf/recipes-devtools/cunit"
