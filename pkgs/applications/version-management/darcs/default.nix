# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, curl, extensibleExceptions, filepath, hashedStorage
, haskeline, html, HTTP, mmap, mtl, network, networkUri, parsec
, random, regexCompat, tar, terminfo, text, utf8String, vector
, zlib
}:

cabal.mkDerivation (self: {
  pname = "darcs";
  version = "2.8.5";
  sha256 = "16g3ayw0wwhkjpprlkzi971ibs4dp152bmaa487512cwb3ni0hq6";
  isLibrary = true;
  isExecutable = true;
  doCheck = false;
  buildDepends = [
    extensibleExceptions filepath hashedStorage haskeline html HTTP
    mmap mtl network networkUri parsec random regexCompat tar terminfo
    text utf8String vector zlib
  ];
  extraLibraries = [ curl ];
  postInstall = ''
    mkdir -p $out/etc/bash_completion.d
    mv contrib/darcs_completion $out/etc/bash_completion.d/darcs
  '';
  patchPhase = ''
    sed -i -e 's|random.*==.*|random|' -e 's|text.*>=.*,|text,|' darcs.cabal
  '';
  meta = {
    homepage = "http://darcs.net/";
    description = "a distributed, interactive, smart revision control system";
    license = "GPL";
    platforms = self.ghc.meta.platforms;
    maintainers = [ self.stdenv.lib.maintainers.andres ];
  };
})
