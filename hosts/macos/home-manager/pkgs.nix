{ pkgs, ... }:
{
  home.packages = with pkgs; [
    zathura
    gemini-cli
  ];
}
