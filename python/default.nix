{ pkgs ? import
    (builtins.fetchTarball {
      # nixos-unstable on Sun, 12 Feb 2023 09:46:15 +0000
      url = "https://github.com/NixOS/nixpkgs/archive/d917136f550a8c36efb1724390c7245105f79023.tar.gz";
      sha256 = "sha256:1m6yfi2s89spqf4n79a7wnm5l7jahryrjszfkz3n542rynfx2pw1";
    })
    { }
}:

pkgs.dockerTools.streamLayeredImage {
  name = "parca-demo";
  tag = "python";
  contents = [
    (pkgs.python312.overrideAttrs (current: {
      preConfigure = current.preConfigure + ''
        export CFLAGS="$CFLAGS -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer"
      '';
    }))
    (pkgs.writeTextDir "app/main.py" (builtins.readFile ./main.py))
  ];
  extraCommands = "mkdir --mode=0777 tmp";
  config = {
    Cmd = [ "python" "main.py" ];
    Env = [ "PYTHONPERFSUPPORT=1" ];
    WorkingDir = "/app";
  };
}
