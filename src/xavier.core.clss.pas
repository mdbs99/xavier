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
unit Xavier.Core.Clss;

{$include xavier.inc}

interface

uses
  Classes,
  James.Data,
  James.Data.Clss,
  Xavier.Core,
  {$ifdef FPC}
    Xavier.Core.FPC
  {$else}
    Xavier.Core.Delphi
  {$endif}
  ;

type
  {$ifdef FPC}
    AXMLAttribute = Xavier.Core.FPC.TXMLAttribute;
    AXMLAttributes = Xavier.Core.FPC.TXMLAttributes;
    AXMLNode = Xavier.Core.FPC.TXMLNode;
    AXMLNodes = Xavier.Core.FPC.TXMLNodes;
    AXMLPack = Xavier.Core.FPC.TXMLPack;
  {$else}
    AXMLAttribute = Xavier.Core.Delphi.TXMLAttribute;
    AXMLAttributes = Xavier.Core.Delphi.TXMLAttributes;
    AXMLNode = Xavier.Core.Delphi.TXMLNode;
    AXMLNodes = Xavier.Core.Delphi.TXMLNodes;
    AXMLPack = Xavier.Core.Delphi.TXMLPack;
  {$endif}

  TXMLAttribute = AXMLAttribute;

  TXMLAttributes = AXMLAttributes;

  TXMLNode = AXMLNode;

  TXMLNodes = AXMLNodes;

  TXMLPack = class(AXMLPack)
  public
    class function New(AStream: IDataStream): IXMLPack; overload;
    class function New: IXMLPack; overload;
  end;

implementation

{ TXMLPack }

class function TXMLPack.New(AStream: IDataStream): IXMLPack;
var
  Buf: TMemoryStream;
begin
  Buf := TMemoryStream.Create;
  try
    AStream.Save(Buf);
    Result := Create(Buf);
  finally
    Buf.Free;
  end;
end;

class function TXMLPack.New: IXMLPack;
begin
  Result := New(TDataStream.New);
end;

end.
