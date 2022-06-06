# learn-plutus
Resources and my steps for becoming a Plutus blockchain developer


## Learn Haskell
- [Learn you a Haskell for Great Good Book (Online)](http://learnyouahaskell.com/chapters)
- Haskell Cheat Sheets:
  - [alhassy/HaskellCheatSheet](https://github.com/alhassy/HaskellCheatSheet)
  - [Haskell Cheat Sheet by Rudy Matella (PDF)](https://matela.com.br/haskell-cs.pdf)
  - [serodriguez68/haskell-cheat-sheet](https://github.com/serodriguez68/haskell-cheat-sheet)
- [Exercism Haskell Track](https://exercism.org/tracks/haskell)
  - [My Solutions](https://github.com/elliothimmelfarb/exercism-haskell)

### Environment Setup:
- [Setup Haskell with GHCUp](https://www.haskell.org/ghcup/)
- [My Haskell VSCode Setip in 2021 - Ivan Hrekov](https://betterprogramming.pub/haskell-vs-code-setup-in-2021-6267cc991551)

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
2. Enter `nix-shell`
3. Run `cabal build plutus-pab` as described [here](https://github.com/input-output-hk/plutus-apps/#how-to-build-the-haskell-packages-with-cabal)
4. Navigate to `./plutus-playground-client`
5. Run `plutus-playground-server`
6. Launch 2nd `nix-shell` in `plutus-apps` repository and navigate to `./plutus-playground-client`
7. Run `npm start`. 

#### Useful nix-shell commands

Haddock Docs:
```bash 
$ build-and-serve-docs
```
