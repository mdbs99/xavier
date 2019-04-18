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
  JamesTestCore,
  JamesTestPlatform,
  XavierBase,
  XavierCore,
  XavierCorePlatform;
  
type
  TCoreTests = class(TTestCase)
  public
    function NewPack: IXMLPack;
  published
    procedure XMLPack;
    procedure XMLNode;
    procedure XMLNodes;
    procedure XMLChilds;
    procedure XMLAttribute;
    procedure XMLAttributes;
  end;

implementation

{ TCoreTests }

function TCoreTests.NewPack: IXMLPack;
begin
  result := TXMLPack.Create('root');
  with result.Node('/root') do
  begin
    with Add('group') do
    begin
      with Add('item') do
      begin
        with Attrs do
        begin
          Add('a', '1');
          Add('b', '2');
          Add('c', '3');
        end;
        Add('name').Text('foo');
        Add('value').Text('bar');
      end;
      with Add('item') do
      begin
        with Attrs do
        begin
          Add('id', '2');
          Add('a', '1');
          Add('b', '2');
        end;
        Add('name').Text('foo2');
        Add('value').Text('bar2');
      end;
    end;
    Add('empty');
    with Add('footer') do
      Add('name').Text('foo');
  end;
end;

procedure TCoreTests.XMLPack;
var
  pack, pack2: IXMLPack;
  mem: TMemoryStream;
begin
  pack := NewPack;
  check(pack.Node('/root').Name = 'root');
  check(pack.Node('/root/group').Name = 'group');
  check(pack.Node('/root/group').Childs.Count = 2, 'count');
  check(assigned(pack.Node('/root/group/item/name')));
  check(assigned(pack.Node('/root/footer/name')));
  mem := TMemoryStream.Create;
  try
    pack.Stream.Save(mem);
    pack2 := TXMLPack.Create(mem);
    check(pack.Stream.AsRawByteString = pack2.Stream.AsRawByteString, 'streams not equal');
  finally
    mem.Free;
  end;
end;

procedure TCoreTests.XMLNode;
var
  pack: IXMLPack;
  node: IXMLNode;
begin
  pack := NewPack;
  with pack.Node('/root/group/item/name') do
  begin
    check(Name = 'name');
    check(Text = 'foo');
  end;
  with pack.Node('/root/group/item/value') do
  begin
    check(Name = 'value');
    check(Text = 'bar');
  end;
  with pack.Node('/root/group/item/name') do
  begin
    Text('jeff');
    check(Text = 'jeff');
    with Add('new') do
    begin
      Text('abc');
      check(Text = 'abc');
    end;
  end;
  with pack.Node('/root/group') do
  begin
    with Add('new') do
    begin
      with Add('a').Add('b') do
      begin
        check(Parent.Name = 'a', 'b parent');
      end;
      check(Childs.Count = 1, 'new child');
      check(pack.Node('/root/group/new/a').Childs.Count = 1, 'a child');
      check(assigned(pack.Node('/root/group/new/a/b')), 'a/b level');
    end;
  end;
  node := pack.Node('/root/default', TXMLNodeDefault.Create('def', 'text'));
  check(assigned(node), 'node default');
  check(node.Name = 'def', 'default name');
  check(node.Text = 'text', 'default text');
end;

procedure TCoreTests.XMLNodes;
var
  pack: IXMLPack;
  nodes: IXMLNodes;
begin
  pack := NewPack;
  nodes := pack.Nodes('/root/group/*');
  check(nodes.Count = 2);
  check(assigned(nodes.Item('item'))); // by name, get the first
  check(assigned(nodes.Item(0)));
  check(assigned(nodes.Item(1)));
  with pack.Node('/root/group') do
  begin
    Add('new').Text('foo');
    check(nodes.Count = 2); // have not changed nodes list - correct
    check(pack.Nodes('/root/group/*').Count = 3); // new list
  end;
  nodes := pack.Nodes('/root/group/item[@b="2"]');
  check(assigned(nodes), 'xpath @b');
  check(nodes.Count = 2, 'xpath @b count');
  nodes := pack.Nodes('/root/group/item[@id="2"]');
  check(assigned(nodes), 'xpath @id');
  check(nodes.Count = 1, 'xpath @id count');
  check(assigned(nodes.Item(0)), 'nodes has item');
  check(nodes.Item(0).Attrs.Count = 3, 'nodes.attrs.count');
  nodes := pack.Nodes('/root/group/item[@a="1"]');
  check(nodes.Count = 2, 'nodes.count for @a');
  nodes := pack.Nodes('/root/group/item[@xpto="otpx"]');
  check(nodes.Count = 0, 'nodes.count for @xpto');
  nodes := pack.Nodes('/root/group//item'); // it gets all "item" nodes
  check(nodes.Count = 2, 'all items');
end;

procedure TCoreTests.XMLChilds;
var
  pack: IXMLPack;
  node: IXMLNode;
begin
  pack := NewPack;
  node := pack.Node('/root/group/item');
  check(node.Childs.Count = 2);
  check(assigned(node.Childs.Item('name'))); // by name
  check(assigned(node.Childs.Item('value')));
  with pack.Node('/root/empty') do
  begin
    check(assigned(Childs), 'empty childs');
    check(Childs.Count = 0, 'empty childs count');
  end;
  with pack.Node('/root/footer') do
  begin
    check(assigned(Childs), 'footer childs');
    check(Childs.Count = 1, 'footer childs count');
  end;
end;

procedure TCoreTests.XMLAttribute;
var
  pack: IXMLPack;
  node: IXMLNode;
begin
  pack := NewPack;
  node := pack.Node('/root/group/item');
  check(assigned(node.Attrs));
  with node.Attrs do
  begin
    check(Count = 3);
    with Item(0) do
    begin
      check(Name = 'a', 'a name');
      check(Text = '1', 'a text');
    end;
    with Item(1) do
    begin
      check(Name = 'b', 'b name');
      check(Text = '2', 'b text');
    end;
    with Item(2) do
    begin
      check(Name = 'c', 'c name');
      check(Text = '3', 'c text');
    end;
  end;
end;

procedure TCoreTests.XMLAttributes;
var
  pack: IXMLPack;
  node: IXMLNode;
begin
  pack := NewPack;
  node := pack.Node('/root/footer');
  check(assigned(node.Attrs));
  with node.Attrs do
  begin
    check(Count = 0, 'footer: count 0');
    Add('a','1');
    Add('b','2');
    check(Count = 2, 'footer: count 2');
    with Item(0) do
    begin
      check(Name = 'a', 'footer a name');
      check(Text = '1', 'footer a text');
    end;
    with Item(1) do
    begin
      check(Name = 'b', 'footer b name');
      check(Text = '2', 'footer b value');
    end;
  end;

end;

initialization
  TTestSuite.Create('Core')
    .Ref
    .Add(TTest.Create(TCoreTests))

end.

