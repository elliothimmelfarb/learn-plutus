# learn-plutus

Resources and my steps for becoming a Plutus blockchain developer

## Learn Haskell

- [IOHK Haskell 2022 Full Course Repo](https://github.com/iohkedu/haskell-2020)
- [Haskell and Crypto Mongolia 2020](https://www.youtube.com/playlist?list=PLJ3w5xyG4JWmBVIigNBytJhvSSfZZzfTm)
- [Learn you a Haskell for Great Good Book (Online)](http://learnyouahaskell.com/chapters)
- Haskell Cheat Sheets:
  - [alhassy/HaskellCheatSheet](https://github.com/alhassy/HaskellCheatSheet)
  - [Haskell Cheat Sheet by Rudy Matella (PDF)](https://matela.com.br/haskell-cs.pdf)
  - [serodriguez68/haskell-cheat-sheet](https://github.com/serodriguez68/haskell-cheat-sheet)
- [Exercism Haskell Track](https://exercism.org/tracks/haskell)
  - [My Solutions](https://github.com/elliothimmelfarb/exercism-haskell)
- [code.world/haskell](https://code.world/haskell)
- [Hoogle](https://hoogle.haskell.org/)
- [Prelude Hackage Page](https://hackage.haskell.org/package/base-4.16.1.0/docs/Prelude.html)

### Environment Setup:

- [Setup Haskell with GHCUp](https://www.haskell.org/ghcup/)
- [My Haskell VSCode Setip in 2021 - Ivan Hrekov](https://betterprogramming.pub/haskell-vs-code-setup-in-2021-6267cc991551)

### Haskell Tricks

- Google `"hoogle <function name>"` to search Hoogle effectively to see where a function can be found and learn more about it.
- In GHCI:

  - [Add or remove modules from ghci environment](https://kuniganotas.wordpress.com/2012/09/08/haskell-importunimport-a-module-into-ghci/):

  ```bash
  :module +<name of the module> // Add
  :module -<name of the module> // Remove
  ```

## Learn Plutus

- [Plutus Docs](https://plutus.readthedocs.io/en/latest/)
- [Plutus Playground](https://playground.plutus.iohkdev.io/)
- [PlutusTx Haddock](https://playground.plutus.iohkdev.io/doc/haddock/plutus-tx/html/PlutusTx.html)

### Plutus Pioneers Program

- [Program repo](https://github.com/input-output-hk/plutus-pioneer-program)
- [Plutus Apps repo](https://github.com/input-output-hk/plutus-apps)

#### Environment Setup

- [Setup Nix on MacOs](https://nixos.org/download.html#nix-install-macos)
- [Set up the IOHK binary caches (#1)](https://github.com/input-output-hk/plutus#how-to-set-up-the-iohk-binary-caches)

#### Start the Playground

1. Checkout `plutus-apps` repository at required commit
2. Enter `nix-shell` with `GC_DONT_GC=1 nix-shell` to disable garbage collection
3. Maybe `nix-build -A plutus-playground.client`
4. Maybe `nix-build -A plutus-playground.server`
5. Maybe `nix-build -A plutus-playground.start-backend`
6. Maybe `cabal build plutus-pab` as described [here](https://github.com/input-output-hk/plutus-apps/#how-to-build-the-haskell-packages-with-cabal)
7. Navigate to `./plutus-playground-client`
8. Run `plutus-playground-server`
9. Launch 2nd `nix-shell` in `plutus-apps` repository and navigate to `./plutus-playground-client`
10. Run `npm start`.

- [Solve /bin/plutus-playground-server: No such file or directory](https://issuemode.com/issues/input-output-hk/plutus-apps/42168502)
- [MacOS Plutus Playground Build - Instructions (datad but useful)](https://www.reddit.com/r/cardano/comments/mmzut6/macos_plutus_playground_build_instructions/)

#### Calculate posix time from slot

1. Enter `nix-shell` from `plutus-apps`.
2. Navigate to `plutus-pioneer-program` repo and go into week directory.
3. Enter `cabal repl`
4. `import Data.Default`
5. `import Ledger.TimeSlot`
6. `slotToEndPOSIXTime def [slot count]`
   10 slots = 1596059101999

#### Useful nix-shell commands

Haddock Docs:

```bash
$ build-and-serve-docs
```

## Marlowe

- [Marlowe Docs](https://marlowe-playground-staging.plutus.aws.iohkdev.io/doc/marlowe/tutorials/index.html)
- [Marlowe Playground](https://marlowe-playground-staging.plutus.aws.iohkdev.io/#/)

## Cardano

- [Essential Cardano List](https://github.com/input-output-hk/essential-cardano/blob/main/essential-cardano-list.md)
- [Essential Cardano Content](https://github.com/input-output-hk/essential-cardano-content)
- [Weekly Cardano Development Updates](https://github.com/input-output-hk/essential-cardano-content/tree/main/content/development-update)
- [Cardano Developer Portal](https://developers.cardano.org/)

### Cardano Forums Finds
- [Understanding Cardano Extended-UTXO](https://forum.cardano.org/t/understanding-cardano-extended-utxo/101509)
- [Decentralization is at the heart of Cardano](https://forum.cardano.org/t/decentralization-is-at-the-heart-of-cardano/99745)
