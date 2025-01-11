{
  system,
  nixpkgs-stable,
  nixpkgs-master,
  packagesConfig,
}:
{
  stable-packages = final: _: {
    stable = import nixpkgs-stable {
      inherit system;
      config = packagesConfig;
    };
  };

  master-packages = final: _: {
    master = import nixpkgs-master {
      inherit system;
      config = packagesConfig;
    };
  };
}
