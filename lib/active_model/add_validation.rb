require 'active_support'
require 'active_model'

require "add_validation/version"
require "add_validation/dsl"

module ActiveModel
  module AddValidation
    extend ActiveSupport::Concern

    included do
      validate :run_additional_validations
    end

    def add_validation(method_name)
      additional_validations << method_name
    end

    private

    def run_additional_validations
      additional_validations.each { |method_name| __send__ method_name }
    end

    def additional_validations
      @_additional_validations ||= []
    end
  end
end
