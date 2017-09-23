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
  TXMLAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXMLAttribute;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const V: XMLString): IXMLAttribute; overload;
  end;

  TXMLAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXMLAttributes;
    function Item(Idx: Integer): IXMLAttribute; overload;
    function Item(const Name: XMLString): IXMLAttribute; overload;
    function Count: Integer;
  end;

  TXMLNode = class(TInterfacedObject, IXMLNode)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXMLNode;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const V: XMLString): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Childs: IXMLNodes;
    function Parent: IXMLNode;
  end;

  TXMLNodes = class(TInterfacedObject, IXMLNodes)
  private
    FList: IInterfaceList;
  public
    constructor Create(List: IInterfaceList);
    class function New(List: IInterfaceList): IXMLNodes;
    function Add(const {%H-}Name: string): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

  TXMLChilds = class(TInterfacedObject, IXMLNodes)
  private
    FNode: IDOMNode;
  public
    constructor Create(Node: IDOMNode);
    class function New(Node: IDOMNode): IXMLNodes;
    function Add(const Name: string): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

  TXMLPack = class(TInterfacedObject, IXMLPack)
  private
    FDocument: IXMLDocument;
  public
    constructor Create(Stream: TStream); reintroduce;
    function Nodes(const XPath: XMLString): IXMLNodes;
    function Node(const XPath: XMLString): IXMLNode;
    function Stream: IDataStream;
  end;

implementation

{ TXMLAttribute }

constructor TXMLAttribute.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLAttribute.New(Node: IDOMNode): IXMLAttribute;
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

constructor TXMLAttributes.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLAttributes.New(Node: IDOMNode): IXMLAttributes;
begin
  Result := Create(Node);
end;

function TXMLAttributes.Item(Idx: Integer): IXMLAttribute;
begin
  Result := TXMLAttribute.New(FNode.Attributes.Item[Idx]);
  if not Assigned(Result) then
    raise EXMLError.CreateFmt('Node not found on index %d.', [Idx]);
end;

function TXMLAttributes.Item(const Name: XMLString): IXMLAttribute;
begin
  Result := TXMLAttribute.New(FNode.GetNamedItem(Name));
  if not Assigned(Result) then
    raise EXMLError.CreateFmt('Node "%s" not found.', [Name]);
end;

function TXMLAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TXMLNode }

constructor TXMLNode.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLNode.New(Node: IDOMNode): IXMLNode;
begin
  Result := Create(Node);
end;

function TXMLNode.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TXMLNode.Value: XMLString;
begin
  Result := FNode.nodeValue;
end;

function TXMLNode.Value(const V: XMLString): IXMLNode;
begin
  Result := Self;
  FNode.NodeValue := V;
end;

function TXMLNode.Attrs: IXMLAttributes;
begin
  Result := TXMLAttributes.New(FNode);
end;

function TXMLNode.Childs: IXMLNodes;
begin
  Result := TXMLNodes.New(FNode);
end;

function TXMLNode.Parent: IXMLNode;
begin
  Result := TXMLNode.New(FNode.ParentNode);
end;

{ TXMLNodes }

constructor TXMLNodes.Create(List: IInterfaceList);
begin
  inherited Create;
  FList := List;
end;

class function TXMLNodes.New(List: IInterfaceList): IXMLNodes;
begin
  Result := Create(List);
end;

function TXMLNodes.Add(const Name: string): IXMLNodes;
begin
  Result := Self;
  raise EXMLError.Create('This list is read only');
end;

function TXMLNodes.Item(Idx: Integer): IXMLNode;
begin
  Result := FList.Items[Idx] as IXMLNode;
end;

function TXMLNodes.Count: Integer;
begin
  Result := FList.Count;
end;

{ TXMLChilds }

constructor TXMLChilds.Create(Node: IDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

class function TXMLChilds.New(Node: IDOMNode): IXMLNodes;
begin
  Result := Create(Node);
end;

function TXMLChilds.Add(const Name: string): IXMLNodes;
begin
  Result := Self;
  FNode.AppendChild(
    FNode.OwnerDocument.CreateElement(Name)
  );
end;

function TXMLChilds.Item(Idx: Integer): IXMLNode;
begin
  Result := TXMLNode.New(FNode.ChildNodes.Item[Idx]);
end;

function TXMLChilds.Count: Integer;
begin
  Result := FNode.ChildNodes.Length;
end;

{ TXMLPack }

constructor TXMLPack.Create(Stream: TStream);
begin
  inherited Create;
  FDocument := TXMLDocument.Create(nil);
  Stream.Position := 0;
  FDocument.LoadFromStream(Stream);
end;

function TXMLPack.Nodes(const XPath: XMLString): IXMLNodes;
begin
  raise Exception.Create('Not implemented yet');
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
    FDocument.SaveToStream(Stream);
    Result := TDataStream.New(Stream);
  finally
    Stream.Free;
  end;
end;

end.

