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
  XavierBase,
  JamesDataBase;

type
  /// object to adapt a Node Childs into other types
  TXMLNodeChildsAdapter = {$ifdef UNICODE}record{$else}object{$endif}
  private
    fOrigin: IXMLNode;
  public
    /// initialize the instance
    procedure Init(const aOrigin: IXMLNode);
    /// adapt childs to DataParams
    // - aDest should exist
    // - the params list should have items with the same name of node childs
    procedure ToDataParams(const aDest: IDataParams);
  end;

implementation

{ TXMLNodeChildsAdapter }

procedure TXMLNodeChildsAdapter.Init(const aOrigin: IXMLNode);
begin
  fOrigin := aOrigin;
end;

procedure TXMLNodeChildsAdapter.ToDataParams(const aDest: IDataParams);
var
  i: Integer;
  n: IXMLNode;
  p: TParam;
begin
  if not assigned(aDest) then
    exit;
  for i := 0 to fOrigin.Childs.Count -1 do
  begin
    n := fOrigin.Childs.Item(i);
    if aDest.Exists(SynUnicodeToUtf8(n.Name)) then
    begin
      p := aDest.Get(SynUnicodeToUtf8(n.Name)).AsParam;
      if n.Text = '' then
        p.Value := NULL
      else
        p.Value := n.Text;
    end;
  end;
end;

end.
