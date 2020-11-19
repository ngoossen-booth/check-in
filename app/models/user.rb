# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  flights_count   :integer          default(0)
#  password_digest :string
#  phone_number    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:flights, { :class_name => "Flight", :foreign_key => "user_id", :dependent => :destroy })

  validates(:phone_number, { :presence => true })

  
end
