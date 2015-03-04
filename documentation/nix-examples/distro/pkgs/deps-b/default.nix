{ stdenv, bash, deps-a }:

stdenv.mkDerivation rec {
  version = "1.0";
  bare_name = "deps-b";
  name = "${bare_name}-${version}";

  phases = [ "installPhase" ];

  buildInputs = [ bash deps-a ];

  installPhase = ''
    mkdir -p $out/bin

    echo -e "generating source\n\t$out/bin/b.sh\n"
    cat <<EOF > $out/bin/b.sh
#!${bash}/bin/bash

source ${deps-a}/lib/a.lib

function hello_wrapper() {
  hello_world "B"
}

hello_wrapper
EOF

    chmod a+x $out/bin/b.sh
  '';
}
