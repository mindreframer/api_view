module ApiView

  class Base < ::Hash

    class << self

      def for_model(model)
        ApiView::Registry.add_model(model, self)
      end

      def render(obj, scope={}, options={})
        options[:use] = self
        ApiView::Engine.render(obj, scope, options)
      end

      def parent_attributes
        parent = self.superclass
        return [] if parent.name == "ApiView::Base"
        return parent.instance_variable_get(:@attributes)
      end

      # defines the basic (flat) fields that will be copied from the main object
      def attributes(*attrs)
        @attributes ||= []
        @attributes = (@attributes + attrs).flatten
        parent_attributes.reverse.each do |a|
          @attributes.unshift(a) if not @attributes.include? a
        end

        # create a method which reads each attribute from the model object and
        # copies it into the hash, then returns the hash itself
        # e.g.,
        # def collect_attributes
        #   self.store(:foo, @object.foo)
        #   ...
        #   self
        # end
        code = ["def collect_attributes()"]
        @attributes.each do |a|
          code << "self.store(:#{a}, @object.#{a})"
        end
        code << "end"
        class_eval(code.join("\n"))
      end
      alias_method :attrs, :attributes

    end

    attr_reader :object
    alias_method :obj, :object

    def initialize(object)
      super(nil)
      @object = object
    end

    def collect_attributes
      # no-op by default
    end

    # this is the method that is supposed to be overriden in the subclass
    def instance_convert
      # no-op by default, override in you subclass
    end

    def convert
      collect_attributes()
      instance_convert
      self
    end

    # hides the details for serialization implementation
    def field(fieldname, field_object, opts={})
      serializer = opts[:via]
      value = if serializer
        serializer.new(field_object).convert
      else
        ApiView::Default.convert(field_object)
      end
      store fieldname, value
    end
  end
end
