class User < ActiveRecord::Base
  include ActiveModel::AddValidation::DSL
  include ActiveModel::AddValidation
  
  anticipate CreatePrimaryAddress

  has_many :addresses
end

class Address < ActiveRecord::Base
  belongs_to :user
end
