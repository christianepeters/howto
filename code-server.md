# Code-server : portable IDE

Code-server project:

* Run Visual Studio Code (Open Source) in a browser:
* Github: https://github.com/cdr/code-server

My preferred installation option is as container as described here:

https://registry.hub.docker.com/r/codercom/code-server/

Deploy as
```
mkdir -p ~/.config
docker run -it --name code-server -p 127.0.0.1:8080:8080 \
  -v "$HOME/.config:/home/coder/.config" \
  -v "$PWD:/home/coder/project" \
  -u "$(id -u):$(id -g)" \
  -e "DOCKER_USER=$USER" \
  codercom/code-server:latest
```

This will start a code-server container and expose it at http://127.0.0.1:8080.

It will also mount the current directory into the container as `/home/coder/project` and forward your `UID/GID` so that all file system operations occur outside the container.

The `$HOME/.config` is mounted at `$HOME/.config` within the container to ensure you can easily access/modify your code-server config in `$HOME/.config/code-server/config.json` outside the container.

