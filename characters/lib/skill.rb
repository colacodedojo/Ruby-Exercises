# skill

require "character"

class InvalidAttributeError < Exception
end

class Skill
    attr_reader :name, :governing_attr, :character

    private_class_method :new

    def self.create params
        raise InvalidAttributeError unless 
            Character.attrs_labels.include? params[:governing_attr]

        new params
    end

    def initialize params
        @name = params[:name]
        @governing_attr = params[:governing_attr]
        @character = params[:character]
    end

end
