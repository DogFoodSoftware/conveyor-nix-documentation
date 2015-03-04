{ stdenv, bash }:

stdenv.mkDerivation rec {
  version = "1.0";
  bare_name = "deps-a";
  name = "${bare_name}-${version}";

  phases = [ "installPhase" ];

  buildInputs = [ bash ];

  installPhase = ''
    mkdir -p $out/bin $out/lib

    echo -e "generating source\n\t$out/lib.lib"
    cat <<EOF > $out/lib/a.lib
function hello_world() {
  local SRC="\$1"
  if [ x"\$SRC" == x ]; then
    SRC="A"
  fi

  echo "Hello from '\$SRC'.";
}
EOF

    echo -e "\t$out/bin/a.sh\n"
    cat <<EOF > $out/bin/a.sh
#!${bash}/bin/bash

source $out/lib/a.lib

hello_world
EOF

    chmod a+x $out/bin/a.sh
  '';
}
