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
unit Xavier.Core.Delphi;

{$include xavier.inc}

interface

uses
  Classes, SysUtils,
  xmlDoc, xmlIntf, xmlDom,
  James.Data,
  James.Data.Clss,
  Xavier.Core;

type
  TXAttribute = class(TInterfacedObject, IXavierAttribute)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXavierAttribute;
    function Name: XavierString;
    function Value: XavierString; overload;
    function Value(const V: XavierString): IXavierAttribute; overload;
  end;

  TXAttributes = class(TInterfacedObject, IXavierAttributes)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXavierAttributes;
    function Add(const Name, Value: XavierString): IXavierAttribute;
    function Item(Idx: Integer): IXavierAttribute; overload;
    function Item(const Name: XavierString): IXavierAttribute; overload;
    function Count: Integer;
  end;

  TXNode = class(TInterfacedObject, IXavierNode)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXavierNode;
    function Name: XavierString;
    function Value: XavierString; overload;
    function Value(const V: XavierString): IXavierNode; overload;
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
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXavierNodes;
    function Item(Idx: Integer): IXavierNode; overload;
    function Item(const Name: XavierString): IXavierNode; overload;
    function Count: Integer;
  end;

  TXPack = class(TInterfacedObject, IXavierPack)
  private
    FDocument: IXMLDocument;
  public
    constructor Create(Stream: TStream); reintroduce;
    function Nodes(const XPath: XavierString): IXavierNodes;
    function Node(const XPath: XavierString): IXavierNode;
    function Stream: IDataStream;
  end;

implementation

{ TXAttribute }

constructor TXAttribute.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXAttribute.New(Node: IDOMNode): IXavierAttribute;
begin
  Result := Create(Node);
end;

function TXAttribute.Name: XavierString;
begin
  Result := FNode.NodeName;
end;

function TXAttribute.Value: XavierString;
begin
  Result := FNode.NodeValue;
end;

function TXAttribute.Value(const V: XavierString): IXavierAttribute;
begin
  Result := Self;
  FNode.NodeValue := V;
end;

{ TXAttributes }

constructor TXAttributes.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXAttributes.New(Node: IDOMNode): IXavierAttributes;
begin
  Result := Create(Node);
end;

function TXAttributes.Add(const Name, Value: XavierString): IXavierAttribute;
begin
  TDOMElement(FNode).SetAttribute(Name, Value);
  Result := TXAttribute.New(FNode.Attributes.GetNamedItem(Name));
end;

function TXAttributes.Item(Idx: Integer): IXavierAttribute;
begin
  Result := TXAttribute.New(FNode.Attributes.Item[Idx]);
  if not Assigned(Result) then
    raise EXavierError.CreateFmt('Node not found on index %d.', [Idx]);
end;

function TXAttributes.Item(const Name: XavierString): IXavierAttribute;
begin
  Result := TXAttribute.New(FNode.GetNamedItem(Name));
  if not Assigned(Result) then
    raise EXavierError.CreateFmt('Node "%s" not found.', [Name]);
end;

function TXAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TXNode }

constructor TXNode.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXNode.New(Node: IDOMNode): IXavierNode;
begin
  Result := Create(Node);
end;

function TXNode.Name: XavierString;
begin
  Result := FNode.NodeName;
end;

function TXNode.Value: XavierString;
begin
  Result := FNode.nodeValue;
end;

function TXNode.Value(const V: XavierString): IXavierNode;
begin
  Result := Self;
  FNode.NodeValue := V;
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
  Result := TXNodes.New(FNode);
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

constructor TXChilds.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXChilds.New(Node: IDOMNode): IXavierNodes;
begin
  Result := Create(Node);
end;

function TXChilds.Item(Idx: Integer): IXavierNode;
begin
  Result := TXNode.New(FNode.ChildNodes.Item[Idx]);
end;

function TXChilds.Item(const Name: XavierString): IXavierNode;
var
  N: IDOMNode;
begin
  N := FNode.FindNode(Name);
  if not Assigned(N) then
    raise EXavierError.CreateFmt('Node "%s" not found.', [Name]);
  Result := TXNode.New(N);
end;

function TXChilds.Count: Integer;
begin
  Result := FNode.ChildNodes.Length;
end;

{ TXPack }

constructor TXPack.Create(Stream: TStream);
begin
  inherited Create;
  FDocument := TXMLDocument.Create(nil);
  Stream.Position := 0;
  FDocument.LoadFromStream(Stream);
end;

function TXPack.Nodes(const XPath: XavierString): IXavierNodes;
begin
  raise Exception.Create('Not implemented yet');
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
    FDocument.SaveToStream(Stream);
    Result := TDataStream.New(Stream);
  finally
    Stream.Free;
  end;
end;

end.

