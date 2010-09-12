#tree_spec.rb
require 'tree'

describe Node do
  describe Node, "when first created" do
    it "contains a single value of nil by default" do
      @node = Node.new 
      @node.value.should == nil
    end

    it "allows it's value to be initialized" do
      @node = Node.new 12
      @node.value.should == 12
    end

    it "contains 0 nodes" do
      @node = Node.new 
      @node.nodes.length.should == 0
    end
  end

  describe Node, "when working with value" do
    before(:each) do
     @node = Node.new 
    end
    
    it "does allow value to be set" do
      @node.value = 4
      @node.value.should == 4
    end
  end

  describe Node, "when working with child nodes" do
    before(:each) do
     @node = Node.new 
    end

    it "does not allow nodes to be set" do
      lambda { @node.nodes = [] }.
        should raise_exception(NoMethodError)
    end

    it "allows a child node to be added" do
      @node.add_child Node.new
      @node.nodes.length.should == 1
    end

    it "sorts children when added" do
      @node.add_child(Node.new 3)
      @node.add_child(Node.new 1)
      @node.add_child(Node.new 5)

      @node.nodes[0].value.should == 1
      @node.nodes[1].value.should == 3
      @node.nodes[2].value.should == 5
    end

    it "allows an existing child node to be removed" do
      child = Node.new
      @node.add_child(child)
      @node.nodes.length.should == 1

      @node.remove_child(child)
      @node.nodes.length.should == 0 
    end

    it "fails silently if removing a node that doesn't exist" do
      @node.nodes.length.should == 0
      @node.remove_child Node.new
    end
  end

  describe Node, "when working with subtrees" do
    def build_test_tree
      tree = Node.new 12
      child = Node.new 4
      child.add_child Node.new 2
      tree.add_child child
      tree.add_child Node.new 3
      tree
    end

    it "can compare against another subtree for equality" do
      tree1 = build_test_tree
      tree2 = build_test_tree

      (tree1 == tree2).should be_true
    end

    it "can compare against another subtree for inequality" do
      tree1 = build_test_tree
      tree2 = Node.new 

      (tree1 == tree2).should be_false

      tree1 = build_test_tree
      tree2 = build_test_tree 
      tree2.value = tree1.value + 2

      (tree1 == tree2).should be_false
    end

    it "what happens break circlar stuff" do
      tree1 = Node.new 1 
      child = Node.new 4 
      child.add_child tree1
      tree1.add_child child

      (tree1 == child).should be_false
    end

    it "can iterate over all children using breadth first" do
      tree = Node.new 12
        three = Node.new 3
          two = Node.new 2
        four = Node.new 4
          five = Node.new 5

      tree.add_child three
      three.add_child two
      tree.add_child four
      four.add_child five


      #children are automatically sorted
      should_visit = [12, 3, 4, 2, 5]
      visited = []
      tree.visit :breadth do |value|
        visited.push value 
      end

      (visited == should_visit).should be_true
    end

    it "can iterate over all children using depth first" do
      tree = Node.new 12
        three = Node.new 3
          two = Node.new 2
        four = Node.new 4
          five = Node.new 5

      tree.add_child three
      three.add_child two
      tree.add_child four
      four.add_child five

      should_visit = [12, 3, 2, 4, 5]
      visited = []
      tree.visit :depth do |value|
        visited.push value 
      end

      (visited == should_visit).should be_true
    end

    it "throws error if trying to iterate with unknown algorithm" do
      tree = build_test_tree

      lambda {
        tree.visit :unknown_algo do |node|
        end
      }.should raise_exception UnknownAlgorithmError
    end
  end
end


