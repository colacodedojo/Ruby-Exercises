# skill_spec

require "skill"

def default_params
    { :name => :marksmanship,
      :governing_attr => :agility,
      :character => $character }
end

describe Skill, "when creating a new instance" do

    it "raises error when governing_attr is not a Character attribute" do
        params = default_params
        params[:governing_attr] = :made_up

        lambda { Skill.create params }.should 
            raise_exception(InvalidAttributeError)
    end

end

describe Skill, "" do
    before :all do
        @skill = Skill.create :name => :marksmanship,
                           :governing_attr => :agility,
                           :character => :ninja 
    end

    it "has a readonly name attribute" do
        @skill.name.should == :marksmanship
        lambda { @skill.name = :another }.should raise_exception
    end

    it "has a readonly governing_attr" do
        @skill.governing_attr.should == :agility
        lambda { @skill.governing_attr = :another }.should raise_exception
    end

    it "has a readonly character" do
        @skill.character.should == :ninja 
        lambda { @skill.character = :another }.should raise_exception
    end

    #TODO: figure out what this actually means in terms of system interaction
    it "can be notified of skill use" do
        @skill.used_by(:ability)
    end

end
