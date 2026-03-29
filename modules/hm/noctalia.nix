{ pkgs, inputs, ... }:
{
  # install package
  home.packages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}