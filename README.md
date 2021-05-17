# Selfid-net Crypto

## How do I install these formulae?
`brew install selfid-net/crypto/<formula>`

Or `brew tap selfid-net/crypto` and then `brew install <formula>`.

Or install via URL (which will not receive updates):

```sh
brew install https://raw.githubusercontent.com/selfid-net/homebrew-crypto/master/Formula/<formula>.rb
```

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).

## Publishing
Publishing of this repo is handled by github actions

## Building the bottles locally
If Github Actions is broken, you will have to build the bottles for this repo manually and then publish them to github releases.
```
brew install --verbose --build-bottle joinself/crypto/libself-olm
brew bottle --verbose --json joinself/crypto/libself-olm --root-url=https://github.com/joinself/homebrew-crypto/releases/download/libself-olm-0.1.28
brew install --verbose --build-bottle joinself/crypto/libself-omemo
brew bottle --verbose --json joinself/crypto/libself-omemo --root-url=https://github.com/joinself/homebrew-crypto/releases/download/libself-omemo-0.1.2
```
