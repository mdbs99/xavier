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
  xmlDoc, 
  xmlIntf, 
  xmlDom,
  XavierBase;

type
  TCAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    fNode: IDOMNode;
  public
    constructor Create(ANode: IDOMNode);
    function Ref: IXMLAttribute;
    function Name: TXavierString;
    function Text: TXavierString; overload;
    function Text(const aText: TXavierString): IXMLAttribute; overload;
    function Node: IXMLNode;
  end;

  TCAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    fNode: IDOMNode;
  public
    constructor Create(aNode: IDOMNode);
    function Ref: IXMLAttributes;
    function Add(const aName, aText: TXavierString): IXMLAttribute;
    function Item(aIndex: Integer): IXMLAttribute; overload;
    function Item(const aName: TXavierString): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TCNode = class(TInterfacedObject, IXMLNode)
  private
    fNode: IDOMNode;
  public
    constructor Create(aNode: IDOMNode);
    function Ref: IXMLNode;
    function Name: TXavierString;
    function Text: TXavierString; overload;
    function Text(const aText: TXavierString): IXMLNode; overload;
    function Text(const aText: string): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Add(const aName: TXavierString): IXMLNode;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

  TCNodes = class(TInterfacedObject, IXMLNodes)
  private
    fList: IInterfaceList;
  public
    constructor Create(aList: IInterfaceList);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: TXavierString): IXMLNode; overload;
    function Count: Integer;
  end;

  TCChilds = class(TInterfacedObject, IXMLNodes)
  private
    fNode: IDOMNode;
  public
    constructor Create(aNode: IDOMNode);
    function Ref: IXMLNodes;
    function Item(aIndex: Integer): IXMLNode; overload;
    function Item(const aName: TXavierString): IXMLNode; overload;
    function Count: Integer;
  end;

  TCPack = class(TInterfacedObject, IXMLPack)
  private
    fDocument: IXMLDocument;
  public
    constructor Create(aStream: TStream); reintroduce;
    function Nodes(const XPath: TXavierString): IXMLNodes;
    function Node(const XPath: TXavierString): IXMLNode; overload;
    function Node(const XPath: TXavierString; const aDefault: IXMLNode): IXMLNode; overload;
    function Stream: IDataStream;
  end;

implementation

{ TCAttribute }

constructor TCAttribute.Create(ANode: IDOMNode);
begin
  inherited Create;
  fNode := ANode;
end;

function TCAttribute.Ref: IXMLAttribute;
begin
  result := self;
end;

function TCAttribute.Name: TXavierString;
begin
  result := fNode.NodeName;
end;

function TCAttribute.Text: TXavierString;
begin
  result := fNode.NodeValue;
end;

function TCAttribute.Text(const aText: TXavierString): IXMLAttribute;
begin
  result := self;
  fNode.NodeValue := aText;
end;

function TCAttribute.Node: IXMLNode;
begin
  result := TCNode.New(fNode.ParentNode);
end;

{ TCAttributes }

constructor TCAttributes.Create(aNode: IDOMNode);
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
  n: IDOMNode;
begin
  n := fNode.Attributes.Item[aIndex];
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [aIndex]);
  result := TCAttribute.New(n);
end;

function TCAttributes.Item(const aName: TXavierString): IXMLAttribute;
var
  n: IDOMNode;
begin
  n := fNode.Attributes.GetNamedItem(aName);
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TCAttribute.New(n);
end;

function TCAttributes.Count: Integer;
begin
  result := fNode.Attributes.Length;
end;

{ TCNode }

constructor TCNode.Create(aNode: IDOMNode);
begin
  inherited Create;
  fNode := aNode;
end;

function TCNode.Ref: IXMLNode;
begin
  result := Create(ANode);
end;

function TCNode.Name: TXavierString;
begin
  result := fNode.NodeName;
end;

function TCNode.Text: TXavierString;
begin
  result := fNode.nodeValue;
end;

function TCNode.Text(const aText: TXavierString): IXMLNode;
begin
  result := self;
  fNode.NodeValue := aText;
end;

function TCNode.Text(const aText: string): IXMLNode;
begin
  result := self;
  Text(TXavierString(aText));
end;

function TCNode.Attrs: IXMLAttributes;
begin
  result := TCAttributes.New(fNode);
end;

function TCNode.Add(const aName: TXavierString): IXMLNode;
begin
  result := TCNode.New(
    fNode.AppendChild(
      fNode.OwnerDocument.CreateElement(TXavierString(aName))
    )
  );
end;

function TCNode.Childs: IXMLNodes;
begin
  result := TCNodes.New(fNode);
end;

function TCNode.Parent: IXMLNode;
begin
  result := TCNode.New(fNode.ParentNode);
end;

{ TCNodes }

constructor TCNodes.Create(aList: IInterfaceList);
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
  result := fList.Items[aIndex] as IXMLNode;
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

constructor TCChilds.Create(aNode: IDOMNode);
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
  result := TCNode.New(fNode.ChildNodes.Item[aIndex]);
end;

function TCChilds.Item(const aName: TXavierString): IXMLNode;
var
  n: IDOMNode;
begin
  n := fNode.FindNode(aName);
  if not Assigned(n) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [aName]);
  result := TCNode.New(n);
end;

function TCChilds.Count: Integer;
begin
  result := fNode.ChildNodes.Length;
end;

{ TCPack }

constructor TCPack.Create(aStream: TStream);
begin
  inherited Create;
  fDocument := TXMLDocument.Create(nil);
  AStream.Position := 0;
  fDocument.LoadFromStream(aStream);
end;

function TCPack.Nodes(const XPath: TXavierString): IXMLNodes;
begin
  raise EXMLError.Create('Not implemented yet');
end;

function TCPack.Node(const XPath: TXavierString): IXMLNode;
var
  l: IXMLNodes;
begin
  l := Nodes(XPath);
  if l.Count = 0 then
    raise EXMLError.Create('Node not found.');
  result := l.Item(0);
end;

function TCPack.Node(const XPath: TXavierString;
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

function TCPack.Stream: IDataStream;
var
  mem: TStream;
begin
  mem := TMemoryStream.Create;
  try
    fDocument.SaveToStream(mem);
    result := TDataStream.New(mem);
  finally
    mem.Free;
  end;
end;

end.

