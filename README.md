# Xavier

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/mdbs99/xavier/blob/master/README.md)

Xavier is an object-oriented library for working with XML.

**ATTENTION:** We're still in a very early alpha version, the API may and will change frequently. Please, use it at your own risk, until we release version 1.0.

# Table of Contents

- [Overview](#overview)
- [Concepts](#concepts)
- [Installing](#installing)
  - [On Lazarus](#on-lazarus)
  - [On Delphi](#on-delphi)
- [Dependencies](#dependencies)
- [Getting Started](#getting-started)
  - [Find a Node](#find-a-node)
  - [Add Node](#add-node)
  - [Childs Count](#childs-count)
  - [Find Attribute](#find-attribute)
  - [Add Attribute](#add-attribute)
- [License](#license)

# Overview

This API is being written in [Free Pascal](https://freepascal.org/) and [Lazarus](http://www.lazarus-ide.org/). However, it is also compatible with [Delphi](https://www.embarcadero.com/products/delphi).

# Concepts

Nowadays, all XML libraries are very complex. Each class has so many methods that could be hard to use and understand them. These implementations are very procedural too.

The major goal of this project is to replace common procedural code in our projects, which could have so many conditionals and variables, to a declarative and object-oriented code to work more easily with XML.

We want to write elegant, clean, and maintainable code using OOP.

This project has some design principles:

* Fully interface-based
* Memory is released automatically
* No usage of `nil`/`NULL` in arguments or returns
* No type casting or reflection
* No procedures or functions, only interfaces and objects

# Installing

- Clone the repository in some directory in your computer.
- For each project you just need to setup the paths, which depends on your platform are you using.
- See [Dependencies](#dependencies) below too

## On Lazarus

Considering `<xavier>` as the path where you have saved the sources, your project must include these paths:

- Other unit files (-Fu)
  - include `<xavier>\src;<xavier>\src\fpc`
- Include files (-Fi)
  - include `<xavier>\src;<xavier>\src\fpc`

## On Delphi

Considering `<xavier>` as the path where you have saved the sources, your project must include these paths:

- Search Path
  - include `<xavier>\src;<xavier>\src\delphi`

# Dependencies

Internally, this project uses other built-in XML library for each compiler.
Besides that, we are using other libraries:

- [James](https://github.com/mdbs99/james) — is a collection of classes and interfaces for truly object-oriented projects.
- [mORMot](https://github.com/synopse/mORMot) — client-server ORM SOA MVC framework for Delphi 6 up to latest Delphi and FPC

# Getting Started

## Find a Node

Take this XML for example:

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
