{
  description = "Darwin configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      home-manager,
      nix-darwin,
      ...
    }:
    let
      darwinSystem =
        { system, user }:
        let
          home = /Users/${user};
        in
        nix-darwin.lib.darwinSystem {
          inherit system;

          modules = [
            ./configuration.nix
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${user} = ./home.nix;

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
              home-manager.extraSpecialArgs = {
                inherit user home;
              };
            }
          ];

          specialArgs = {
            inherit
              self
              system
              user
              home
              ;
          };
        };
    in
    {
      darwinConfigurations.simple = darwinSystem {
        system = "aarch64-darwin";
        user = "minsub";
      };
    };
}
