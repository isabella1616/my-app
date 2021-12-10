# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

person1 = User.new
p person1

person1.store(:first_name, "Paul")
p person1

person1.store(:last_name, "Jones")
p person1

person2 = User.new
p person2

person2.store(:first_name, "Sarah")
p person2

person2.store(:last_name, "Silverstein")
p person2

person3 = User.new
person3 = { :first_name => "Jessie", :last_name => "Sanders" }

p person1.fetch(:first_name)
p person2.fetch(:first_name)
p person3.fetch(:first_name)



end
