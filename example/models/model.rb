class Model
  def initialize(attributes={})
    attributes.each do |attribute, value|
      instance_variable_set("@#{attribute}", value)
    end
  end

  def read_attribute_for_serialization(attribute)
    send(attribute)
  end
end
