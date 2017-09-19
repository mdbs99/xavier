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
unit Xavier.Core.Cross;

{$include xavier.inc}

interface

uses
  Classes,
  Xavier.Core;

type
  TXMLNodes = class(TInterfacedObject, IXMLNodes)
  private
    FList: IInterfaceList;
  public
    constructor Create(List: IInterfaceList);
    class function New(List: IInterfaceList): IXMLNodes;
    function Item(Idx: Integer): IXMLNode;
    function Count: Integer;
  end;

implementation

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

function TXMLNodes.Item(Idx: Integer): IXMLNode;
begin
  Result := FList.Items[Idx] as IXMLNode;
end;

function TXMLNodes.Count: Integer;
begin
  Result := FList.Count;
end;

end.
