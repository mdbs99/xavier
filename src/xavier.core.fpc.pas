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
  TXMLAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLAttribute;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const V: XMLString): IXMLAttribute; overload;
  end;

  TXMLAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLAttributes;
    function Item(Idx: Integer): IXMLAttribute;
    function Count: Integer;
  end;

  TXMLNode = class(TInterfacedObject, IXMLNode)
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
    function Up: IXMLNode;
  end;

  TXMLNodes = class(TInterfacedObject, IXMLNodes)
  private
    FNode: TDOMNode;
  public
    constructor Create(Node: TDOMNode);
    class function New(Node: TDOMNode): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

  TXMLPack = class(TInterfacedObject, IXMLPack)
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

{ TXMLAttribute }

constructor TXMLAttribute.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLAttribute.New(Node: TDOMNode): IXMLAttribute;
begin
  Result := Create(Node);
end;

function TXMLAttribute.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TXMLAttribute.Value: XMLString;
begin
  Result := FNode.NodeValue;
end;

function TXMLAttribute.Value(const V: XMLString): IXMLAttribute;
begin
  Result := Self;
  FNode.NodeValue := V;
end;

{ TXMLAttributes }

constructor TXMLAttributes.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLAttributes.New(Node: TDOMNode): IXMLAttributes;
begin
  Result := Create(Node);
end;

function TXMLAttributes.Item(Idx: Integer): IXMLAttribute;
begin
  Result := TXMLAttribute.New(FNode.Attributes.Item[Idx]);
end;

function TXMLAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TXMLNode }

constructor TXMLNode.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLNode.New(Node: TDOMNode): IXMLNode;
begin
  Result := Create(Node);
end;

function TXMLNode.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TXMLNode.Value: XMLString;
begin
  Result := FNode.TextContent;
end;

function TXMLNode.Value(const V: XMLString): IXMLNode;
begin
  Result := Self;
  FNode.TextContent := V;
end;

function TXMLNode.Attrs: IXMLAttributes;
begin
  Result := TXMLAttributes.New(FNode);
end;

function TXMLNode.Childs: IXMLNodes;
begin
  Result := TXMLNodes.New(FNode);
end;

function TXMLNode.Up: IXMLNode;
begin
  Result := TXMLNode.New(FNode.ParentNode);
end;

{ TXMLNodes }

constructor TXMLNodes.Create(Node: TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLNodes.New(Node: TDOMNode): IXMLNodes;
begin
  Result := Create(Node);
end;

function TXMLNodes.Item(Idx: Integer): IXMLNode;
begin
  Result := TXMLNode.New(FNode.ChildNodes.Item[Idx]);
end;

function TXMLNodes.Count: Integer;
begin
  Result := FNode.ChildNodes.Count;
end;

{ TXMLPack }

constructor TXMLPack.Create(Stream: TStream);
begin
  inherited Create;
  Stream.Position := 0;
  ReadXMLFile(FDocument, Stream);
end;

destructor TXMLPack.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

function TXMLPack.Nodes(const XPath: XMLString): IXMLNodes;
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
        L.Add(TXMLNode.New(TDOMNode(V.AsNodeSet[I])));
    end;
    Result := TXMLNodes.New(L);
  finally
    V.Free;
  end;
end;

function TXMLPack.Node(const XPath: XMLString): IXMLNode;
var
  L: IXMLNodes;
begin
  L := Nodes(XPath);
  if L.Count = 0 then
    raise EXMLError.Create('Node not found.');
  Result := L.Item(0);
end;

function TXMLPack.Stream: IDataStream;
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

