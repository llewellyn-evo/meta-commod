DESCRIPTION = "erlang package for evologics systems"
LICENSE = "MIT"

inherit packagegroup

RDEPENDS_${PN} = " 						\
     erlang 			               \
     erlang-sasl 		               \
     erlang-stdlib 		               \
     erlang-kernel 		               \
     erlang-erts 		               \
     erlang-crypto		               \
"
