module ActiveModel
  module AddValidation
    module DSL
      extend ActiveSupport::Concern

      module ClassMethods
        def anticipate(anticipating_module)
          define_method "prepare_to_#{anticipating_module.name.underscore}" do
            self.extend anticipating_module
          end
        end
      end
    end
  end
end
