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
unit XavierPlatform;

{$i Xavier.inc}

interface

uses
  Classes, 
  SysUtils,
  DOM, 
  XPath, 
  XMLRead, 
  XMLWrite,
  JamesDataBase,
  JamesDataCore,
  XavierBase;

type
  TCAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    fParent: TDOMNode;
    fAttr: TDOMNode;
  public
    constructor Create(aParent, aAttr: TDOMNode);
    function Ref: IXMLAttribute;
    function Name: TXavierString;
    function Text: TXavierString; overload;
    function Text(const aText: TXavierString): IXMLAttribute; overload;
    function Node: IXMLNode;
  end;

  TCAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
    function Ref: IXMLAttributes;
    function Add(const aName, aText: TXavierString): IXMLAttribute;
    function Item(aIndex: Integer): IXMLAttribute; overload;
    function Item(const aName: TXavierString): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TCNode = class(TInterfacedObject, IXMLNode)
  private
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
    function Ref: IXMLNode;
    function Name: TXavierString;
    function Text: TXavierString; overload;
    function Text(const aText: TXavierString): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Add(const aName: TXavierString): IXMLNode;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

  TCNodes = class(TInterfacedObject, IXMLNodes)
  private
    fList: IInterfaceList;
  public
    constructor Create(const aList: IInterfaceList);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: TXavierString): IXMLNode; overload;
    function Count: Integer;
  end;

  TCChilds = class(TInterfacedObject, IXMLNodes)
  private
    fNode: TDOMNode;
  public
    constructor Create(aNode: TDOMNode);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: TXavierString): IXMLNode; overload;
    function Count: Integer;
  end;

  TCPack = class(TInterfacedObject, IXMLPack)
  private
    fDocument: TXMLDocument;
  public
    constructor Create(aStream: TStream); reintroduce;
    destructor Destroy; override;
    function Nodes(const XPath: TXavierString): IXMLNodes;
    function Node(const XPath: TXavierString; const aDefault: IXMLNode = nil): IXMLNode;
    function Stream: IDataStream;
  end;

implementation

{ TCAttribute }

constructor TCAttribute.Create(aParent, aAttr: TDOMNode);
begin
  inherited Create;
  // it is needed to keep the ParentNode and the Attribute itself
  // do not know why, but using Attr.ParentNode does not work
  fParent := AParent;
  fAttr := AAttr;
end;

function TCAttribute.Ref: IXMLAttribute;
begin
  result := self;
end;

function TCAttribute.Name: TXavierString;
begin
  result := fAttr.NodeName;
end;

function TCAttribute.Text: TXavierString;
begin
  result := fAttr.NodeValue;
end;

function TCAttribute.Text(const aText: TXavierString): IXMLAttribute;
begin
  result := self;
  fAttr.NodeValue := aText;
end;

function TCAttribute.Node: IXMLNode;
begin
  result := TCNode.Create(fParent);
end;

{ TCAttributes }

constructor TCAttributes.Create(aNode: TDOMNode);
begin
  inherited Create;
  fNode := aNode;
end;

function TCAttributes.Ref: IXMLAttributes;
begin
  result := self;
end;

function TCAttributes.Add(const aName, aText: TXavierString): IXMLAttribute;
begin
  TDOMElement(fNode).SetAttribute(aName, aText);
  result := Item(aName);
end;

function TCAttributes.Item(aIndex: Integer): IXMLAttribute;
var
  n: TDOMNode;
begin
  n := fNode.Attributes.Item[aIndex];
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [aIndex]);
  result := TCAttribute.Create(fNode, n);
end;

function TCAttributes.Item(const aName: TXavierString): IXMLAttribute;
var
  a: TDOMNode;
begin
  a := fNode.Attributes.GetNamedItem(aName);
  if not Assigned(a) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TCAttribute.Create(fNode, a);
end;

function TCAttributes.Count: Integer;
begin
  result := fNode.Attributes.Length;
end;

{ TCNode }

constructor TCNode.Create(ANode: TDOMNode);
begin
  inherited Create;
  fNode := ANode;
end;

function TCNode.Ref: IXMLNode;
begin
  result := self;
end;

function TCNode.Name: TXavierString;
begin
  result := fNode.NodeName;
end;

function TCNode.Text: TXavierString;
begin
  result := fNode.TextContent;
end;

function TCNode.Text(const aText: TXavierString): IXMLNode;
begin
  result := self;
  fNode.TextContent := aText;
end;

function TCNode.Attrs: IXMLAttributes;
begin
  result := TCAttributes.Create(fNode);
end;

function TCNode.Add(const aName: TXavierString): IXMLNode;
begin
  result := TCNode.Create(
    fNode.AppendChild(
      fNode.OwnerDocument.CreateElement(TXavierString(AName))
    )
  );
end;

function TCNode.Childs: IXMLNodes;
begin
  result := TCChilds.Create(fNode);
end;

function TCNode.Parent: IXMLNode;
begin
  result := TCNode.Create(fNode.ParentNode);
end;

{ TCNodes }

constructor TCNodes.Create(const aList: IInterfaceList);
begin
  inherited Create;
  fList := aList;
end;

function TCNodes.Ref: IXMLNodes;
begin
  result := self;
end;

function TCNodes.Item(aIndex: Integer): IXMLNode;
begin
  result := fList.Items[AIndex] as IXMLNode;
end;

function TCNodes.Item(const aName: TXavierString): IXMLNode;
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

function TCNodes.Count: Integer;
begin
  result := fList.Count;
end;

{ TCChilds }

constructor TCChilds.Create(aNode: TDOMNode);
begin
  inherited Create;
  fNode := ANode;
end;

function TCChilds.Ref: IXMLNodes;
begin
  result := self;
end;

function TCChilds.Item(aIndex: Integer): IXMLNode;
begin
  result := TCNode.Create(fNode.ChildNodes.Item[AIndex]);
end;

function TCChilds.Item(const aName: TXavierString): IXMLNode;
var
  n: TDOMNode;
begin
  n := fNode.FindNode(aName);
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [AName]);
  result := TCNode.Create(n);
end;

function TCChilds.Count: Integer;
begin
  result := fNode.ChildNodes.Count;
end;

{ TCPack }

constructor TCPack.Create(aStream: TStream);
begin
  inherited Create;
  aStream.Position := 0;
  ReadXMLFile(fDocument, aStream);
end;

destructor TCPack.Destroy;
begin
  fDocument.Free;
  inherited Destroy;
end;

function TCPack.Nodes(const XPath: TXavierString): IXMLNodes;
var
  v: TXPathVariable;
  l: IInterfaceList;
  i: Integer;
begin
  l := TInterfaceList.Create;
  v := EvaluateXPathExpression(XPath, fDocument.DocumentElement);
  try
    if Assigned(v) then
    begin
      for i := 0 to v.AsNodeSet.Count -1 do
        l.Add(TCNode.Create(TDOMNode(v.AsNodeSet[i])));
    end;
    result := TCNodes.Create(l);
  finally
    v.Free;
  end;
end;

function TCPack.Node(const XPath: TXavierString;
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

function TCPack.Stream: IDataStream;
var
  mem: TStream;
begin
  mem := TMemoryStream.Create;
  try
    WriteXMLFile(fDocument, mem);
    result := TDataStream.New(mem);
  finally
    mem.Free;
  end;
end;

end.

