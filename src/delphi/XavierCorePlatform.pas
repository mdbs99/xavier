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
unit XavierCorePlatform;

{$i Xavier.inc}

interface

uses
  Classes, 
  SysUtils,
  MSXML2_TLB,
  SynCommons,
  JamesBase,
  JamesDataBase,
  JamesDataCore,
  JamesDataAdapters,
  XavierBase,
  XavierCore;

type
  TXMLAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    fAttr: IXMLDOMAttribute;
  public
    constructor Create(const aAttr: IXMLDOMAttribute);
    function Ref: IXMLAttribute;
    function Name: SynUnicode;
    function Text: SynUnicode; overload;
    function Text(const aText: SynUnicode): IXMLAttribute; overload;
  end;

  TXMLAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    fNode: IXMLDomNode;
  public
    constructor Create(const aNode: IXMLDomNode);
    function Ref: IXMLAttributes;
    function Add(const aName, aText: SynUnicode): IXMLAttribute;
    function Item(aIndex: Integer): IXMLAttribute; overload;
    function Item(const aName: SynUnicode): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TXMLNode = class(TInterfacedObject, IXMLNode)
  private
    fNode: IXMLDomNode;
  public
    constructor Create(const aNode: IXMLDomNode);
    function Ref: IXMLNode;
    function Name: SynUnicode;
    function Text: SynUnicode; overload;
    function Text(const aText: SynUnicode): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Add(const aName: SynUnicode): IXMLNode;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

  TXMLChilds = class(TInterfacedObject, IXMLNodes)
  private
    fNode: IXMLDomNode;
  public
    constructor Create(const aNode: IXMLDomNode);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: SynUnicode): IXMLNode; overload;
    function Count: Integer;
  end;

  TXMLPack = class(TInterfacedObject, IXMLPack)
  private
    fDocument: IXMLDOMDocument3;
  public
    constructor Create(const aStream: IDataStream); reintroduce; overload;
    constructor Create(aStream: TStream); overload;
    constructor Create(const aRootName: RawUTF8); overload;
    function Nodes(const XPath: SynUnicode): IXMLNodes;
    function Node(const XPath: SynUnicode): IXMLNode; overload;
    function Node(const XPath: SynUnicode; const aDefault: IXMLNode): IXMLNode; overload;
    function Stream: IDataStream;
  end;

implementation

{ TXMLAttribute }

constructor TXMLAttribute.Create(const aAttr: IXMLDOMAttribute);
begin
  inherited Create;
  fAttr := aAttr;
end;

function TXMLAttribute.Ref: IXMLAttribute;
begin
  result := self;
end;

function TXMLAttribute.Name: SynUnicode;
begin
  result := fAttr.name;
end;

function TXMLAttribute.Text: SynUnicode;
begin
  result := fAttr.value;
end;

function TXMLAttribute.Text(const aText: SynUnicode): IXMLAttribute;
begin
  result := self;
  fAttr.value := aText;
end;

{ TXMLAttributes }

constructor TXMLAttributes.Create(const aNode: IXMLDomNode);
begin
  inherited Create;
  fNode := aNode;
end;

function TXMLAttributes.Ref: IXMLAttributes;
begin
  result := self;
end;

function TXMLAttributes.Add(const aName, aText: SynUnicode): IXMLAttribute;
var
  attr: IXMLDOMAttribute;
begin
  attr := fNode.ownerDocument.createAttribute(aName);
  attr.value := aText;
  fNode.attributes.setNamedItem(attr);
  result := TXMLAttribute.Create(attr);
end;

function TXMLAttributes.Item(aIndex: Integer): IXMLAttribute;
var
  n: IXMLDomNode;
begin
  n := fNode.Attributes.Item[aIndex];
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [aIndex]);
  result := TXMLAttribute.Create(n as IXMLDOMAttribute);
end;

function TXMLAttributes.Item(const aName: SynUnicode): IXMLAttribute;
var
  n: IXMLDomNode;
begin
  n := fNode.Attributes.GetNamedItem(aName);
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TXMLAttribute.Create(n as IXMLDOMAttribute);
end;

function TXMLAttributes.Count: Integer;
begin
  result := fNode.Attributes.Length;
end;

{ TXMLNode }

constructor TXMLNode.Create(const aNode: IXMLDomNode);
begin
  inherited Create;
  fNode := aNode;
end;

function TXMLNode.Ref: IXMLNode;
begin
  result := self;
end;

function TXMLNode.Name: SynUnicode;
begin
  result := fNode.NodeName;
end;

function TXMLNode.Text: SynUnicode;
begin
  result := fNode.text;
end;

function TXMLNode.Text(const aText: SynUnicode): IXMLNode;
begin
  result := self;
  fNode.text := aText;
end;

function TXMLNode.Attrs: IXMLAttributes;
begin
  result := TXMLAttributes.Create(fNode);
end;

function TXMLNode.Add(const aName: SynUnicode): IXMLNode;
begin
  result := TXMLNode.Create(
    fNode.AppendChild(
      fNode.OwnerDocument.CreateElement(SynUnicode(aName))
    )
  );
end;

function TXMLNode.Childs: IXMLNodes;
begin
  result := TXMLChilds.Create(fNode);
end;

function TXMLNode.Parent: IXMLNode;
begin
  result := TXMLNode.Create(fNode.ParentNode);
end;

{ TXMLChilds }

constructor TXMLChilds.Create(const aNode: IXMLDomNode);
begin
  inherited Create;
  fNode := ANode;
end;

function TXMLChilds.Ref: IXMLNodes;
begin
  result := self;
end;

function TXMLChilds.Item(aIndex: Integer): IXMLNode;
begin
  result := TXMLNode.Create(fNode.ChildNodes.Item[aIndex]);
end;

function TXMLChilds.Item(const aName: SynUnicode): IXMLNode;
var
  n: IXMLDOMNode;
begin
  n := fNode.selectSingleNode(aName);
  if not assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TXMLNode.Create(n);
end;

function TXMLChilds.Count: Integer;
begin
  result := fNode.ChildNodes.Length;
end;

{ TXMLPack }

constructor TXMLPack.Create(const aStream: IDataStream);
var
  adapt: IVariantOf;
begin
  inherited Create;
  adapt := TDataStreamAsOleVariant.Create(aStream);
  fDocument := MSXML2_TLB.CoDOMDocument60.Create;
  fDocument.load(adapt.Value);
end;

constructor TXMLPack.Create(aStream: TStream);
begin
  aStream.Position := 0;
  Create(TDataStream.Create(aStream));
end;

constructor TXMLPack.Create(const aRootName: RawUTF8);
var
  text: IDataStreamOf;
  m: TStream;
begin
  m := TMemoryStream.Create;
  try
    text := TXMLTextAsDataStream.Create(aRootName);
    text.Value.ToStream(m);
    Create(m);
  finally
    m.Free;
  end;
end;

function TXMLPack.Nodes(const XPath: SynUnicode): IXMLNodes;
var
  i: Integer;
  l: IInterfaceList;
  nodes: IXMLDomNodeList;
begin
  l := TInterfaceList.Create;
  nodes := fDocument.selectNodes(XPath);
  for i := 0 to nodes.length -1 do
    l.Add(TXMLNode.Create(nodes.item[i]));
  result := TXMLNodes.Create(l);
end;

function TXMLPack.Node(const XPath: SynUnicode): IXMLNode;
var
  l: IXMLNodes;
begin
  l := Nodes(XPath);
  if l.Count = 0 then
    raise EXMLError.Create('Node not found.');
  result := l.Item(0);
end;

function TXMLPack.Node(const XPath: SynUnicode;
  const aDefault: IXMLNode): IXMLNode;
var
  l: IXMLNodes;
begin
  l := Nodes(XPath);
  if l.Count = 0 then
    result := aDefault
  else
    result := l.Item(0);
end;

function TXMLPack.Stream: IDataStream;
begin
  result := TDataStream.Create(fDocument.xml);
end;

end.
