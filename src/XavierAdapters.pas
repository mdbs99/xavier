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
  SysUtils,
  SynCommons,
  JamesDataBase,
  JamesDataCore;

type
  TXMLRootNameAdapter = {$ifdef UNICODE}record{$else}object{$endif}
  private
    fRootName: RawUTF8;
  public
    procedure Init(const aRootName: RawUTF8);
    function AsDataStream: IDataStream;
    procedure ToStream(const aDest: TStream);
  end;

implementation

{ TXMLRootNameAdapter }

procedure TXMLRootNameAdapter.Init(const aRootName: RawUTF8);
begin
  fRootName := aRootName;
end;

function TXMLRootNameAdapter.AsDataStream: IDataStream;
begin
  result := TDataStream.Create(
    FormatUTF8('<?xml version="1.0" encoding="UTF-8"?><% />', [fRootName])
  )
end;

procedure TXMLRootNameAdapter.ToStream(const aDest: TStream);
begin
  AsDataStream.Save(aDest);
end;

end.

