{ pkgs ? import <nixpkgs> {} }:
pkgs.stdenv.mkDerivation rec {
  name = "shcl";
  src = ./.;
  env = pkgs.buildEnv { name = name; paths = buildInputs; };
  buildInputs = [
    pkgs.sbcl
    pkgs.lispPackages.plump
  ];
  LD_LIBRARY_PATH = "${pkgs.stdenv.lib.makeLibraryPath buildInputs}";
}
