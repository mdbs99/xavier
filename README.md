# Xavier

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/mdbs99/xavier/blob/master/README.md)
[![Hits-of-Code](https://hitsofcode.com/github/mdbs99/xavier)](https://hitsofcode.com/view/github.com/mdbs99/xavier)

Xavier is a small XML library, object-oriented, and cross-platform that simplifies the work with XML files and streams using [XPath](https://www.w3schools.com/xml/xml_xpath.asp).

**ATTENTION:** We're still in a very early alpha version, the API may and will change frequently. Please, use it at your own risk, until we release version 1.0.

# Table of Contents

- [Overview](#overview)
- [Installing](#installing)
  - [Dependencies](#dependencies)
  - [On Lazarus](#on-lazarus)
  - [On Delphi](#on-delphi)
- [Getting Started](#getting-started)
  - [Find a Node](#find-a-node)
  - [Add Node](#add-node)
  - [Childs Count](#childs-count)
  - [Find Attribute](#find-attribute)
  - [Add Attribute](#add-attribute)
- [License](#license)

# Overview

This API is being written in [Free Pascal](https://freepascal.org/) and [Lazarus](http://www.lazarus-ide.org/). However, it is also compatible with [Delphi](https://www.embarcadero.com/products/delphi).

Most XML libraries are very complex. Each class has so many methods that could be hard to use and understand them. These implementations are very procedural too.

The main goal is to replace common procedural code, which could have so many conditionals and variables, to a declarative and object-oriented code to work more easily with XML.

The code follows a restrict rules about naming and style, as prefixes and suffixes, to help programmers to find the correct class or method to do the job quickly.

# Installing

Clone the repository in some directory in your computer.

# Dependencies

Internally, this project uses the built-in XML library for each compiler.

Besides that, we are using other libraries:

- [James](https://github.com/mdbs99/james) — is a collection of classes and interfaces for truly object-oriented projects.
- [mORMot](https://github.com/synopse/mORMot) — client-server ORM SOA MVC framework for Delphi 6 up to latest Delphi and FPC

## On Lazarus

It has been tested using these versions:
- *FPC* 3.1.1 revision 40491
- *Lazarus* 2.1.0 revision 59757

To install on *Lazarus*:
- Make sure that you have `JamesLib.lpk`, and `mormot_base.lpk` available - see dependencies
- Open the package in `/pkg/XavierLib.lpk`
- Compile it
- That's all.

The IDE will be aware about *XavierLib* Package to use in any project.

Considering `<xavier>` as the path where you have saved the sources, your project must include these paths:

## On Delphi

Considering `<xavier>` as the path where you have saved the sources, you must include these paths in your project:
- Search Path `<xavier>\src;<xavier>\src\delphi`

# Getting Started

You can find some examples to use Xavier in its own source. Just take a look into `Xavier*Tests` units.

Additionally, below you can find the basics to start.

Take this XML for all examples below:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<root>
  <foo a1="f1" a2="f2">
    <value>foo</value>
  </foo>
  <bar a1="b1" a2="b2">
    <value>bar</value>
  </bar>
</root>
```

## Find a Node

If you want to find the `value` child node of `foo` node, do this:

```pascal
var
  pack: IXMLPack;
  n: IXMLNode;
begin
  pack := TXMLPack.Create(
    TDataFile.Create('file.xml').Ref.Stream
  );
  n := pack.Node('/root/foo/value');
  ShowMessage(n.Text); // "foo"
end.
```

In fact, we don't need variables `pack` or `n`. Just call directly:

```pascal
begin
  ShowMessage(
    TXMLPack.Create(
      TDataFile.Create('file.xml').Ref.Stream
    )
    .Ref
    .Node('/root/foo/value')
    .Text
  ); // "foo"
end.
```


## Add Node

You can add a node easily doing this:

```pascal
// add a new node: name="item" value="a"
begin
  TXMLPack.Create(TDataFile.Create('file.xml').Ref.Stream)
    .Ref
    .Node('/root')
    .Add('item')
    .Text('a')
end;
```

## Childs Count

You can count how many childs a node have doing this:

```pascal
// How many childs
begin
  TXMLPack.Create(TDataFile.Create('file.xml').Ref.Stream)
    .Ref
    .Node('/root')
    .Childs
    .Count
end;
```

## Find Attribute

You can find any attribute by name doing this:

```pascal
// Find by name "id"
begin
  TXMLPack.Create(TDataFile.Create('file.xml').Ref.Stream)
    .Ref
    .Node('/root')
    .Attrs
    .Item('id')
end;
```

## Add Attribute

Adding an attribute is quite easy too:

```pascal
// Add an attribute: name="foo" value="bar"
begin
  TXMLPack.Create(TDataFile.Create('file.xml').Ref.Stream)
    .Ref
    .Node('/root')
    .Attrs
    .Add('foo', 'bar')
end;
```

# License (MIT)

This project is released under MIT license. See [LICENSE](LICENSE).
