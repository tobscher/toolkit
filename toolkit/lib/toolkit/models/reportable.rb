module Toolkit
  module Models
    module Reportable
      extend ActiveSupport::Concern

      included do
        define_method :burndown do
          p "Burndown"
        end if self.reportable_options[:burndown]

        define_method :forecast do
          p "Forecast"
        end if self.reportable_options[:forecast]
      end

      module ClassMethods
        Toolkit::Models.config(self, :reportable_options)
      end
    end
  end
end
