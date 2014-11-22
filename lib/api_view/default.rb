module ApiView
  class Default < Base
    def self.convert(obj)
      if obj.respond_to? :to_api then
        obj.to_api
      elsif obj.respond_to? :to_hash then
        obj.to_hash
      elsif obj.respond_to? :serializable_hash then
        obj.serializable_hash
      else
        obj
      end
    end
  end
end
