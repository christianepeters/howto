# My first Python project using Google IDX

## Resources

* Project IDX: https://idx.google.com/

* https://developers.google.com/idx/guides/customize-idx-env


## Getting Started

1. I started from a [blank workspace template](https://idx.google.com/new/blank).

2. In the terminal I typed

    ```
    python -v
    ```
    The IDE responded that python was not installed and offered me a one-time access to use e.g., python3 etc. Same when calling pip on the command line.

3. The IDE suggested to add those packages to the workspace by adding `pkgs.python311` and `pkgs.python311Packages.pip` to the `packages` section in [.idx/dev.nix](.idx/dev.nix) and then rebuild the workspace.

4. I created a new project folder and installed the [Tink library](https://developers.google.com/tink) 
    ```
    python3 -m venv env
    pip3 --version
    source env/bin/activate 
    # remember to finish off with ‘deactivate’ later
    pip3 install tink==1.10.0
    ```

5. When I tried to run my first program it stopped with an error.

    ```
    ImportError: libstdc++.so.6: cannot open shared object file: No such file or directory
    ```

    I found the solution [here](https://community.idx.dev/t/importerror-libstdc-so-6/2190) which is to add a path in the [nix file](.idx/dev.nix) in environment variables section.

    ```
    # Sets environment variables in the workspace
    env = {
        LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";
    };
    ```

5. Connect workspace to a Github repository.

    ```
    git init
    git branch -M main
    git remote add origin https://github.com/christianepeters/tink-playground.git
    git add .gitignore 
    git add src/aead.py 
    git commit -am "test files"
    git push -u origin main
    ```
6. When pushing to the main branch the IDE will initiate an authorization request with a one-time password. I also had to confirm login to my account using Github 2-factor auth.