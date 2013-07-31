module Toolkit
  module Models
    autoload :Assignable, "toolkit/models/assignable"

    def self.config(mod, *accessors)
      class << mod; attr_accessor :available_configs; end
      mod.available_configs = accessors

      accessors.each do |accessor|
        mod.class_eval <<-METHOD
          def #{accessor}
            if defined?(@#{accessor})
              @#{accessor}
            elsif superclass.respond_to?(:#{accessor})
              superclass.#{accessor}
            else
              Toolkit.#{accessor}
            end
          end

          def #{accessor}=(value)
            @#{accessor} = value
          end
        METHOD
      end
    end

    def toolkit(*modules)
      options = modules.extract_options!.dup

      selected_modules = modules.map(&:to_sym).uniq

      selected_modules.each do |m|
        mod = Toolkit::Models.const_get(m.to_s.classify)

        if mod.const_defined?("ClassMethods")
          class_mod = mod.const_get("ClassMethods")
          extend class_mod

          if class_mod.respond_to?(:available_configs)
            available_configs = class_mod.available_configs
            available_configs.each do |config|
              next unless options.key?(config)
              send(:"#{config}=", options.delete(config))
            end
          end
        end

        include mod
      end

      # options.each { |key, value| send(:"#{key}=", value) }
    end
  end
end

ActiveRecord::Base.extend Toolkit::Models
