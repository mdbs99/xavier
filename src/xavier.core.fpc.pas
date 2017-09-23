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
  TCAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLAttribute;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const V: XMLString): IXMLAttribute; overload;
  end;

  TCAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLAttributes;
    function Item(Idx: Integer): IXMLAttribute; overload;
    function Item(const Name: XMLString): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TCNode = class(TInterfacedObject, IXMLNode)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLNode;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const V: XMLString): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

  TCNodes = class(TInterfacedObject, IXMLNodes)
  private
    FList: IInterfaceList;
  public
    constructor Create(List: IInterfaceList);
    class function New(List: IInterfaceList): IXMLNodes;
    function Add(const {%H-}Name: string): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

  TCChilds = class(TInterfacedObject, IXMLNodes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLNodes;
    function Add(const Name: string): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

  TCPack = class(TInterfacedObject, IXMLPack)
  private
    FDocument: TXMLDocument;
  public
    constructor Create(Stream: TStream); reintroduce;
    destructor Destroy; override;
    function Nodes(const XPath: XMLString): IXMLNodes;
    function Node(const XPath: XMLString): IXMLNode;
    function Stream: IDataStream;
  end;

implementation

{ TCAttribute }

constructor TCAttribute.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TCAttribute.New(Node: TDOMNode): IXMLAttribute;
begin
  Result := Create(Node);
end;

function TCAttribute.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TCAttribute.Value: XMLString;
begin
  Result := FNode.NodeValue;
end;

function TCAttribute.Value(const V: XMLString): IXMLAttribute;
begin
  Result := Self;
  FNode.NodeValue := V;
end;

{ TCAttributes }

constructor TCAttributes.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TCAttributes.New(Node: TDOMNode): IXMLAttributes;
begin
  Result := Create(Node);
end;

function TCAttributes.Item(Idx: Integer): IXMLAttribute;
begin
  Result := TCAttribute.New(FNode.Attributes.Item[Idx]);
  if not Assigned(Result) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [Idx]);
end;

function TCAttributes.Item(const Name: XMLString): IXMLAttribute;
begin
  Result := TCAttribute.New(FNode.Attributes.GetNamedItem(Name));
  if not Assigned(Result) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [Name]);
end;

function TCAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TCNode }

constructor TCNode.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TCNode.New(Node: TDOMNode): IXMLNode;
begin
  Result := Create(Node);
end;

function TCNode.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TCNode.Value: XMLString;
begin
  Result := FNode.TextContent;
end;

function TCNode.Value(const V: XMLString): IXMLNode;
begin
  Result := Self;
  FNode.TextContent := V;
end;

function TCNode.Attrs: IXMLAttributes;
begin
  Result := TCAttributes.New(FNode);
end;

function TCNode.Childs: IXMLNodes;
begin
  Result := TCChilds.New(FNode);
end;

function TCNode.Parent: IXMLNode;
begin
  Result := TCNode.New(FNode.ParentNode);
end;

{ TCNodes }

constructor TCNodes.Create(List: IInterfaceList);
begin
  inherited Create;
  FList := List;
end;

class function TCNodes.New(List: IInterfaceList): IXMLNodes;
begin
  Result := Create(List);
end;

function TCNodes.Add(const Name: string): IXMLNodes;
begin
  Result := Self;
  raise EXMLError.Create('This list is read only');
end;

function TCNodes.Item(Idx: Integer): IXMLNode;
begin
  Result := FList.Items[Idx] as IXMLNode;
end;

function TCNodes.Count: Integer;
begin
  Result := FList.Count;
end;

{ TCChilds }

constructor TCChilds.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TCChilds.New(Node: TDOMNode): IXMLNodes;
begin
  Result := Create(Node);
end;

function TCChilds.Add(const Name: string): IXMLNodes;
begin
  Result := Self;
  FNode.AppendChild(
    FNode.OwnerDocument.CreateElement(Name)
  );
end;

function TCChilds.Item(Idx: Integer): IXMLNode;
begin
  Result := TCNode.New(FNode.ChildNodes.Item[Idx]);
end;

function TCChilds.Count: Integer;
begin
  Result := FNode.ChildNodes.Count;
end;

{ TCPack }

constructor TCPack.Create(Stream: TStream);
begin
  inherited Create;
  Stream.Position := 0;
  ReadXMLFile(FDocument, Stream);
end;

destructor TCPack.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

function TCPack.Nodes(const XPath: XMLString): IXMLNodes;
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
        L.Add(TCNode.New(TDOMNode(V.AsNodeSet[I])));
    end;
    Result := TCNodes.New(L);
  finally
    V.Free;
  end;
end;

function TCPack.Node(const XPath: XMLString): IXMLNode;
var
  L: IXMLNodes;
begin
  L := Nodes(XPath);
  if L.Count = 0 then
    raise EXMLError.Create('Node not found.');
  Result := L.Item(0);
end;

function TCPack.Stream: IDataStream;
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

