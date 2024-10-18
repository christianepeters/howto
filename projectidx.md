# My first Python project using Google IDX

## Resources

* Project IDX: https://idx.google.com/

* https://developers.google.com/idx/guides/customize-idx-env


## Getting Started

1. I started from an blank workspace template.

2. In the terminal I typed

    ```
    install python
    install pip
    ```
    The IDE suggested the packages I needed and I installed them.

3. Then the IDE suggested to make the changes permanent by adding `pkgs.python311` and `pkgs.python311Packages.pip` to the `packages` section in [.idx/dev.nix](.idx/dev.nix) and then rebuild the workspace.

4. I installed the [Tink library](https://developers.google.com/tink) and when I tried to run my first program it stopped with an error.

    ```
    error "ImportError: libstdc++.so.6:"
    ```

    I found the solution [here](https://community.idx.dev/t/importerror-libstdc-so-6/2190) which is to add a path in the [nix file](.idx/dev.nix) in environment variables section.

    ```
    # Sets environment variables in the workspace
    env = {
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
    ```

5. Connect to Github, paste the one-time verification code in IDX into the authorization request, then confirm using Github 2-factor auth.


