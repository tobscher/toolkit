module Toolkit
  module Models
    module Assignable
      extend ActiveSupport::Concern

      included do
        validates :name, :presence => true if self.assignable_options[:name_present]
      end

      module ClassMethods
        Toolkit::Models.config(self, :assignable_options)
      end
    end
  end
end
