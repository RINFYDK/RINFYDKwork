# Modify PACKAGECONFIG to remove dependency over libgudev
# in order to resolve cyclic dependency with systemd_216
PACKAGECONFIG[gudev]      = "--without-gudev"
