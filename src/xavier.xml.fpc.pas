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
unit Xavier.XML.FPC;

{$include xavier.inc}

interface

uses
  Classes, SysUtils,
  DOM, XPath, XMLRead, XMLWrite,
  James.Data,
  James.Data.Clss,
  Xavier.XML;

type
  TCAttribute = class(TInterfacedObject, IXAttribute)
  private
    FParent: TDOMNode;
    FAttr: TDOMNode;
  public
    constructor Create(AParent, AAttr: TDOMNode);
    class function New(AParent, AAttr: TDOMNode): IXAttribute;
    function Name: TXString;
    function Text: TXString; overload;
    function Text(const AText: TXString): IXAttribute; overload;
    function Node: IXNode;
  end;

  TCAttributes = class(TInterfacedObject, IXAttributes)
  private
    FNode: TDOMNode;
  public
    constructor Create(ANode: TDOMNode);
    class function New(ANode: TDOMNode): IXAttributes;
    function Add(const AName, AText: TXString): IXAttribute;
    function Item(AIndex: Integer): IXAttribute; overload;
    function Item(const AName: TXString): IXAttribute; overload;
    function Count: Integer;
  end;

  TCNode = class(TInterfacedObject, IXNode)
  private
    FNode: TDOMNode;
  public
    constructor Create(ANode: TDOMNode);
    class function New(ANode: TDOMNode): IXNode;
    function Name: TXString;
    function Text: TXString; overload;
    function Text(const AText: TXString): IXNode; overload;
    function Attrs: IXAttributes;
    function Add(const AName: TXString): IXNode;
    function Childs: IXNodes;
    function Parent: IXNode;
  end;

  TCNodes = class(TInterfacedObject, IXNodes)
  private
    FList: IInterfaceList;
  public
    constructor Create(AList: IInterfaceList);
    class function New(AList: IInterfaceList): IXNodes;
    function Item(AIndex: Integer): IXNode; overload;
    function Item(const AName: TXString): IXNode; overload;
    function Count: Integer;
  end;

  TCChilds = class(TInterfacedObject, IXNodes)
  private
    FNode: TDOMNode;
  public
    constructor Create(ANode: TDOMNode);
    class function New(ANode: TDOMNode): IXNodes;
    function Item(AIndex: Integer): IXNode; overload;
    function Item(const AName: TXString): IXNode; overload;
    function Count: Integer;
  end;

  TCPack = class(TInterfacedObject, IXPack)
  private
    FDocument: TXMLDocument;
  public
    constructor Create(AStream: TStream); reintroduce;
    destructor Destroy; override;
    function Nodes(const AXPath: TXString): IXNodes;
    function Node(const AXPath: TXString): IXNode;
    function Stream: IDataStream;
  end;

implementation

{ TCAttribute }

constructor TCAttribute.Create(AParent, AAttr: TDOMNode);
begin
  inherited Create;
  { I need to keep the ParentNode and the Attribute itself.
    I do not know why, but using Attr.ParentNode does not work. }
  FParent := AParent;
  FAttr := AAttr;
end;

class function TCAttribute.New(AParent, AAttr: TDOMNode): IXAttribute;
begin
  Result := Create(AParent, AAttr);
end;

function TCAttribute.Name: TXString;
begin
  Result := FAttr.NodeName;
end;

function TCAttribute.Text: TXString;
begin
  Result := FAttr.NodeValue;
end;

function TCAttribute.Text(const AText: TXString): IXAttribute;
begin
  Result := Self;
  FAttr.NodeValue := AText;
end;

function TCAttribute.Node: IXNode;
begin
  Result := TCNode.New(FParent);
end;

{ TCAttributes }

constructor TCAttributes.Create(ANode: TDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TCAttributes.New(ANode: TDOMNode): IXAttributes;
begin
  Result := Create(ANode);
end;

function TCAttributes.Add(const AName, AText: TXString): IXAttribute;
begin
  TDOMElement(FNode).SetAttribute(AName, AText);
  Result := Item(AName);
end;

function TCAttributes.Item(AIndex: Integer): IXAttribute;
var
  A: TDOMNode;
begin
  A := FNode.Attributes.Item[AIndex];
  if not Assigned(A) then
    raise EXError.CreateFmt('Node not found on index %d.', [AIndex]);
  Result := TCAttribute.New(FNode, A);
end;

function TCAttributes.Item(const AName: TXString): IXAttribute;
var
  A: TDOMNode;
begin
  A := FNode.Attributes.GetNamedItem(AName);
  if not Assigned(A) then
    raise EXError.CreateFmt('Node "%s" not found.', [AName]);
  Result := TCAttribute.New(FNode, A);
end;

function TCAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TCNode }

constructor TCNode.Create(ANode: TDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TCNode.New(ANode: TDOMNode): IXNode;
begin
  Result := Create(ANode);
end;

function TCNode.Name: TXString;
begin
  Result := FNode.NodeName;
end;

function TCNode.Text: TXString;
begin
  Result := FNode.TextContent;
end;

function TCNode.Text(const AText: TXString): IXNode;
begin
  Result := Self;
  FNode.TextContent := AText;
end;

function TCNode.Attrs: IXAttributes;
begin
  Result := TCAttributes.New(FNode);
end;

function TCNode.Add(const AName: TXString): IXNode;
begin
  Result := TCNode.New(
    FNode.AppendChild(
      FNode.OwnerDocument.CreateElement(TXString(AName))
    )
  );
end;

function TCNode.Childs: IXNodes;
begin
  Result := TCChilds.New(FNode);
end;

function TCNode.Parent: IXNode;
begin
  Result := TCNode.New(FNode.ParentNode);
end;

{ TCNodes }

constructor TCNodes.Create(AList: IInterfaceList);
begin
  inherited Create;
  FList := AList;
end;

class function TCNodes.New(AList: IInterfaceList): IXNodes;
begin
  Result := Create(AList);
end;

function TCNodes.Item(AIndex: Integer): IXNode;
begin
  Result := FList.Items[AIndex] as IXNode;
end;

function TCNodes.Item(const AName: TXString): IXNode;
var
  I: Integer;
  N: IXNode;
begin
  for I := 0 to FList.Count -1 do
  begin
    N := Item(I);
    if N.Name = AName then
    begin
      Result := N;
      Exit;
    end;
  end;
  raise EXError.CreateFmt('Node "%s" not found.', [AName]);
end;

function TCNodes.Count: Integer;
begin
  Result := FList.Count;
end;

{ TCChilds }

constructor TCChilds.Create(ANode: TDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TCChilds.New(ANode: TDOMNode): IXNodes;
begin
  Result := Create(ANode);
end;

function TCChilds.Item(AIndex: Integer): IXNode;
begin
  Result := TCNode.New(FNode.ChildNodes.Item[AIndex]);
end;

function TCChilds.Item(const AName: TXString): IXNode;
var
  N: TDOMNode;
begin
  N := FNode.FindNode(AName);
  if not Assigned(N) then
    raise EXError.CreateFmt('Node "%s" not found.', [AName]);
  Result := TCNode.New(N);
end;

function TCChilds.Count: Integer;
begin
  Result := FNode.ChildNodes.Count;
end;

{ TCPack }

constructor TCPack.Create(AStream: TStream);
begin
  inherited Create;
  AStream.Position := 0;
  ReadXMLFile(FDocument, AStream);
end;

destructor TCPack.Destroy;
begin
  FDocument.Free;
  inherited Destroy;
end;

function TCPack.Nodes(const AXPath: TXString): IXNodes;
var
  V: TXPathVariable;
  L: IInterfaceList;
  I: Integer;
begin
  L := TInterfaceList.Create;
  V := EvaluateXPathExpression(AXPath, FDocument.DocumentElement);
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

function TCPack.Node(const AXPath: TXString): IXNode;
var
  L: IXNodes;
begin
  L := Nodes(AXPath);
  if L.Count = 0 then
    raise EXError.Create('Node not found.');
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

