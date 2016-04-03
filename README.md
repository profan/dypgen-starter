dypgen-starter
---------------
A small project intended to fully package everything needed to get started using dypgen, uses ocamlbuild and ocamlfind for dependencies as well as opam, as simple a set-up as possible (for the end-user, not in the tools involved).

At some point, the intention is to have the whole thing self-contained in a vagrant container so that anyone can just run vagrant up and then start working with it.

Structure
-----------
* **src** folder holds source files for the compiler, currently just the main which parses and evaluates the single test source file.
* **data** folder holds data definitions used to generate the parser and lexer.
* **tests** folder holds samples to be used for testing the parser.

License
-------
MIT
