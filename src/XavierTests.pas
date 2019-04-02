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
unit XavierTests;

{$i Xavier.inc}

interface

uses
  Classes,
  SysUtils,
  JamesDataBase,
  JamesDataCore,
  JamesTestCore,
  JamesTestPlatform,
  XavierBase,
  XavierCore;
  
type
  TXMLFileForTest = class(TDataFile)
  public
    constructor Create; reintroduce;
    function Ref: IDataFile;
  end;

  TXMLStreamForTest = class(TDataStream)
  public
    constructor Create; reintroduce;
  end;

  TXMLPackTest = class(TTestCase)
  published
    procedure TestNew;
    procedure TestLoad;
    procedure TestNode;
    procedure TestNodes;
  end;

  TXMLNodeTest = class(TTestCase)
  published
    procedure TestName;
    procedure TestGetValue;
    procedure TestSetValue;
    procedure TestAttrsNotNull;
    procedure TestAdd;
    procedure TestAddTwoLevels;
    procedure TestChildsNotNull;
    procedure TestParent;
    procedure TestDefault;
  end;

  TXMLNodesTest = class(TTestCase)
  published
    procedure TestItemByIndex;
    procedure TestItemByName;
    procedure TestCount;
    procedure TestEmpty;
  end;

  TXMLChildsTest = class(TTestCase)
  published
    procedure TestItemByIndex;
    procedure TestItemByName;
    procedure TestCount;
  end;

  TXMLAttributeTest = class(TTestCase)
  published
    procedure TestName;
    procedure TestGetValue;
    procedure TestSetValue;
    procedure TestNode;
  end;

  TXMLAttributesTest = class(TTestCase)
  published
    procedure TestAdd;
    procedure TestItemByIndex;
    procedure TestItemByName;
    procedure TestCount;
  end;

implementation

{ TXMLFileForTest }

constructor TXMLFileForTest.Create;
begin
  inherited Create('..\pkg\James.Pack.lpk');
end;

function TXMLFileForTest.Ref: IDataFile;
begin
  result := self;
end;

{ TXMLStreamForTest }

constructor TXMLStreamForTest.Create;
var
  mem: TStringStream;
begin
  mem := TStringStream.Create(
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
  try
    inherited Create(mem);
  finally
    mem.Free;
  end;
end;

{ TXMLPackTest }

procedure TXMLPackTest.TestNew;
var
  N: TXavierString;
begin
  N := 'root';
  CheckEquals(N, TXMLPack.Create(N).Ref.Node('/' + N).Name);
end;

procedure TXMLPackTest.TestLoad;
begin
  CheckNotNull(TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Stream);
end;

procedure TXMLPackTest.TestNode;
begin
  CheckNotNull(
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/CompilerOptions'
    )
  );
end;

procedure TXMLPackTest.TestNodes;
begin
  CheckEquals(
    4,
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Nodes(
      '/CONFIG/Package/CompilerOptions/*'
    )
    .Count
  );
end;

{ TXMLNodeTest }

procedure TXMLNodeTest.TestName;
begin
  CheckEquals(
    TXavierString('CompilerOptions'),
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/CompilerOptions'
    )
    .Name
  );
end;

procedure TXMLNodeTest.TestGetValue;
begin
  CheckEquals(
    TXavierString('foo'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item/name'
    )
    .Text
  );
end;

procedure TXMLNodeTest.TestSetValue;
var
  S: TXavierString;
begin
  S := 'xavier';
  CheckEquals(
    S,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item/name'
    )
    .Text(S)
    .Text
  );
end;

procedure TXMLNodeTest.TestAttrsNotNull;
begin
  CheckEquals(
    0,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/footer'
    )
    .Attrs
    .Count
  );
end;

procedure TXMLNodeTest.TestAdd;
var
  N: IXMLNode;
  C: Integer;
begin
  N := TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node('/root/group/item');
  C := N.Childs.Count;
  CheckEquals(
    C + 2,
    N.Add('item').Parent
      .Add('item').Parent
      .Childs
      .Count
  );
end;

procedure TXMLNodeTest.TestAddTwoLevels;
var
  P: IXMLPack;
begin
  P := TXMLPack.Create('root');
  P.Node('/root')
    .Add('level-1')
    .Add('level-2');
  CheckNotNull(P.Node('/root/level-1/level-2'));
end;

procedure TXMLNodeTest.TestChildsNotNull;
begin
  CheckNotNull(
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group'
    )
    .Childs
  );
end;

procedure TXMLNodeTest.TestParent;
begin
  CheckEquals(
    TXavierString('Package'),
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/CompilerOptions'
    )
    .Parent
    .Name
  );
end;

procedure TXMLNodeTest.TestDefault;
begin
  CheckEquals(
    'foo',
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/xpto',
      TXMLNodeDefault.Create('foo', '')
    )
    .Name
  );
end;

{ TXMLNodesTest }

procedure TXMLNodesTest.TestItemByIndex;
begin
  CheckEquals(
    3,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Nodes(
      '/root/group/item[@id=''1'']'
    )
    .Item(0)
    .Attrs
    .Count
  );
end;

procedure TXMLNodesTest.TestItemByName;
begin
  CheckEquals(
    TXavierString('item'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Nodes(
      '/root/group/item[@id=''1'']'
    )
    .Item('item')
    .Name
  );
end;

procedure TXMLNodesTest.TestCount;
begin
  CheckEquals(
    2,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Nodes(
      '/root/group/item[@a=''1'']'
    )
    .Count
  );
end;

procedure TXMLNodesTest.TestEmpty;
begin
  CheckEquals(
    0,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Nodes(
      '/root/group/item[@xpto=''otpx'']'
    )
    .Count
  );
end;

{ TXMLChildsTest }

procedure TXMLChildsTest.TestItemByIndex;
begin
  CheckEquals(
    TXavierString('foo2'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group'
    )
    .Childs
      .Item(1)
      .Childs
        .Item(0)
        .Text
  );
end;

procedure TXMLChildsTest.TestItemByName;
begin
  CheckEquals(
    TXavierString('item'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group'
    )
    .Childs
    .Item('item')
    .Name
  );
end;

procedure TXMLChildsTest.TestCount;
begin
  CheckEquals(
    2,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group'
    )
    .Childs
    .Count
  );
end;

{ TXMLAttributeTest }

procedure TXMLAttributeTest.TestName;
begin
  CheckEquals(
    TXavierString('Value'),
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Name
  );
end;

procedure TXMLAttributeTest.TestGetValue;
begin
  CheckEquals(
    TXavierString('James.Pack'),
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Text
  );
end;

procedure TXMLAttributeTest.TestSetValue;
var
  S: TXavierString;
begin
  S := 'cyclop';
  CheckEquals(
    S,
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0)
    .Text(S)
    .Text
  );
end;

procedure TXMLAttributeTest.TestNode;
begin
  CheckEquals(
    TXavierString('Name'),
    TXMLPack.Create(TXMLFileForTest.Create.Ref.Stream).Ref.Node(
      '/CONFIG/Package/Name'
    )
    .Attrs
    .Item(0) // goto item
    .Node    // and return to owner TestNode
    .Name
  );
end;

{ TXMLAttributesTest }

procedure TXMLAttributesTest.TestAdd;
begin
  CheckEquals(
    TXavierString('1'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item'
    )
    .Attrs
    .Add('foo', '1')
    .Text
  );
end;

procedure TXMLAttributesTest.TestItemByIndex;
begin
  CheckEquals(
    TXavierString('1'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item'
    )
    .Attrs
    .Item(0)
    .Text
  );
end;

procedure TXMLAttributesTest.TestItemByName;
begin
  CheckEquals(
    TXavierString('1'),
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item'
    )
    .Attrs
    .Item('id')
    .Text
  );
end;

procedure TXMLAttributesTest.TestCount;
begin
  CheckEquals(
    3,
    TXMLPack.Create(TXMLStreamForTest.Create).Ref.Node(
      '/root/group/item'
    )
    .Attrs
    .Count
  );
end;

initialization
  TTestSuite.Create('Core')
    .Ref
    .Add(TTest.Create(TXMLPackTest))
    .Add(TTest.Create(TXMLNodeTest))
    .Add(TTest.Create(TXMLNodesTest))
    .Add(TTest.Create(TXMLChildsTest))
    .Add(TTest.Create(TXMLAttributeTest))
    .Add(TTest.Create(TXMLAttributesTest))

end.

