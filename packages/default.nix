{ lib }:
{
  config = {
    allowUnfree = false;
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
        "vscode-extension-*"
      ];
    allowBroken = false;
  };
}
