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

## Dependencies

Internally, this project uses other built-in XML library for each compiler.
Besides that, we are using other packages:

* [James](https://github.com/mdbs99/james) — is a collection of classes and interfaces for truly object-oriented projects.

## How to contribute?

To contribute we suggest following these steps:

1. Fork this project (Click on **Fork** button)
2. Clone your forked project to your local machine
3. Create a new issue describing about the problem or enhancement that you are going to make
4. Create a new branch related to this issue. We suggest to use a name like `issue-10` — 10 is the issue's ID
5. Make all the changes necessary and commit
6. Push the new branch to your Github repository
7. Go to Xavier Github project and click on **Compare & Pull Request**

**Important:**

- It is important for you create a new branch for each PR. We might need to request some further changes in your work, and having the original PR's code to make these changes is better than working with the whole code.
- Each PR needs to work only in one issue, respecting the [single responsibility principle](https://en.wikipedia.org/wiki/Single_responsibility_principle).
- Make sure your branch builds without any warnings/issues.

If you have questions or general suggestions, don't hesitate to submit a new [Github issue](https://github.com/mdbs99/xavier/issues/new).

## Contributors

  - [@mdbs99](https://github.com/mdbs99) as Marcos Douglas B. Santos ([Blog](http://mdbs99.com/))
  
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
