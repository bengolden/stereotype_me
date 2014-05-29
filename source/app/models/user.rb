require 'bcrypt'

class User < ActiveRecord::Base
	include BCrypt
	has_secure_password

  has_many :votes_submitted, class_name: "Vote", foreign_key: :voter_id
  has_many :votes_for, class_name: "Vote", foreign_key: :voted_on_id
  has_many :attributes, through: :votes_for
end
