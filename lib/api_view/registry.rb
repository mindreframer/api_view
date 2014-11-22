module ApiView
  class Registry
    class << self
      def models
        @models ||= {}
      end

      def add_model(model, converter)
        models[model.to_s] = converter
      end

      def converter_for(clazz, options=nil)
        if options && options[:use].kind_of?(Class) then
          return options[:use]
        end
        models[clazz.to_s] || ApiView::Default
      end
    end
  end
end
