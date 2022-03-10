{
  # inspired by: https://serokell.io/blog/practical-nix-flakes#packaging-existing-applications
  description = "Calculating pi in Haskell (badly)";
  inputs.nixpkgs.url = "nixpkgs";
  inputs.flake-compat = {
    url = github:edolstra/flake-compat;
    flake = false;
  };
  outputs = { self, nixpkgs, flake-compat }:
    let
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs supportedSystems (system: f system);
      nixpkgsFor = forAllSystems (system: import nixpkgs {
        inherit system;
        overlays = [ self.overlay ];
      });
    in
    {
      overlay = (final: prev: {
        hm-infer = final.haskellPackages.callCabal2nix "bms-pi" ./. { };
      });
      packages = forAllSystems (system: {
        hm-infer = nixpkgsFor.${system}.hm-infer;
      });
      defaultPackage = forAllSystems (system: self.packages.${system}.hm-infer);
      checks = self.packages;
      devShell = forAllSystems (system:
        let haskellPackages = nixpkgsFor.${system}.haskellPackages;
        in
        haskellPackages.shellFor {
          packages = p: [ self.packages.${system}.hm-infer ];
          # withHoogle = true;
          buildInputs = with haskellPackages; [
            haskell-language-server
            ghcid
            cabal-install
          ];
          # Change the prompt to show that you are in a devShell
          shellHook = "export PS1='\\e[1;34mdev > \\e[0m'";
        });
    };
}
