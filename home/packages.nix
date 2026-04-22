{ pkgs, codex, ... }:
{
  home.packages = with pkgs; [
    librewolf
    vesktop

    # dev tools
    neovim
    lazygit
    codeberg-cli
    git
    gh
    codex.packages.${pkgs.stdenv.hostPlatform.system}.default

    # languages and toolchains
    cargo
    nodejs_24
    tree-sitter
    gcc
    clang-tools
    gnumake
    llvm
    cmake
    ninja
    nixd
    nixfmt

    # terminal
    alacritty
    tmux
    yazi

    # wayland / compositor
    quickshell
    swaybg
    xwayland-satellite
    fuzzel

    # utilities
    ripgrep
    fzf
    btop
    mullvad-vpn
    wl-clipboard
    ghidra
    age
    sops
    bubblewrap
    unzip
    opencode
    stow

    # theming
    bibata-cursors
    adwaita-qt
    adwaita-qt6
    gnome-themes-extra

    # python
    python3
    python3Packages.pip
    python3Packages.ipython
    python3Packages.z3-solver
    python3Packages.capstone
    python3Packages.keystone-engine
    pyright
    ruff
  ];
}
