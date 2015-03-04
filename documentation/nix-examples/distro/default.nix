{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
in
rec {
  deps-a = import ./pkgs/deps-a {
    inherit (pkgs) stdenv bash;
  };

  deps-b = import ./pkgs/deps-b {
    inherit (pkgs) stdenv bash;
    inherit deps-a;
  };

  multi-ver-a = import ./pkgs/multi-ver-a {
    inherit (pkgs) stdenv;
  };

  multi-ver-b = import ./pgks/multi-ver-b {
    inherit (pkgs) stdenv;
    inherit multi-ver-a;
  };
}
