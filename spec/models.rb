class User < ActiveRecord::Base
  include ActiveModel::AddValidation
  has_many :addresses
end

class Address < ActiveRecord::Base
  belongs_to :user
end
