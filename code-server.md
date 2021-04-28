# Code-server : portable IDE

Code-server project:
* Run Visual Studio Code (Open Source) in a browser:
* Github: https://github.com/cdr/code-server

My preferred installation option is as container as described [in this article](https://medium.com/oracledevs/remote-software-development-with-code-server-1d742dacbc5).

DOES NOT WORK => INVESTIGATE
Launch as
```
docker run -it -p 127.0.0.1:8443:8443 -v "${PWD}:/home/coder/project" codercom/code-server --allow-http --no-auth
```
Then access the container in your browser http://127.0.0.1:8443 .

Make sure to sync your working directory from the container to your local disk to not lose any code.
