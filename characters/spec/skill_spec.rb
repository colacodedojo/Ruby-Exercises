# skill_spec

require "skill"

def default_params
    { :name => :marksmanship,
      :governing_attr => :agility,
      :character => $character }
end

describe Skill, "" do
    before :all do
        @skill = Skill.create :name => :marksmanship,
                           :governing_attr => :agility,
                           :character => :ninja 
    end

    it "has a name attribute" do
        @skill.name.should == :marksmanship
    end

    it "has an governing_attr" do
        @skill.governing_attr.should == :agility
    end

    it "has a character" do
        @skill.character.should == :ninja 
    end

end

describe Skill, "when creating a new instance" do

    it "raises error when governing_attr is not a Character attribute" do
        params = default_params
        params[:governing_attr] = :made_up

        lambda { Skill.create params }.should 
            raise_exception(InvalidAttributeError)
    end

end
