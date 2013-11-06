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

      class Requirements
        attr_reader :messages

        def initialize
          @messages = []
        end

        def check
          check1 && check2
        end

        private

        def check1
          messages << "`Assignable` requires a column `assigned_to_id` in the model table."
          false
        end

        def check2
          messages << "`Assignable` requires a view update: `toolkit/assignable/assign.html.erb`."
          false
        end
      end
    end
  end
end
