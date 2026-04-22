{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    history = {
      path = "$HOME/.histfile";
      size = 1000;
      save = 1000;
    };

    defaultKeymap = "viins";
    autocd = true;
    completionInit = "autoload -Uz compinit && compinit";
    initContent = ''
      export EDITOR="nvim"
      export VISUAL="nvim"
    '';

    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos/#nixos";
      ls = "ls --color";
    };

    plugins = [
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
    ];

    syntaxHighlighting.enable = true;
    autosuggestion.enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_commit$git_state $git_status$character\n";
      continuation_prompt = "▶▶ ";
      right_format = "$nodejs$python$rust$golang$c$lua$zig$nix_shell$time$ocaml"; # trim to what you actually use

      directory = {
        disabled = false;
        format = "[$path](bold fg:#8be9fd)";
        truncate_to_repo = false;
      };

      git_branch.format = " [  $branch](fg:#9198a1)";
      git_status = {
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        format = "[[( $all_status$ahead_behind )](fg:#769ff0)]($style)";
        style = "bg:#394260";
      };

      nodejs = {
        detect_extensions = [ ];
        detect_files = [
          "package-lock.json"
          "yarn.lock"
        ];
        detect_folders = [ "node_modules" ];
        format = "[ ](bold bright-green)";
        version_format = "\${raw}";
      };

      python = {
        format = "[\${symbol}(\${virtualenv}) \${version}]($style)";
        style = "bold bright-yellow";
        symbol = "[ ](bold bright-blue)";
        version_format = "\${raw}";
      };

      rust = {
        style = "bold bright-red";
        format = " rs(italic) $symbol($style)";
        symbol = " ";
      };

      nix_shell = {
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        style = "bold italic dimmed blue";
        symbol = " ";
        unknown_msg = "[◌](bold dimmed yellow)";
      };

      time = {
        disabled = true;
        format = "[[  $time ](fg:#a0a9cb )]($style)";
        time_format = "%R";
      };

      aws.disabled = true;
      # ... rest of your language modules
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
