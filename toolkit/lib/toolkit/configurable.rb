module Toolkit
  module Configurable
    def config(mod, *accessors)
      class << mod; attr_accessor :available_configs; end
      mod.available_configs = accessors

      klass = self.to_s.underscore.split('/')[0].classify

      accessors.each do |accessor|
        mod.class_eval <<-METHOD
          def #{accessor}
            if defined?(@#{accessor})
              @#{accessor}
            elsif superclass.respond_to?(:#{accessor})
              superclass.#{accessor}
            else
              #{klass.constantize}.#{accessor}
            end
          end

          def #{accessor}=(value)
            @#{accessor} = value
          end
METHOD
      end
    end
  end
end
