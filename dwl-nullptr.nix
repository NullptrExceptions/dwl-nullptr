{ 
    lib,
    stdenv,
    installShellFiles,
    libX11,
    libinput,
    libxcb,
    libxkbcommon,
    libdrm,
    pkg-config,
    pixman,
    wayland,
    wayland-protocols,
    wayland-scanner,
    wlroots,
    xcbutilwm,
    xwayland,
    gnumake,
    tllist,
    fcft
}:

stdenv.mkDerivation {
    name = "dwl-nullptr";
    src = ./src;

    nativeBuildInputs = [
        installShellFiles
        pkg-config
        gnumake
        fcft
    ];

    buildInputs = [
        libinput
        libxcb
        libxkbcommon
        libdrm
        pixman
        wayland
        wayland-protocols
        wlroots
        libX11
        xcbutilwm
        xwayland
        wayland-scanner
        tllist
    ];

    outputs = [ "out" "man" ];

    makeFlags = [
        "PKG_CONFIG=${stdenv.cc.targetPrefix}pkg-config"
        "WAYLAND_SCANNER=wayland-scanner"
        "PREFIX=$(out)"
        "MANDIR=$(man)/share/man"
    ];

    buildPhase = ''
        make clean
        make
    '';

    meta = {
        homepage = "https://github.com/nullptrexceptions/dwl-nullptr/";
        description = "Dynamic window manager for Wayland";
        license = lib.licenses.gpl3Only;
        inherit (wayland.meta) platforms;
        mainProgram = "dwl";
    };
}
