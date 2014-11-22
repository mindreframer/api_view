
module ApiView
  class Engine

    # Classes which require no further conversion
    BASIC_TYPES = [ String, Integer, Fixnum, Bignum, Float,
                    TrueClass, FalseClass,
                    Time, Date, DateTime ]
    BASIC_TYPES_LOOKUP = BASIC_TYPES.inject({}){ |h, k| h[k] = 1; h }

    class << self

      # Render the given object as JSON or XML
      #
      # @param [Object] obj
      # @param [ActionDispatch::Request] scope
      # @param [Hash] options
      # @option options [String] :format    Request a particular format ("json" or "xml")
      #
      # @return [String]
      def render(obj, scope, options={})
        ret = convert(obj, options)

        # already converted (by default converter, for ex)
        return ret if ret.kind_of? String

        # TODO cache_results { self.send("to_" + format.to_s) }
        format = options[:format] || self.request_format(scope)
        self.send("to_" + format.to_s, ret)
      end

      # Convert the given object into a hash, array or other simple type
      # (String, Fixnum, etc) that can be easily serialized into JSON or XML.
      #
      # @param [Object] obj
      # @return [Object]
      def convert(obj, options=nil)
         # already converted
        return obj                              if is_basic_type?(obj)
        return convert_hash(obj)                if obj.kind_of?(Hash)
        return convert_enumerable(obj, options) if obj.respond_to?(:map)
        return convert_custom_type(obj, options)
      end

      def is_basic_type?(obj)
        BASIC_TYPES_LOOKUP.include?(obj.class)
      end

      def convert_hash(obj)
        ret = {}
        obj.each{ |k,v| ret[k] = convert(v) }
        ret
      end

      def convert_enumerable(obj, options)
        if (options.count == 0) or !options[:cache_array] then
          converter = converter_for(obj.first.class, options)
          return obj.map { |o| converter.new(o).convert }
        else
          return obj.map { |o| convert(o, options) }
        end
      end

      def convert_custom_type(obj, options)
        converter_for(obj.class, options).new(obj).convert
      end

      def converter_for(klazz, options)
        ApiView::Registry.converter_for(klazz, options)
      end

      # Returns a JSON representation of the data object
      def to_json(obj)
        MultiJson.dump(obj)
      end

      # Returns an XML representation of the data object
      def to_xml(obj)
        obj.to_xml()
      end

      # Returns a guess at the format in this scope
      # request_format => "xml"
      def request_format(scope)
        params = scope.respond_to?(:params) ? scope.params : {}
        format = params.has_key?(:format) ? params[:format] : nil
        if request = scope.respond_to?(:request) && scope.request
          format ||= request.format.to_sym.to_s if request.respond_to?(:format)
        end
        format && self.respond_to?("to_#{format}") ? format : "json"
      end

    end
  end
end
