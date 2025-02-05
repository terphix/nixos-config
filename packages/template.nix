{
  stdenv,
  fetchFromGithub,
  gcc,
  make,
  pkgconfig,
  binutils,
}:
stdenv.mkDerivation rec {
  pname = "an-app";
  version = "1.0.0";

  src = fetchFromGithub {
    owner = "someone";
    repo = pname;
    rev = "v${version}";
    sha256 = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
  };

  buildInputs = [
    gcc
    make
    pkgconfig
    binutils
  ];

  meta = with stdenv.lib; {
    description = "My app";
    homepage = "https://github.com/github-owner/${pname}";
    license = licenses.mit;
    platforms = platform.unix;
  };
}
