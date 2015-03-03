{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
  a = import ./pkgs/a {
    inherit (pkgs) stdenv bash;
  };

  b-deps-a = import ./pkgs/b-deps-a {
    inherit (pkgs) stdenv bash;
    inherit a;
  };
}
