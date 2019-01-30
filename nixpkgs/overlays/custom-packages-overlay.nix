self: super:
let
  inherit (self) pkgs;
in {
  customPackages = pkgs.callPackage ../pkgs/all-packages.nix {};
}
