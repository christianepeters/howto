# Install Vault

## Download

* Follow instructions on Vault website https://learn.hashicorp.com/vault?track=getting-started#getting-started

* Download Vault from 
    https://www.vaultproject.io/downloads.html

### Linux

* On Linux (e.g., Ubuntu) unzip and move to `/usr/local/bin/`

~~~~
$ unzip vault_1.3.0_linux_amd64.zip
$ sudo mv vault /usr/local/bin/
~~~~

* Test that the variables are set correctly

~~~~
$ vault
$ vault -version
~~~~

### Mac

* Use Homebrew on macOS

~~~~
$ brew update
$ brew install vault
==> Downloading https://homebrew.bintray.com/bottles/vault-1.3.1.catalina.bottle
==> Downloading from https://akamai.bintray.com/1e/1ed9c5a094f555814cd9d502e319a
######################################################################## 100.0%
==> Pouring vault-1.3.1.catalina.bottle.tar.gz
   /usr/local/Cellar/vault/1.3.1: 6 files, 124.2MB
~~~~

* Check version

~~~~
$ vault -version
Vault v1.3.1
~~~~

* Install bash completions

~~~~
$ vault -autocomplete-install
~~~~

=> doesn't work on Mac

* Restart terminal and reload shell:

~~~~
$ exec $SHELL
~~~~


##  Starting the Server

* Start vault dev server (runs in terminal only; not for
  production environments.

~~~~
$ vault server -dev
==> Vault server configuration:

            Api Address: http://127.0.0.1:8200
                    Cgo: disabled
        Cluster Address: https://127.0.0.1:8201
             Listener 1: tcp (addr: "127.0.0.1:8200", cluster address: "127.0.0.1:8201", max_request_duration: "1m30s", max_request_size: "33554432", tls: "disabled")
              Log Level: info
                  Mlock: supported: true, enabled: false
          Recovery Mode: false
                Storage: inmem
                Version: Vault v1.3.0

WARNING! dev mode is enabled! In this mode, Vault runs
entirely in-memory and starts unsealed with a single unseal
key. The root token is already authenticated to the CLI, so
you can immediately begin using Vault.
	
You may need to set the following environment variable:

    $ export VAULT_ADDR='http://127.0.0.1:8200'

The unseal key and root token are displayed below in case you want to
seal/unseal the Vault or re-authenticate.

Unseal Key: 4ML5Hwo6OLxiG0dnrXGAvByBm+crg5EZUA5eR2+nNf8=
Root Token: s.yO5LwtMopKSoprBpmd5ovDuP

Development mode should NOT be used in production installations!
~~~~

## Test deployment; open new terminal

* Copy the export command from the terminal output

~~~~
$ export VAULT_ADDR='http://127.0.0.1:8200'
~~~~

* Save the unseal key somewhere

~~~~
$ echo "4ML5Hwo6OLxiG0dnrXGAvByBm+crg5EZUA5eR2+nNf8=" >> unseal.key
~~~~

* Export root token 

~~~~
$ export VAULT_DEV_ROOT_TOKEN=s.yO5LwtMopKSoprBpmd5ovDuP
~~~~

* Check status

~~~~
$ vault status
	Key             Value
	---             -----
	Seal Type       shamir
	Initialized     true
	Sealed          false
	Total Shares    1
	Threshold       1
	Version         1.3.0
	Cluster Name    vault-cluster-1faa34da
	Cluster ID      2e74a621-3824-c10b-2d5c-a9da174bd734
	HA Enabled      false
~~~~


## My first secret

* Use vault kv command to write a secret

~~~~
$ vault kv put secret/hello foo=world
	Key              Value
	---              -----
	created_time     2020-01-03T13:20:33.56275702Z
	deletion_time    n/a
	destroyed        false
	version          1
~~~~

* Update secret with more info

~~~~
$ vault kv put secret/hello foo=world
~~~~

* Update secret with more info

~~~~
$ vault kv put secret/hello foo=world excited=yes
	Key              Value
	---              -----
	created_time     2020-01-03T13:45:32.662106255Z
	deletion_time    n/a
	destroyed        false
	version          3
	
~~~~


* Get secret

~~~~
vault kv get secret/hello
	====== Metadata ======
	Key              Value
	---              -----
	created_time     2020-01-03T13:45:32.662106255Z
	deletion_time    n/a
	destroyed        false
	version          3
	
	===== Data =====
	Key        Value
	---        -----
	excited    yes
	foo        world
~~~~


* Print value of a given field:

~~~~
$ vault kv get -field=excited secret/hello

yes
~~~~

* JSON output

~~~~
$ vault kv get -format=json secret/hello | jq -r .data.data.excited

yes
~~~~


* Delete secret

~~~~
$ vault kv delete secret/hello
Success! Data deleted (if it existed) at: secret/hello
~~~~


## Secrets Engines

TODO https://learn.hashicorp.com/vault/getting-started/secrets-engines

