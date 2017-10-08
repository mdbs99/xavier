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
unit Xavier.Core.FPC;

{$include xavier.inc}

interface

uses
  Classes, SysUtils,
  DOM, XPath, XMLRead, XMLWrite,
  James.Data,
  James.Data.Clss,
  Xavier.Core;

type
  TXAttribute = class(TInterfacedObject, IXavierAttribute)
  private
    FParent: TDOMNode;
    FAttr: TDOMNode;
  public
    constructor Create(Parent, Attr: TDOMNode);
    class function New(Parent, Attr: TDOMNode): IXavierAttribute;
    function Name: XavierString;
    function Text: XavierString; overload;
    function Text(const Value: XavierString): IXavierAttribute; overload;
    function Node: IXavierNode;
  end;

  TXAttributes = class(TInterfacedObject, IXavierAttributes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXavierAttributes;
    function Add(const Name, Value: XavierString): IXavierAttribute;
    function Item(Idx: Integer): IXavierAttribute; overload;
    function Item(const Name: XavierString): IXavierAttribute; overload;
    function Count: Integer;
  end;

  TXNode = class(TInterfacedObject, IXavierNode)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXavierNode;
    function Name: XavierString;
    function Text: XavierString; overload;
    function Text(const Value: XavierString): IXavierNode; overload;
    function Attrs: IXavierAttributes;
    function Add(const Name: XavierString): IXavierNode;
    function Childs: IXavierNodes;
    function Parent: IXavierNode;
  end;

  TXNodes = class(TInterfacedObject, IXavierNodes)
  private
    FList: IInterfaceList;
  public
    constructor Create(List: IInterfaceList);
    class function New(List: IInterfaceList): IXavierNodes;
    function Item(Idx: Integer): IXavierNode; overload;
    function Item(const Name: XavierString): IXavierNode; overload;
    function Count: Integer;
  end;

  TXChilds = class(TInterfacedObject, IXavierNodes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXavierNodes;
    function Item(Idx: Integer): IXavierNode; overload;
    function Item(const Name: XavierString): IXavierNode; overload;
    function Count: Integer;
  end;

  TXPack = class(TInterfacedObject, IXavierPack)
  private
    FDocument: TXMLDocument;
  public
    constructor Create(Stream: TStream); reintroduce;
    destructor Destroy; override;
    function Nodes(const XPath: XavierString): IXavierNodes;
    function Node(const XPath: XavierString): IXavierNode;
    function Stream: IDataStream;
  end;

implementation

{ TXAttribute }

constructor TXAttribute.Create(Parent, Attr: TDOMNode);
begin
  inherited Create;
  { I need to keep the ParentNode and the Attribute itself.
    I do not know why, but using Attr.ParentNode does not work. }
  FParent := Parent;
  FAttr := Attr;
end;

class function TXAttribute.New(Parent, Attr: TDOMNode): IXavierAttribute;
begin
  Result := Create(Parent, Attr);
end;

function TXAttribute.Name: XavierString;
begin
  Result := FAttr.NodeName;
end;

function TXAttribute.Text: XavierString;
begin
  Result := FAttr.NodeValue;
end;

function TXAttribute.Text(const Value: XavierString): IXavierAttribute;
begin
  Result := Self;
  FAttr.NodeValue := Value;
end;

function TXAttribute.Node: IXavierNode;
begin
  Result := TXNode.New(FParent);
end;

{ TXAttributes }

constructor TXAttributes.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXAttributes.New(Node: TDOMNode): IXavierAttributes;
begin
  Result := Create(Node);
end;

function TXAttributes.Add(const Name, Value: XavierString): IXavierAttribute;
begin
  TDOMElement(FNode).SetAttribute(Name, Value);
  Result := Item(Name);
end;

function TXAttributes.Item(Idx: Integer): IXavierAttribute;
var
  A: TDOMNode;
begin
  A := FNode.Attributes.Item[Idx];
  if not Assigned(A) then
    raise EXavierError.CreateFmt('Node not found on index %d.', [Idx]);
  Result := TXAttribute.New(FNode, A);
end;

function TXAttributes.Item(const Name: XavierString): IXavierAttribute;
var
  A: TDOMNode;
begin
  A := FNode.Attributes.GetNamedItem(Name);
  if not Assigned(A) then
    raise EXavierError.CreateFmt('Node "%s" not found.', [Name]);
  Result := TXAttribute.New(FNode, A);
end;

function TXAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TXNode }

constructor TXNode.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXNode.New(Node: TDOMNode): IXavierNode;
begin
  Result := Create(Node);
end;

function TXNode.Name: XavierString;
begin
  Result := FNode.NodeName;
end;

function TXNode.Text: XavierString;
begin
  Result := FNode.TextContent;
end;

function TXNode.Text(const Value: XavierString): IXavierNode;
begin
  Result := Self;
  FNode.TextContent := Value;
end;

function TXNode.Attrs: IXavierAttributes;
begin
  Result := TXAttributes.New(FNode);
end;

function TXNode.Add(const Name: XavierString): IXavierNode;
begin
  Result := TXNode.New(
    FNode.AppendChild(
      FNode.OwnerDocument.CreateElement(XavierString(Name))
    )
  );
end;

function TXNode.Childs: IXavierNodes;
begin
  Result := TXChilds.New(FNode);
end;

function TXNode.Parent: IXavierNode;
begin
  Result := TXNode.New(FNode.ParentNode);
end;

{ TXNodes }

constructor TXNodes.Create(List: IInterfaceList);
begin
  inherited Create;
  FList := List;
end;

class function TXNodes.New(List: IInterfaceList): IXavierNodes;
begin
  Result := Create(List);
end;

function TXNodes.Item(Idx: Integer): IXavierNode;
begin
  Result := FList.Items[Idx] as IXavierNode;
end;

function TXNodes.Item(const Name: XavierString): IXavierNode;
var
  I: Integer;
  N: IXavierNode;
begin
  for I := 0 to FList.Count -1 do
  begin
    N := Item(I);
    if N.Name = Name then
    begin
      Result := N;
      Exit;
    end;
  end;
  raise EXavierError.CreateFmt('Node "%s" not found.', [Name]);
end;

function TXNodes.Count: Integer;
begin
  Result := FList.Count;
end;

{ TXChilds }

constructor TXChilds.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXChilds.New(Node: TDOMNode): IXavierNodes;
begin
  Result := Create(Node);
end;

function TXChilds.Item(Idx: Integer): IXavierNode;
begin
  Result := TXNode.New(FNode.ChildNodes.Item[Idx]);
end;

function TXChilds.Item(const Name: XavierString): IXavierNode;
var
  N: TDOMNode;
begin
  N := FNode.FindNode(Name);
  if not Assigned(N) then
    raise EXavierError.CreateFmt('Node "%s" not found.', [Name]);
  Result := TXNode.New(N);
end;

function TXChilds.Count: Integer;
begin
  Result := FNode.ChildNodes.Count;
end;

{ TXPack }

constructor TXPack.Create(Stream: TStream);
begin
  inherited Create;
  Stream.Position := 0;
  ReadXMLFile(FDocument, Stream);
end;

destructor TXPack.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

function TXPack.Nodes(const XPath: XavierString): IXavierNodes;
var
  V: TXPathVariable;
  L: IInterfaceList;
  I: Integer;
begin
  L := TInterfaceList.Create;
  V := EvaluateXPathExpression(XPath, FDocument.DocumentElement);
  try
    if Assigned(V) then
    begin
      for I := 0 to V.AsNodeSet.Count -1 do
        L.Add(TXNode.New(TDOMNode(V.AsNodeSet[I])));
    end;
    Result := TXNodes.New(L);
  finally
    V.Free;
  end;
end;

function TXPack.Node(const XPath: XavierString): IXavierNode;
var
  L: IXavierNodes;
begin
  L := Nodes(XPath);
  if L.Count = 0 then
    raise EXavierError.Create('Node not found.');
  Result := L.Item(0);
end;

function TXPack.Stream: IDataStream;
var
  Stream: TStream;
begin
  Stream := TMemoryStream.Create;
  try
    WriteXMLFile(FDocument, Stream);
    Result := TDataStream.New(Stream);
  finally
    Stream.Free;
  end;
end;

end.

