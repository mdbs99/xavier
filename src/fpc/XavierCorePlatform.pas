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
  DOM, 
  XPath, 
  XMLRead, 
  XMLWrite,
  SynCommons,
  JamesDataBase,
  JamesDataCore,
  XavierBase,
  XavierCore,
  XavierAdapters;

type
  TXMLAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    fAttr: TDOMNode;
  public
    constructor Create(aAttr: TDOMNode);
    function Ref: IXMLAttribute;
    function Name: SynUnicode;
    function Text: SynUnicode; overload;
    function Text(const aText: SynUnicode): IXMLAttribute; overload;
  end;

  TXMLAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
    function Ref: IXMLAttributes;
    function Add(const aName, aText: SynUnicode): IXMLAttribute;
    function Item(aIndex: Integer): IXMLAttribute; overload;
    function Item(const aName: SynUnicode): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TXMLNode = class(TInterfacedObject, IXMLNode)
  private
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
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
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: SynUnicode): IXMLNode; overload;
    function Count: Integer;
  end;

  TXMLPack = class(TInterfacedObject, IXMLPack)
  private
    fDocument: TXMLDocument;
  public
    constructor Create(aStream: TStream); reintroduce; overload;
    constructor Create(const aRootName: RawUTF8); overload;
    destructor Destroy; override;
    function Nodes(const XPath: SynUnicode): IXMLNodes;
    function Node(const XPath: SynUnicode; const aDefault: IXMLNode = nil): IXMLNode;
    function Stream: IDataStream;
  end;

implementation

{ TXMLAttribute }

constructor TXMLAttribute.Create(aAttr: TDOMNode);
begin
  inherited Create;
  fAttr := AAttr;
end;

function TXMLAttribute.Ref: IXMLAttribute;
begin
  result := self;
end;

function TXMLAttribute.Name: SynUnicode;
begin
  result := fAttr.NodeName;
end;

function TXMLAttribute.Text: SynUnicode;
begin
  result := fAttr.NodeValue;
end;

function TXMLAttribute.Text(const aText: SynUnicode): IXMLAttribute;
begin
  result := self;
  fAttr.NodeValue := aText;
end;

{ TXMLAttributes }

constructor TXMLAttributes.Create(aNode: TDOMNode);
begin
  inherited Create;
  fNode := aNode;
end;

function TXMLAttributes.Ref: IXMLAttributes;
begin
  result := self;
end;

function TXMLAttributes.Add(const aName, aText: SynUnicode): IXMLAttribute;
begin
  TDOMElement(fNode).SetAttribute(aName, aText);
  result := Item(aName);
end;

function TXMLAttributes.Item(aIndex: Integer): IXMLAttribute;
var
  n: TDOMNode;
begin
  n := fNode.Attributes.Item[aIndex];
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [aIndex]);
  result := TXMLAttribute.Create(n);
end;

function TXMLAttributes.Item(const aName: SynUnicode): IXMLAttribute;
var
  a: TDOMNode;
begin
  a := fNode.Attributes.GetNamedItem(aName);
  if not Assigned(a) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TXMLAttribute.Create(a);
end;

function TXMLAttributes.Count: Integer;
begin
  result := fNode.Attributes.Length;
end;

{ TXMLNode }

constructor TXMLNode.Create(ANode: TDOMNode);
begin
  inherited Create;
  fNode := ANode;
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
  result := fNode.TextContent;
end;

function TXMLNode.Text(const aText: SynUnicode): IXMLNode;
begin
  result := self;
  fNode.TextContent := aText;
end;

function TXMLNode.Attrs: IXMLAttributes;
begin
  result := TXMLAttributes.Create(fNode);
end;

function TXMLNode.Add(const aName: SynUnicode): IXMLNode;
begin
  result := TXMLNode.Create(
    fNode.AppendChild(
      fNode.OwnerDocument.CreateElement(SynUnicode(AName))
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

constructor TXMLChilds.Create(aNode: TDOMNode);
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
  result := TXMLNode.Create(fNode.ChildNodes.Item[AIndex]);
end;

function TXMLChilds.Item(const aName: SynUnicode): IXMLNode;
var
  n: TDOMNode;
begin
  n := fNode.FindNode(aName);
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [AName]);
  result := TXMLNode.Create(n);
end;

function TXMLChilds.Count: Integer;
begin
  result := fNode.ChildNodes.Count;
end;

{ TXMLPack }

constructor TXMLPack.Create(aStream: TStream);
begin
  inherited Create;
  aStream.Position := 0;
  ReadXMLFile(fDocument, aStream);
end;

constructor TXMLPack.Create(const aRootName: RawUTF8);
var
  a: TXMLRootNameAdapter;
  m: TStream;
begin
  m := TMemoryStream.Create;
  try
    a.Init(aRootName);
    a.ToStream(m);
    Create(m);
  finally
    m.Free;
  end;
end;

destructor TXMLPack.Destroy;
begin
  fDocument.Free;
  inherited Destroy;
end;

function TXMLPack.Nodes(const XPath: SynUnicode): IXMLNodes;
var
  v: TXPathVariable;
  l: IInterfaceList;
  i: Integer;
begin
  l := TInterfaceList.Create;
  v := EvaluateXPathExpression(XPath, fDocument.DocumentElement);
  try
    if assigned(v) then
    begin
      for i := 0 to v.AsNodeSet.Count -1 do
        l.Add(TXMLNode.Create(TDOMNode(v.AsNodeSet[i])));
    end;
    result := TXMLNodes.Create(l);
  finally
    v.Free;
  end;
end;

function TXMLPack.Node(const XPath: SynUnicode;
  const aDefault: IXMLNode): IXMLNode;
var
  l: IXMLNodes;
begin
  l := Nodes(XPath);
  if l.Count = 0 then
  begin
    if assigned(aDefault) then
      result := aDefault
    else
      raise EXMLError.CreateFmt('Node "%s" not found.', [XPath]);
  end
  else
    result := l.Item(0);
end;

function TXMLPack.Stream: IDataStream;
var
  m: TStream;
begin
  m := TMemoryStream.Create;
  try
    WriteXMLFile(fDocument, m);
    result := TDataStream.Create(m);
  finally
    m.Free;
  end;
end;

end.

