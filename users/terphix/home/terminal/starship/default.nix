{ pkgs, ... }:
{
  programs.starship = {
    enable = true;
    package = pkgs.starship;
    enableFishIntegration = true;
  };
  programs.starship.settings = {
    add_newline = true;
    command_timeout = 500;
    continuation_prompt = "[∙](bright-black) ";
    format = "$username$hostname$directory$time$cmd_duration$line_break$character";
    right_format = "";
    scan_timeout = 30;

    character = {
      format = "$symbol ";
      disabled = false;
      success_symbol = "[->](bright-blue bold) ";
      error_symbol = "[✗](bright-red bold) ";
    };
    username = {
      format = "[$user]($style)";
      show_always = true;
      style_root = "red bold";
      style_user = "bright-green bold";
      disabled = false;
    };
    hostname = {
      disabled = false;
      format = "[$ssh_symbol](blue dimmed bold)[@$hostname ▶︎ ]($style) ";
      ssh_only = false;
      style = "cyan bold";
      trim_at = ".";
    };
    cmd_duration = {
      min_time = 2000;
      format = "[ ▶︎ $duration]($style) ";
      style = "green bold";
      show_milliseconds = false;
      disabled = false;
      show_notifications = false;
      min_time_to_notify = 45000;
    };
    time = {
      format = "[ ▶︎ $symbol $time]($style) ";
      style = "bright-blue bold";
      use_12hr = false;
      disabled = false;
      utc_time_offset = "local";
      time_format = "%R";
      time_range = "-";
    };
  };
}
