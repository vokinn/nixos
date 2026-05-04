{
  pkgs,
  codex,
  gemini-cli-nix,
  ...
}:
{
  home.packages = with pkgs; [
    librewolf
    vesktop
    sioyek

    # dev tools
    neovim
    lazygit
    codeberg-cli
    qemu
    git
    gh
    codex.packages.${pkgs.stdenv.hostPlatform.system}.default
    gemini-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default

    # languages and toolchains
    cargo
    rustc
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
    ghostty
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
