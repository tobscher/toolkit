module Foo::Extensions::Models
  module AdvancedFeature
    extend ActiveSupport::Concern

    included do
      define_method :advanced do
        p "Advanced Feature #{self.class.advanced_options}"
      end
    end

    module ClassMethods
      Foo::Extensions::Models.config(self, :advanced_options)
    end
  end
end
