let
  pkgs = import <nixpkgs> { };
in {
  dwl = pkgs.callPackage ./dwl-nullptr.nix { };
}
