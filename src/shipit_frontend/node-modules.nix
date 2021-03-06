# This file has been generated by node2nix 1.1.0. Do not edit!

{pkgs ? import <nixpkgs> {
    inherit system;
  }, system ? builtins.currentSystem, nodejs ? pkgs."nodejs-6_x"}:

let
  nodeEnv = import ./node-env.nix {
    inherit (pkgs) stdenv python utillinux runCommand writeTextFile;
    inherit nodejs;
  };
  nodeModules = import ./node-modules-generated.nix {
    inherit (pkgs) fetchurl fetchgit;
    inherit nodeEnv;
  };
in nodeModules // {
  mozilla-neo = nodeModules.mozilla-neo.override (old: {
    dontNpmInstall = true;
  });
}
