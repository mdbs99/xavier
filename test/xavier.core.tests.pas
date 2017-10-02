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
unit Xavier.Core.Tests;

{$include xavier.inc}

interface

uses
  Classes, SysUtils,
  James.Data,
  James.Data.Clss,
  James.IO,
  James.IO.Clss,
  James.Testing.Clss,
  Xavier.Core,
  Xavier.Core.Clss;

type
  TXMLFileForTest = class(TFile)
  public
    class function New: IFile; reintroduce;
  end;

  TXMLStreamForTest = class(TDataStream)
  public
    class function New: IDataStream; reintroduce;
  end;

  TXavierPackTest = class(TTestCase)
  published
    procedure New;
    procedure Load;
    procedure Node;
    procedure Nodes;
  end;

  TXavierNodeTest = class(TTestCase)
  published
    procedure Name;
    procedure GetValue;
    procedure SetValue;
    procedure AttrsNotNull;
    procedure Add;
    procedure AddTwoLevels;
    procedure ChildsNotNull;
    procedure Parent;
  end;

  TXavierNodesTest = class(TTestCase)
  published
    procedure ItemByIndex;
    procedure ItemByName;
    procedure Count;
    procedure Empty;
  end;

  TXavierChildsTest = class(TTestCase)
  published
    procedure ItemByIndex;
    procedure ItemByName;
    procedure Count;
  end;

  TXavierAttributeTest = class(TTestCase)
  published
    procedure Name;
    procedure GetValue;
    procedure SetValue;
    procedure Node;
  end;

  TXavierAttributesTest = class(TTestCase)
  published
    procedure Add;
    procedure ItemByIndex;
    procedure ItemByName;
    procedure Count;
  end;

implementation

{ TXMLFileForTest }

class function TXMLFileForTest.New: IFile;
begin
  Result := inherited New('..\pkg\xavier.lpk');
end;

{ TXMLStreamForTest }

class function TXMLStreamForTest.New: IDataStream;
begin
  Result := TDataStream.New(
      '<?xml version="1.0" encoding="UTF-8"?>'
      + '<root>'
      + '  <group>'
      + '    <item id="1" a="1" b="2">'
      + '      <name>foo</name>'
      + '      <value>bar</value>'
      + '    </item>'
      + '    <item id="2" a="1" b="2">'
      + '      <name>foo2</name>'
      + '      <value>bar2</value>'
      + '    </item>'
      + '  </group>'
      + '  <footer>'
      + '    <name>foo</name>'
      + '  </footer>'
      + '</root>'
  );
end;

{ TXavierPackTest }

procedure TXavierPackTest.New;
var
  N: XavierString;
begin
  N := 'root';
  CheckEquals(
    N,
    TXavierPack.New(N).Node('/' + N).Name
  );
end;

procedure TXavierPackTest.Load;
begin
  CheckNotNull(
    TXavierPack.New(TXMLFileForTest.New.Stream).Stream
  );
end;

procedure TXavierPackTest.Node;
begin
  CheckNotNull(
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/CompilerOptions'
    )
  );
end;

procedure TXavierPackTest.Nodes;
begin
  CheckEquals(
    3,
    TXavierPack.New(TXMLFileForTest.New.Stream).Nodes(
      '/CONFIG/Package/CompilerOptions/*'
    )
    .Count
  );
end;

{ TXavierNodeTest }

procedure TXavierNodeTest.Name;
begin
  CheckEquals(
    XavierString('CompilerOptions'),
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/CompilerOptions'
    )
    .Name
  );
end;

procedure TXavierNodeTest.GetValue;
begin
  CheckEquals(
    XavierString('foo'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item/name'
    )
    .Value
  );
end;

procedure TXavierNodeTest.SetValue;
var
  S: XavierString;
begin
  S := 'xavier';
  CheckEquals(
    S,
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item/name'
    )
    .Value(S)
    .Value
  );
end;

procedure TXavierNodeTest.AttrsNotNull;
begin
  CheckEquals(
    0,
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/footer'
    )
    .Attrs
    .Count
  );
end;

procedure TXavierNodeTest.Add;
var
  N: IXavierNode;
  C: Integer;
begin
  N := TXavierPack.New(TXMLStreamForTest.New).Node('/root/group/item');
  C := N.Childs.Count;
  CheckEquals(
    C + 2,
    N.Add('item').Parent
      .Add('item').Parent
      .Childs
      .Count
  );
end;

procedure TXavierNodeTest.AddTwoLevels;
var
  P: IXavierPack;
begin
  P := TXavierPack.New('root');
  P.Node('/root')
    .Add('level-1')
    .Add('level-2');
  CheckNotNull(P.Node('/root/level-1/level-2'));
end;

procedure TXavierNodeTest.ChildsNotNull;
begin
  CheckNotNull(
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group'
    )
    .Childs
  );
end;

procedure TXavierNodeTest.Parent;
begin
  CheckEquals(
    XavierString('Package'),
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/CompilerOptions'
    )
    .Parent
    .Name
  );
end;

{ TXavierNodesTest }

procedure TXavierNodesTest.ItemByIndex;
begin
  CheckEquals(
    3,
    TXavierPack.New(TXMLStreamForTest.New).Nodes(
      '/root/group/item[@id=''1'']'
    )
    .Item(0)
    .Attrs
    .Count
  );
end;

procedure TXavierNodesTest.ItemByName;
begin
  CheckEquals(
    XavierString('item'),
    TXavierPack.New(TXMLStreamForTest.New).Nodes(
      '/root/group/item[@id=''1'']'
    )
    .Item('item')
    .Name
  );
end;

procedure TXavierNodesTest.Count;
begin
  CheckEquals(
    2,
    TXavierPack.New(TXMLStreamForTest.New).Nodes(
      '/root/group/item[@a=''1'']'
    )
    .Count
  );
end;

procedure TXavierNodesTest.Empty;
begin
  CheckEquals(
    0,
    TXavierPack.New(TXMLStreamForTest.New).Nodes(
      '/root/group/item[@xpto=''otpx'']'
    )
    .Count
  );
end;

{ TXavierChildsTest }

procedure TXavierChildsTest.ItemByIndex;
begin
  CheckEquals(
    XavierString('foo2'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group'
    )
    .Childs
      .Item(1)
      .Childs
        .Item(0)
        .Value
  );
end;

procedure TXavierChildsTest.ItemByName;
begin
  CheckEquals(
    XavierString('item'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group'
    )
    .Childs
    .Item('item')
    .Name
  );
end;

procedure TXavierChildsTest.Count;
begin
  CheckEquals(
    2,
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group'
    )
    .Childs
    .Count
  );
end;

{ TXavierAttributeTest }

procedure TXavierAttributeTest.Name;
begin
  CheckEquals(
    XavierString('Value'),
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Name
  );
end;

procedure TXavierAttributeTest.GetValue;
begin
  CheckEquals(
    XavierString('xavier'),
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Value
  );
end;

procedure TXavierAttributeTest.SetValue;
var
  S: XavierString;
begin
  S := 'cyclop';
  CheckEquals(
    S,
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Value(S)
    .Value
  );
end;

procedure TXavierAttributeTest.Node;
begin
  CheckEquals(
    XavierString('Name'),
    TXavierPack.New(TXMLFileForTest.New.Stream).Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0) // goto item
    .Node    // and return to owner node
    .Name
  );
end;

{ TXavierAttributesTest }

procedure TXavierAttributesTest.Add;
begin
  CheckEquals(
    XavierString('1'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item'
    )
    .Attrs
    .Add('foo', '1')
    .Value
  );
end;

procedure TXavierAttributesTest.ItemByIndex;
begin
  CheckEquals(
    XavierString('1'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item'
    )
    .Attrs
    .Item(0)
    .Value
  );
end;

procedure TXavierAttributesTest.ItemByName;
begin
  CheckEquals(
    XavierString('1'),
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item'
    )
    .Attrs
    .Item('id')
    .Value
  );
end;

procedure TXavierAttributesTest.Count;
begin
  CheckEquals(
    3,
    TXavierPack.New(TXMLStreamForTest.New).Node(
      '/root/group/item'
    )
    .Attrs
    .Count
  );
end;

initialization
  TTestSuite.New('Core')
    .Add(TTest.New(TXavierPackTest))
    .Add(TTest.New(TXavierNodeTest))
    .Add(TTest.New(TXavierNodesTest))
    .Add(TTest.New(TXavierChildsTest))
    .Add(TTest.New(TXavierAttributeTest))
    .Add(TTest.New(TXavierAttributesTest))

end.

