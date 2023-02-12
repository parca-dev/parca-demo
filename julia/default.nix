{ pkgs ? import
    (builtins.fetchTarball
      "https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz"
    )
    { }
}:

pkgs.dockerTools.streamLayeredImage {
  name = "parca-demo";
  tag = "julia";
  contents = [
    (pkgs.julia.overrideAttrs (current: {
      patches = current.patches ++ [
        ./patches/0001-disable-frame-pointer-omission.patch
      ];
      doInstallCheck = false;
    }))
    (pkgs.writeTextDir "app/main.jl" (builtins.readFile ./main.jl))
  ];
  config = {
    Cmd = [ "julia" "main.jl" ];
    Env = [ "ENABLE_JITPROFILING=1" ];
    WorkingDir = "/app";
  };
}
