# Code-server : portable IDE

Code-server project:
* Run Visual Studio Code (Open Source) in a browser:

Packaged up as container
https://medium.com/oracledevs/remote-software-development-with-code-server-1d742dacbc5
 
docker run -it -p 127.0.0.1:8443:8443 -v "${PWD}:/home/coder/project" codercom/code-server --allow-http --no-auth
