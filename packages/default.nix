{ lib }:
{
  config = {
    allowUnfree = false;
    allowUnfreePredicate =
      pkg:
      builtins.elem (lib.getName pkg) [
        "discord"
      ];
    allowBroken = false;
  };
}
