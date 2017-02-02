DEPENDS_remove = " perl-native-runtime "
# Another unclean way till we keep supporting R-Pi builds < krogoth builds
DEPENDS_append = "  ${@bb.utils.contains('ASSUME_PROVIDED', 'hostperl-runtime-native', 'hostperl-runtime-native', 'perl-native-runtime', d)} "
