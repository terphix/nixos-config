{
  userConfig,
  ...
}:
let
  inherit (userConfig.paths) config;
in
{
  programs.fish.functions = {
    # Fish standart commands
    __fish_command_not_found_handler = {
      body = ''echo "What a hell? Bruh... I don't know what it is: $argv"'';
      onEvent = "fish_command_not_found";
    };

    fish_greeting = "";

    rb = ''
      if test -d ${config}/secrets
        echo "Error: secrets dir exists!"
        return 1
      else if not test -d ${config}/sops-secrets
        echo "Error: sops-secrets dir doesn't exists"
        return 1
      else
        mkdir ${config}/secrets && \
        cp -r ${config}/sops-secrets/*.* ${config}/secrets/ && \
        git --git-dir ${config}/.git add ${config}/secrets/*.*
        
        switch $argv
          case "diff"
            rebuild-diff
          case "*"
            rebuild
        end
        
        git --git-dir ${config}/.git reset ${config}/secrets/*.* && \
        rm -rf ${config}/secrets
      end
    '';
  };
}
