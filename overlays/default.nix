{ nixpkgs-unstable, system, packagesConfig }:
{
  unstable-packages = final: _: {
    unstable = import nixpkgs-unstable {
      inherit system;
      config = packagesConfig;
    };
  };
}
