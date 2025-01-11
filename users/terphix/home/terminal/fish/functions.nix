{
  programs.fish.functions = {
    # Fish standart commands
    __fish_command_not_found_handler = {
      body = ''echo "What a hell? Bruh... I don't know what it is: $argv"'';
      onEvent = "fish_command_not_found";
    };

    fish_greeting = "";
  };
}
