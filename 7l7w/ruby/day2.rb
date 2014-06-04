# 1.a only each
n = 0

(1..16).each do |x|
  print x

  n = n + 1
  if (n % 4) == 0
    puts
  else
    print ", "
  end
end

# 1.b each_slice
(1..16).each_slice(4) do |x|
  puts x.join(', ')
end

# 2
class Tree
  attr_accessor :children, :node_name
  def initialize(name, children=[])
    @children = children
    @node_name = name
  end
  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  def visit(&block)
    block.call self
  end
end
ruby_tree = Tree.new( "Ruby", [Tree.new("Reia" ),
                               Tree.new("MacRuby")] )
puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts
puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
