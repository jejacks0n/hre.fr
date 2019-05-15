class User
  include ActiveModel::Validations

  attr_accessor :password

  validates :password, password: true, presence: true
end
