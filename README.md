hserv
=====

[![Hackage](https://budueba.com/hackage/hserv)](https://hackage.haskell.org/package/hserv) [![Build Status](https://secure.travis-ci.org/rejuvyesh/hserv.png?branch=master)](http://travis-ci.org/rejuvyesh/hserv)

Simple haskell server (just like python -m http.server).

```sh
hserv [OPTIONS]

Common flags:
  -p --port=INT         Port on which server should run
  -v --verbose          Log each request
  -d --dir=ITEM         Path to serve
  -? --help             Display help message
  -V --version          Print version information
```
For example to use port 6556 and serve the current directory, run:

```sh
hserv -p6556
```
