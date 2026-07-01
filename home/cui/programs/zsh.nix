{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "refined";
      plugins = [
        "git"
        "ssh-agent"
      ];
    };

    zsh-abbr = {
      enable = true;
      abbreviations = {
        ls = "eza --icons=auto";
        la = "eza --icons=auto -a";
        ll = "eza --icons=auto -lh";
        lla = "eza --icons=auto -lha";
        lt = "eza --icons=auto --tree --level=2";
        lta = "eza --icons=auto --tree -a --git-ignore --level=2";
        rm = "rm -rf";
        cp = "cp -r";
        c = "clear";
        lg = "lazygit";
        rusti = "evcxr";
        drg = "ripdrag";
        o = "xdg-open";
      };
      globalAbbreviations = {
        wlc = "wl-copy";
        wlp = "wl-paste";
      };
    };

    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      eval "$(zoxide init zsh)"

      bindkey '^ ' forward-word

      # for refined theme
      any-nix-shell zsh --info-right | sed 's/precmd () {/& \nsetopt localoptions nopromptsubst\nvcs_info\nprint -P "\\n$(repo_information) %F{yellow}$(cmd_exec_time)%f"\nunset cmd_timestamp/' | source /dev/stdin

      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      zoxide_zi_insert() {
        local dir
        dir="$(zoxide query -i)" || return
        zle -U "$dir"
        zle reset-prompt
      }

      zle -N zoxide_zi_insert
      bindkey '^G' zoxide_zi_insert
    '';
  };
}
