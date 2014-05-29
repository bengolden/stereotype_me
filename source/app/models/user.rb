class User < ActiveRecord::Base
	include BCrypt

  has_many :votes_submitted, class_name: "Vote", foreign_key: :voter_id
  has_many :votes_for, class_name: "Vote", foreign_key: :voted_on_id
  has_many :properties, through: :votes_for

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
