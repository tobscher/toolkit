module Toolkit
  module Models
    extend Toolkit::Configurable

    autoload :Assignable, "toolkit/models/assignable"
    autoload :Reportable, "toolkit/models/reportable"

    def toolkit(*modules)
      options = modules.extract_options!.dup

      selected_modules = modules.map(&:to_sym).uniq

      selected_modules.each do |m|
        mod = nil
        Toolkit.model_paths.each do |path|
          namespace = path
          klass = "#{namespace}/#{m.to_s}".classify
          mod = klass.safe_constantize

          break if mod
        end

        next unless mod
        unless check_requirements_for!(mod)
          p "Feature `#{m}` could not be loaded. It does not meet all the requirements!"
          next
        end

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

        Toolkit.selected_features << m
      end

      # options.each { |key, value| send(:"#{key}=", value) }
    end

    def check_requirements_for!(mod)
      if mod.const_defined?("Requirements")
        req_mod = mod.const_get("Requirements")
        req_mod.new.check
      end

      true
    end
  end
end

ActiveRecord::Base.extend Toolkit::Models
