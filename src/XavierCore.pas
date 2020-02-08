{
  MIT License

  Copyright (c) 2017-2020 Marcos Douglas B. Santos

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
  SynCommons,
  JamesDataBase,
  JamesDataCore,
  XavierBase;

type
  TXMLTextAsDataStream = class(TInterfacedObject, IDataStreamOf)
  private
    fRootName: RawUTF8;
    fVersion: RawUTF8;
    fEncoding: RawUTF8;
  public
    constructor Create(const aRootName: RawUTF8);
    function Ref: IDataStreamOf;
    function Value: IDataStream;
    property Version: RawUTF8 read fVersion write fVersion;
    property Encoding: RawUTF8 read fEncoding write fEncoding;
  end;

  TXMLNodes = class(TInterfacedObject, IXMLNodes)
  private
    fList: IInterfaceList;
  public
    constructor Create(const aList: IInterfaceList);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: SynUnicode): IXMLNode; overload;
    function Count: Integer;
  end;

  TXMLNodeDefault = class(TInterfacedObject, IXMLNode)
  private
    fName: SynUnicode;
    fText: SynUnicode;
  public
    constructor Create(const aName, aText: SynUnicode);
    function Name: SynUnicode;
    function Text: SynUnicode; overload;
    function Text(const aText: SynUnicode): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Add(const aName: SynUnicode): IXMLNode;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

implementation

{ TXMLTextAsDataStream }

constructor TXMLTextAsDataStream.Create(const aRootName: RawUTF8);
begin
  inherited Create;
  fRootName := aRootName;
  fVersion := '1.0';
  fEncoding := 'UTF-8';
end;

function TXMLTextAsDataStream.Ref: IDataStreamOf;
begin
  result := self;
end;

function TXMLTextAsDataStream.Value: IDataStream;
begin
  result := TDataStream.Create(
    FormatUTF8('<?xml version="%" encoding="%"?><% />', [
      fVersion, fEncoding, fRootName])
  );
end;

{ TXMLNodes }

constructor TXMLNodes.Create(const aList: IInterfaceList);
begin
  inherited Create;
  fList := aList;
end;

function TXMLNodes.Ref: IXMLNodes;
begin
  result := self;
end;

function TXMLNodes.Item(aIndex: Integer): IXMLNode;
begin
  result := fList.Items[AIndex] as IXMLNode;
end;

function TXMLNodes.Item(const aName: SynUnicode): IXMLNode;
var
  i: Integer;
  n: IXMLNode;
begin
  for i := 0 to fList.Count -1 do
  begin
    n := Item(i);
    if n.Name = aName then
    begin
      result := n;
      Exit;
    end;
  end;
  raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
end;

function TXMLNodes.Count: Integer;
begin
  result := fList.Count;
end;

{ TXMLNodeDefault }

constructor TXMLNodeDefault.Create(const aName, aText: SynUnicode);
begin
  inherited Create;
  fName := aName;
  fText := aText;
end;

function TXMLNodeDefault.Name: SynUnicode;
begin
  result := fName;
end;

function TXMLNodeDefault.Text: SynUnicode;
begin
  result := fText;
end;

function TXMLNodeDefault.Text(const aText: SynUnicode): IXMLNode;
begin
  result := self;
  fText := aText;
end;

function TXMLNodeDefault.Attrs: IXMLAttributes;
begin
  raise EXMLError.Create('Attributes not allowed.');
end;

function TXMLNodeDefault.Add(const aName: SynUnicode): IXMLNode;
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
