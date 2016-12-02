class Person < ApplicationRecord
  include ActiveModel::Validations
  validates_with IinValidator
end
