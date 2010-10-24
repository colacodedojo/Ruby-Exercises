# character_spec
require('character')

def attrs_label 
    Character.attrs_labels
end

def create_default_attr_hash 
    attrs = {}
    attrs_label.each do |key|
        attrs[key] = 1
    end

    attrs
end

describe Character, "when creating a default character" do
    before :all do
        @character = Character.create 
    end
    
    it "has an intelligence attribute that starts at 1" do
        @character.intelligence.should == 1
    end

    it "has a strength attribute that starts at 1" do
       @character.strength.should == 1 
    end

    it "has an agility attribute that starts at 1" do
      @character.agility.should == 1
    end

    it "has a charisma attribute that starts at 1" do
      @character.charisma.should == 1
    end
end

describe Character, "when initializing attributes" do
    it "raises error when total init values are over 20" do
        attrs = create_default_attr_hash

        attrs_label.each do |key|
            attrs[key] = 20
            lambda { Character.create attrs }.should raise_exception InvalidAttributeValuesError 
        end
    end

    it "rases error when an attribute is less than 1" do
        attrs = create_default_attr_hash
        attrs_label.each do |key|
            attrs[key] = -1
            lambda { Character.create attrs }.should raise_exception InvalidAttributeValuesError
        end
    end

    it "uses default value for any attribute not given" do
        attrs = create_default_attr_hash
        attrs_label.each do |key|
            attrs.delete key
            character = Character.create attrs
            character.method(key).call.should == 1
        end
    end
end


