# character

class InvalidAttributeValuesError < Exception
end

class Character
    def self.attrs_labels 
        [:intelligence, :strength, :agility, :charisma]
    end
    
    def self.min_attr_value
        1
    end

    attr_reader :intelligence, :strength, :agility, :charisma

    private_class_method :new

    def self.create attrs={}
        validate_attributes attrs
       new attrs 
    end

    def initialize params={} 
        @intelligence = params[:intelligence] || Character.min_attr_value
        @strength = params[:strength] || Character.min_attr_value 
        @agility = params[:agility] || Character.min_attr_value 
        @charisma = params[:charisma] || Character.min_attr_value 
    end

    private
    def self.validate_attributes attrs
        return if attrs.keys.length == 0

        total = 0
        attrs_labels.each do |label|
            total += attrs[label] || Character.min_attr_value 
        end
        raise InvalidAttributeValuesError unless total <= 20

        attrs_labels.each do |label|
            raise InvalidAttributeValuesError if attrs.key? label and attrs[label] < Character.min_attr_value
        end
    end

end

