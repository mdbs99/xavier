{
  MIT License

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
}
unit Xavier.Core;

{$include xavier.inc}

interface

uses
  SysUtils,
  {$ifdef FPC}
    DOM,
  {$else}
    XMLDOM,
  {$endif}
  James.Data;

type
  XavierString = DOMString;
  EXavierError = class(Exception);

type
  IXavierNode = interface;
  IXavierNodes = interface;

  IXavierAttribute = interface
  ['{5CEC1117-80DA-4FBC-8D55-AFED800B05ED}']
    function Name: XavierString;
    function Value: XavierString; overload;
    function Value(const V: XavierString): IXavierAttribute; overload;
    function Node: IXavierNode;
  end;

  IXavierAttributes = interface
  ['{6D64F5F4-BF46-4A45-8014-A72DFA8E8F29}']
    function Add(const Name, Value: XavierString): IXavierAttribute;
    function Item(Idx: Integer): IXavierAttribute; overload;
    function Item(const Name: XavierString): IXavierAttribute; overload;
    function Count: Integer;
  end;

  IXavierNode = interface
  ['{78CF296B-3F7E-4324-A8E2-28CA7D2A6DF5}']
    function Name: XavierString;
    function Value: XavierString; overload;
    function Value(const V: XavierString): IXavierNode; overload;
    function Attrs: IXavierAttributes;
    function Add(const Name: XavierString): IXavierNode;
    function Childs: IXavierNodes;
    function Parent: IXavierNode;
  end;

  IXavierNodes = interface
  ['{4AE9A045-B1FA-46C5-B90E-0FB05BAF13A4}']
    function Item(Idx: Integer): IXavierNode; overload;
    function Item(const Name: XavierString): IXavierNode; overload;
    function Count: Integer;
  end;

  IXavierPack = interface
  ['{35E1DA6D-6022-47BB-B7B0-E651E209F12A}']
    function Nodes(const XPath: XavierString): IXavierNodes;
    function Node(const XPath: XavierString): IXavierNode;
    function Stream: IDataStream;
  end;

implementation

end.

