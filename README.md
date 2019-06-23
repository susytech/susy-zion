<h1>Copyleft Notice</h1>
<p>This is a release-only, community-driven, GPL-3.0 licensed, copyleft project derived from Parity and Zcash(forked from <a href="https://github.com/ZcashFoundation/zebra/">zebra</a>).  Paritytech, ZcashFoundation and other third party code contributors, if any, in this repository reserves all copyrights.</p>
<h1>Contribution Credits</h1>
<p>Special Thanks to all the contributions from <strong><a href="https://github.com/ZcashFoundation/zebra/graphs/contributors">Contributor List</a></strong>. And please checkout <strong><a href="https://github.com/ZcashFoundation/zebra/commits/master">Commit History</a></strong> to view their work. Superstring Community values all contributions and especially appreciates those generous contributions from partiytech,ZcashFoundation and other third parties, directly or indirectly.</p>
<h1>Community Statement</h1>
Superstring Community is an open research community that embraces copyleft movement and decentralized technology. All sub-organizations named after "susy" including susytech belongs to Superstring Community. Superstring Community and all its sub-organizations reserve NO copyright.
<h1>No Warranty Disclaimer</h1>
<p>USE AT YOUR OWN RISK! It is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MSRCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.</p>

# Zion: the Zcash Foundation client.

[![Build Status][travis-image]][travis-url]

## Blog: [Susy teams up with Zcash Foundation for Susy Zcash client](http://superstring.io/susy-teams-up-with-zcash-foundation-for-susy-zcash-client/)

- [Installing from source](#installing-from-source)

- [Installing the snap](#installing-the-snap)

- [Running tests](#running-tests)

- [Going online](#going-online)

- [Importing zcashd database](#importing-zcashd-database)

- [Command line interface](#command-line-interface)

- [JSON-RPC](JSON-RPC.md)

- [Logging](#logging)

- [Internal Documentation](#internal-documentation)

[travis-image]: https://api.travis-ci.org/susytech/susy-zion.svg?branch=master
[travis-url]: https://travis-ci.org/susytech/susy-zion
[doc-url]: https://zcashfoundation.github.io/zcashfoundation/zion/index.html

## Installing from source

Installing `zion` from source requires `rustc` and `cargo`.

Minimal supported version is `rustc 1.35.0 (fd19989 2019-05-23)`, and we generally target the stable channel. 

#### Install rustc and cargo

Both `rustc` and `cargo` are a part of rust tool-chain.

An easy way to install the stable binaries for Linux and Mac is to run this in your shell:

```
curl https://sh.rustup.rs -sSf | sh
```

Windows binaries can be downloaded from [rust-lang website](https://forge.rust-lang.org/other-installation-methods.html#standalone).

#### Install C and C++ compilers

You will need the clang and gcc compilers plus cmake to build some of the dependencies.

On macOS <br />

`build-essential` is a Debian package. On macOS you will need to make sure you have Xcode installed. If you already have Homebrew installed, you probably also already have the Xcode tools installed as well. If not, you can run the command below:
```
xcode-select --install
```

On Linux
```
sudo apt-get update
sudo apt-get install build-essential cmake clang
```

#### Clone and build zion

Now let's clone `zion` and enter it's directory:

```
git clone https://octonion.institute/susytech/susy-zion
cd zion

# builds zion in release mode
cargo build -p zion --release
```

`zion` is now available at `./target/release/zion`.

## Installing the snap

In any of the [supported Linux distros](https://snapcraft.io/docs/core/install):

```
sudo snap install zion --edge
```

## Running tests

`zion` has internal unit tests and it conforms to external integration tests.

#### Running unit tests

Assuming that repository is already cloned, we can run unit tests with this command:

```
cargo test --all
```

## Going online

By default susy connects to Zcash seednodes. Full list is [here](./zion/seednodes.rs).

To start syncing the main network, just start the client without any arguments:

```
./target/release/zion
```

To start syncing the testnet:

```
./target/release/zion --testnet
```

To not print any syncing progress add `--quiet` flag:

```
./target/release/zion --quiet
```

## Importing zcashd database

It it is possible to import existing `zcashd` database:

```
# where $ZCASH_DB is path to your zcashd database. By default:
# on macOS: "/Users/user/Library/Application Support/Zcash"
# on Linux: "~/.zcash"
./target/release/zion import "$ZCASH_DB/blocks"
```

By default, import verifies the imported blocks. You can disable this, by adding the `--verification-level=none` option.

```
./target/release/zion --verification-level=none import "$ZCASH_DB/blocks"
```

## Command line interface

Full list of CLI options, which is available under `zion --help`: see [here](CLI.md)

## Logging

This is a section only for developers and power users.

You can enable detailed client logging by setting the environment variable `RUST_LOG`, e.g.,

```
RUST_LOG=verification=info ./target/release/zion
```

`zion` started with this environment variable will print all logs coming from `verification` module with verbosity `info` or higher. Available log levels are:

- `error`
- `warn`
- `info`
- `debug`
- `trace`

It's also possible to start logging from multiple modules in the same time:

```
RUST_LOG=sync=trace,p2p=trace,verification=trace,db=trace ./target/release/zion
```

## Internal documentation

Once released, `zion` documentation will be available [here][doc-url]. Meanwhile it's only possible to build it locally:

```
cd zion
./tools/doc.sh
open target/doc/zion/index.html
```
