# https://nix.dev/anti-patterns/

{ pkgs ? import <nixpkgs> { } }:

let
  inherit (pkgs) stdenv lib darwin mkShell nodePackages;
  inherit (darwin.apple_sdk.frameworks) CoreFoundation CoreServices;

in mkShell {
  buildInputs = [
    pkgs.html-tidy
    pkgs.nodejs
    pkgs.leiningen
    pkgs.openjdk11
    pkgs.clojure
    pkgs.clojure-lsp
    nodePackages.pnpm
    nodePackages.prettier
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.bash-language-server
    nodePackages.yaml-language-server
  ] ++ lib.optionals stdenv.isDarwin [ CoreFoundation CoreServices ];
}
