{ stdenv, bash, a }:

stdenv.mkDerivation rec {
  version = "1.0";
  bare_name = "b-deps-a";
  name = "${bare_name}-${version}";

  phases = [ "installPhase" ];

  buildInputs = [ bash a ];

  installPhase = ''
    mkdir -p $out/bin

    echo -e "generating source\n\t$out/bin/b.sh\n"
    cat <<EOF > $out/bin/b.sh
#!${bash}/bin/bash

source ${a}/lib/a.lib

function hello_wrapper() {
  hello_world "B"
}

hello_wrapper
EOF

    chmod a+x $out/bin/b.sh
  '';
}
