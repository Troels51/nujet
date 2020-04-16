## New jet format

This repository is made to create a new wire format for Jet

The specification is written in kaitai, a Yaml format for specifying binary protocols. This format can be compiled to a python parser with ksc

To download kaitai follow directions at [kaitai download](https://kaitai.io/#download)
I recommend download the unstable version because that has some features we use in the spec

### Build Spec
To build a parser for the spec
```
ksc nujet.ksy -t python
```