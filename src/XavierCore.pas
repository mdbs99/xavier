{
  MIT License

  Copyright (c) 2017-2019 Marcos Douglas B. Santos

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
unit XavierCore;

{$i Xavier.inc}

interface

uses
  Classes, 
  SysUtils,
  JamesDataBase,
  JamesDataCore,
  XavierBase,
  XavierPlatform;

type
  TXMLAttribute = TCAttribute;
  TXMLAttributes = TCAttributes;
  TXMLNode = TCNode;
  TXMLNodes = TCNodes;
  TXMLChilds = TCChilds;

  TXMLPack = class(TCPack, IXMLPack)
  public
    constructor Create(const aStream: IDataStream); overload;
    constructor Create(const aRootName: TXavierString); overload;
    function Ref: IXMLPack;
  end;

  TXMLNodeDefault = class(TInterfacedObject, IXMLNode)
  private
    fName: TXavierString;
    fText: TXavierString;
  public
    constructor Create(const aName, aText: TXavierString);
    function Name: TXavierString;
    function Text: TXavierString; overload;
    function Text(const aText: TXavierString): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Add(const aName: TXavierString): IXMLNode;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

implementation

{ TXMLPack }

constructor TXMLPack.Create(const aStream: IDataStream);
var
  mem: TMemoryStream;
begin
  mem := TMemoryStream.Create;
  try
    aStream.Save(mem);
    Create(mem);
  finally
    mem.Free;
  end;
end;

constructor TXMLPack.Create(const aRootName: TXavierString);
begin
  Create(
    TDataStream.Create(
      Format(
        '<?xml version="1.0" encoding="UTF-8"?><%s />', [aRootName]
      )
    )
  );
end;

function TXMLPack.Ref: IXMLPack;
begin
  result := self;
end;

{ TXMLNodeDefault }

constructor TXMLNodeDefault.Create(const aName, aText: TXavierString);
begin
  inherited Create;
  fName := aName;
  fText := aText;
end;

function TXMLNodeDefault.Name: TXavierString;
begin
  result := fName;
end;

function TXMLNodeDefault.Text: TXavierString;
begin
  result := fText;
end;

function TXMLNodeDefault.Text(const aText: TXavierString): IXMLNode;
begin
  result := self;
  fText := aText;
end;

function TXMLNodeDefault.Attrs: IXMLAttributes;
begin
  raise EXMLError.Create('Attributes not allowed.');
end;

function TXMLNodeDefault.Add(const aName: TXavierString): IXMLNode;
begin
  raise EXMLError.Create('Add not allowed.');
end;

function TXMLNodeDefault.Childs: IXMLNodes;
begin
  raise EXMLError.Create('Childs not allowed.');
end;

function TXMLNodeDefault.Parent: IXMLNode;
begin
  result := self;
end;

end.
