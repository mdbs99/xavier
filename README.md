# Xavier

[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/mdbs99/xavier/blob/master/README.md)

Xavier is an object-oriented library for working with XML.

**ATTENTION:** We're still in a very early alpha version, the API may and will change frequently. Please, use it at your own risk, until we release version 1.0.

This API is being written in [Free Pascal](https://freepascal.org/) and [Lazarus](http://www.lazarus-ide.org/). However, it is compatible with [Delphi](https://www.embarcadero.com/products/delphi) too.

**Why**. Nowadays, all XML libraries are very complex. Each class has so many methods that could be hard to use and understand them. These implementations are very procedural too.

The major goal of this project is to replace common procedural code in our projects, which could have so many conditionals and variables, to a declarative and object-oriented code to work more easily with XML.

We want to write elegant, clean, and maintainable code using OOP.

**Principles**. The code has some design principles:

* Fully interface-based
* Memory is released automatically
* No usage of `nil`/`NULL` in arguments or returns
* No type casting or reflection
* No procedures or functions, only Interfaces and Objects

## Quick Start

- [Find a Node](#find-a-node)
- [Add Node](#add-node)
- [Childs Count](#childs-count)
- [Find Attribute](#find-attribute)
- [Add Attribute](#add-attribute)

### Find a Node

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
  N: IXMLNode;
begin
  N := TXMLPack.New(
    TFile.New('file.xml').Stream
  ).Node('/root/foo/value');
  ShowMessage(N.Text); // "foo"
end.
```
In fact, we don't need this variable `N`. Just call `Text` directly.

### Add Node

You can add a node easily doing this:

```pascal
// add a new node: name="item" value="a"
TXMLPack.New(TFile.New('file.xml').Stream)
  .Node('/root')
  .Add('item')
  .Value('a')
```

### Childs Count

You can count how many childs a node have doing this:

```pascal
// How many childs
TXMLPack.New(TFile.New('file.xml').Stream)
  .Node('/root')
  .Childs
  .Count
```

### Find Attribute

You can find any attribute by name doing this:

```pascal
// Find by name "id"
TXMLPack.New(TFile.New('file.xml').Stream)
  .Node('/root')
  .Attrs
  .Item('id')
```

### Add Attribute

Adding an attribute is quite easy too:

```pascal
// Add an attribute: name="foo" value="bar"
TXMLPack.New(TFile.New('file.xml').Stream)
  .Node('/root')
  .Attrs
  .Add('foo', 'bar')
```

## Dependencies

Internally, this project uses other built-in XML library for each compiler.
Besides that, we are using other packages:

- [James 1.0](https://github.com/mdbs99/james) — is a collection of classes and interfaces for truly object-oriented projects.
  
## License (MIT)

Copyright (c) 2017 Marcos Douglas B. Santos

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
