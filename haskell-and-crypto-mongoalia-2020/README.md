# Haskell and Crypto Mongolia 2022

[Repository](https://github.com/iohkedu/haskell-2020)

[YouTube Playlist](https://www.youtube.com/playlist?list=PLJ3w5xyG4JWmBVIigNBytJhvSSfZZzfTm)

# Notes

## Data Types

### `data`, `type`, and `newtype`

- `data` creates a new data type which can have one or more constructors.
- `type` gives a new name to an existing data type.
- `newtype` is similar to `data` but it only works for data types that have exactly 1 constructor with exactly 1 argument.
- [`newtype` on Haskell Wiki](https://wiki.haskell.org/Newtype)

### Record Syntax

- Labels output from `Show`
- Allows usage of named constructor arguments which removes importance of order of argument
- Self documenting
- Get accessor functions for free
- Get record update syntax:

```ghci
*Main> let tx1 = Transaction' 100 "me" "you"
*Main> tx1
Transaction' {tr'Amount = 100, tr'From = "me", tr'To = "you"}
*Main> tx1 {tr'To = "them", tr'Amount = 50}
Transaction' {tr'Amount = 50, tr'From = "me", tr'To = "them"}
```

### Purpose of `undefined`

- Never used for empty or non-values
  - use `Maybe` and `Nothing` for this instead
- Only used for development if you want something to compile by filling holes but you are not complete with it yet.
- `undefined` will often crash production code at run time but it will often enable compiling
- `undefined` is uncheckable. Does not behave or is not ueseful in the way other languages use `undefined` or `null`
- `Maybe` forces you to always handle a `Nothing` case. You cannot proceed without checking for "null"

### Memory Leaks

- Haskell is garbage collected
- By means of laziness, you can end up taking up more memory than you need.
- With nested expressions you can end up hanging onto values and execution for longer than you might expect.
