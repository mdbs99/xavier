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
unit XavierAdapters;

{$i Xavier.inc}

interface

uses
  Classes,
  DB,
  Variants,
  SysUtils,
  SynCommons,
  JamesDataBase,
  XavierBase;

type
  /// object to adapt a Node Childs into other types
  TXMLNodesAdapterForDataParams = class(TInterfacedObject, IDataAdapterFor)
  private
    fOrigin: IXMLNode;
    fDest: IDataParams;
    fParamsMustExist: Boolean;
    fAcceptDuplicatedNames: Boolean;
  public
    /// initialize the instance
    constructor Create(const aOrigin: IXMLNode; const aDest: IDataParams); reintroduce;
    /// adapt childs to DataParams
    // - aDest should exist
    procedure Adapt;
    /// if True, destination items should exist to match with the same name as XML nodes
    // - default is True
    property ParamsMustExist: boolean read fParamsMustExist write fParamsMustExist;
    /// if True, it will accept duplicated names in params
    // - if True, ParamsMustExist will be ignored
    // - default is False
    property AcceptDuplicatedNames: boolean read fAcceptDuplicatedNames write fAcceptDuplicatedNames;
  end;

implementation

{ TXMLNodesAdapterForDataParams }

constructor TXMLNodesAdapterForDataParams.Create(const aOrigin: IXMLNode; const aDest: IDataParams);
begin
  inherited Create;
  fOrigin := aOrigin;
  fDest := aDest;
  fParamsMustExist := true;
end;

procedure TXMLNodesAdapterForDataParams.Adapt;
var
  i: Integer;
  n: IXMLNode;
  p: TParam;
begin
  if not assigned(fDest) then
    exit;
  for i := 0 to fOrigin.Childs.Count -1 do
  begin
    n := fOrigin.Childs.Item(i);
    if fDest.Exists(SynUnicodeToUtf8(n.Name)) then
    begin
      p := fDest.Get(SynUnicodeToUtf8(n.Name)).AsParam;
      if n.Text = '' then
        p.Value := NULL
      else
        p.Value := n.Text;
    end;
  end;
end;

end.
