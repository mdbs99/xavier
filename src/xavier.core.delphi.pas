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
  xmlDoc, xmlIntf,
  James.Data,
  James.Data.Clss,
  Xavier.Core;

type
  TXMLAttribute = class(TInterfacedObject, IXMLAttribute)
  private
    FNode: IDOMNode;
  public
    constructor Create(ANode: IDOMNode);
    class function New(ANode: IDOMNode): IXMLAttribute;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const AValue: XMLString): IXMLAttribute; overload;
  end;

  TXMLAttributes = class(TInterfacedObject, IXMLAttributes)
  private
    FNode: IDOMNode;
  public
    constructor Create(ANode: IDOMNode);
    class function New(ANode: IDOMNode): IXMLAttributes;
    function Item(AIndex: Integer): IXMLAttribute;
    function Count: Integer;
  end;

  TXMLNode = class(TInterfacedObject, IXMLNode)
  private
    FNode: IDOMNode;
  public
    constructor Create(ANode: IDOMNode);
    class function New(ANode: IDOMNode): IXMLNode;
    function Name: XMLString;
    function Value: XMLString; overload;
    function Value(const AValue: XMLString): IXMLNode; overload;
    function Attrs: IXMLAttributes;
    function Childs: IXMLNodes;
    function Up: IXMLNode;
  end;

  TXMLNodes = class(TInterfacedObject, IXMLNodes)
  private
    FNode: IDOMNode;
  public
    constructor Create(ANode: IDOMNode);
    class function New(ANode: IDOMNode): IXMLNodes;
    function Item(AIndex: Integer): IXMLNode;
    function Count: Integer;
  end;

  TXMLPack = class(TInterfacedObject, IXMLPack)
  private
    FDocument: IXMLDocument;
  public
    constructor Create(AStream: TStream); reintroduce;
    function XPath(const AExpr: XMLString): IXMLNode;
    function Stream: IDataStream;
  end;

implementation

{ TXMLAttribute }

constructor TXMLAttribute.Create(ANode: IDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TXMLAttribute.New(ANode: IDOMNode): IXMLAttribute;
begin
  Result := Create(ANode);
end;

function TXMLAttribute.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TXMLAttribute.Value: XMLString;
begin
  Result := FNode.NodeValue;
end;

function TXMLAttribute.Value(const AValue: XMLString): IXMLAttribute;
begin
  Result := Self;
  FNode.NodeValue := AValue;
end;

{ TXMLAttributes }

constructor TXMLAttributes.Create(ANode: IDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TXMLAttributes.New(ANode: IDOMNode): IXMLAttributes;
begin
  Result := Create(ANode);
end;

function TXMLAttributes.Item(AIndex: Integer): IXMLAttribute;
begin
  Result := TXMLAttribute.New(FNode.Attributes.Item[AIndex]);
end;

function TXMLAttributes.Count: Integer;
begin
  Result := FNode.Attributes.Length;
end;

{ TXMLNode }

constructor TXMLNode.Create(ANode: IDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TXMLNode.New(ANode: IDOMNode): IXMLNode;
begin
  Result := Create(ANode);
end;

function TXMLNode.Name: XMLString;
begin
  Result := FNode.NodeName;
end;

function TXMLNode.Value: XMLString;
begin
  Result := FNode.Text;
end;

function TXMLNode.Value(const AValue: XMLString): IXMLNode;
begin
  Result := Self;
  FNode.Text := AValue;
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

constructor TXMLNodes.Create(ANode: IDOMNode);
begin
  inherited Create;
  FNode := ANode;
end;

class function TXMLNodes.New(ANode: IDOMNode): IXMLNodes;
begin
  Result := Create(ANode);
end;

function TXMLNodes.Item(AIndex: Integer): IXMLNode;
begin
  Result := TXMLNode.New(FNode.ChildNodes.Item[AIndex]);
end;

function TXMLNodes.Count: Integer;
begin
  Result := FNode.ChildNodes.Count;
end;

{ TXMLPack }

constructor TXMLPack.Create(AStream: TStream);
begin
  inherited Create;
  FDocument := TXMLDocument.Create(nil);
  AStream.Position := 0;
  FDocument.LoadFromStream(AStream);
end;

function TXMLPack.XPath(const AExpr: XMLString): IXMLNode;
begin
  raise Exception.Create('Not implemented');
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

