#tree.rb

class UnknownAlgorithmError < Exception 
end

class Node
  attr_accessor :value 
  attr_reader :nodes

  def initialize initial_value = nil
    @value = initial_value
    @nodes = []
  end

  def add_child child
    @nodes.push child
    @nodes.sort! { |node1, node2| node1.value <=> node2.value }
  end

  def remove_child child
    @nodes.delete child
  end

  def == node
    return @value == node.value && @nodes == node.nodes
  end

  def visit algorithm, &block
    return unless block_given?

    yield @value
    return breadth_first_visit &block if algorithm == :breadth 
    return depth_first_visit &block if algorithm == :depth 

    raise UnknownAlgorithmError
  end

  def breadth_first_visit &block
    @nodes.each { |node| yield node.value }
    @nodes.each { |node| node.breadth_first_visit &block }
  end

  def depth_first_visit &block
    @nodes.each do |node| 
      yield node.value
      node.depth_first_visit &block
    end
  end
end
