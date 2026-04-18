{
  mainUser,
  ...
}:
{
  home = {
    claude.enable = true;
    common.enable = true;
    browser.firefox.enable = true;

    shell = {
      direnv.enable = true;
      fzf.enable = true;
      git.enable = true;
      tmux.enable = true;
      zsh.enable = true;
    };

    editor.nixvim.enable = true;

    terminal.kitty.enable = true;

    wm.aerospace.enable = true;
  };

  home = {
    username = mainUser;
    homeDirectory = "/Users/${mainUser}";
    stateVersion = "25.05";
  };
}
