nif_test
=========

An example NIF shared library builtr with rebar3. 


Directory structure
--------------------

    nif_test
    ├── LICENSE
    ├── Makefile
    ├── README.md
    ├── c_src
    │   ├── Makefile
    │   ├── nif_func.cpp
    │   └── nif_func.h
    ├── priv
    ├── rebar.config
    ├── src
    │   ├── nif_test.app.src
    │   └── nif_test.erl
    └── test
        └── test_NIF.erl

This structure can be easily initialized using Rebar3:

    $ rebar3 new lib nif_test && cd nif_test && rebar3 new cmake

To follow the steps required to create the library please go to web resources and click on [Erlang NIF tutorial](https://sodocumentation.net/erlang/topic/5274/nifs). To get to know more about rebar3 please read [Getting started with Rebar3](https://rebar3.readme.io/docs/getting-started) and ascociated resoures.

Build:
-----

    $ rebar3 compile

Run shell:
----------
    $ rebar3 shell


Run tests:
----------
    $ rebar3 eunit

Web Resources
-------------
* [Getting started with Rebar3](https://rebar3.readme.io/docs/getting-started)
* [Erlang NIF tutorial](https://sodocumentation.net/erlang/topic/5274/nifs)
* [Erlang EUnit unit test framework](https://www.erlang.org/doc/apps/eunit/chapter.html)