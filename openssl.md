# Installing OpenSSL 3.5+

Many Operating systems still come with older openssl versions that have no PQC algorithm support.
```text
$ openssl version
OpenSSL 3.0.13 30 Jan 2024 (Library: OpenSSL 3.0.13 30 Jan 2024)
```


## Option A: Instant via Docker
If you have Docker installed, you can alias openssl to a container with post-quantum support with zero build time:

```
alias openssl='docker run --rm -v "${PWD}":/work -w /work openquantumsafe/curl openssl'
```

2. Test
```bash
openssl version
openssl list -signature-algorithms | grep -i mldsa
```
Output:
```text
OpenSSL 3.4.0 22 Oct 2024 (Library: OpenSSL 3.4.0 22 Oct 2024)
  mldsa87_bp384 @ oqsprovider
  p521_mldsa87 @ oqsprovider
  mldsa87 @ oqsprovider
  mldsa87_p384 @ oqsprovider
  mldsa87_ed448 @ oqsprovider
  mldsa65_p256 @ oqsprovider
  mldsa65_pss3072 @ oqsprovider
  p384_mldsa65 @ oqsprovider
  mldsa65_rsa3072 @ oqsprovider
  mldsa65_bp256 @ oqsprovider
  mldsa44_p256 @ oqsprovider
  mldsa44_ed25519 @ oqsprovider
  mldsa44_bp256 @ oqsprovider
  mldsa44_pss2048 @ oqsprovider
  p256_mldsa44 @ oqsprovider
  mldsa44 @ oqsprovider
  rsa3072_mldsa44 @ oqsprovider
  mldsa44_rsa2048 @ oqsprovider
  mldsa65 @ oqsprovider
  mldsa65_ed25519 @ oqsprovider
```

3. Remove / Revert
To revert back to your host machine's original OpenSSL:

```bash
unalias openssl
docker rmi openquantumsafe/curl
```

## Option B: Fast Source Build

1. Install & Build
```bash
sudo apt-get update && sudo apt-get install -y build-essential
git clone --depth 1 --branch openssl-3.5.0 https://github.com/openssl/openssl.git
cd openssl
./config --prefix="${HOME}/openssl35" no-tests no-docs
make -j$(nproc)
make install_sw
cd ..
# Add to your current shell session
export PATH="${HOME}/openssl35/bin:${PATH}"
export LD_LIBRARY_PATH="${HOME}/openssl35/lib64:${LD_LIBRARY_PATH}"
```

2. Test
```bash
openssl version
openssl list -signature-algorithms | grep -i mldsa
```
Output:
```text
OpenSSL 3.5.0 8 Apr 2025 (Library: OpenSSL 3.5.0 8 Apr 2025)
  { 2.16.840.1.101.3.4.3.17, id-ml-dsa-44, ML-DSA-44, MLDSA44 } @ default
  { 2.16.840.1.101.3.4.3.18, id-ml-dsa-65, ML-DSA-65, MLDSA65 } @ default
  { 2.16.840.1.101.3.4.3.19, id-ml-dsa-87, ML-DSA-87, MLDSA87 } @ default
```

3. Remove / Revert
To remove the custom build and revert back to system OpenSSL:

```bash
# 1. Remove the build directory and source repo
rm -rf "${HOME}/openssl35" ./openssl
```

# 2. Revert PATH and LD_LIBRARY_PATH in your current session (or start a new shell)
```
export PATH=$(echo "${PATH}" | sed -e "s|${HOME}/openssl35/bin:||g")
export LD_LIBRARY_PATH=$(echo "${LD_LIBRARY_PATH}" | sed -e "s|${HOME}/openssl35/lib64:||g")
```
Verify you are back on the system version:

```
openssl version
```
