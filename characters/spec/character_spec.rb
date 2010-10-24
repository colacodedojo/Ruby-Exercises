# character_spec
require('character')

describe Character, "when creating a default instance" do
    before :all do
        @character = Character.new
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
