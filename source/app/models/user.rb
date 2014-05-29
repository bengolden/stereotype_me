require 'bcrypt'

class User < ActiveRecord::Base

  has_secure_password

  has_many :votes_submitted, class_name: "Vote", foreign_key: :voter_id
  has_many :votes_for, class_name: "Vote", foreign_key: :voted_on_id
  has_many :attributes, through: :votes_for



	def self.authenticate(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      return @user
    else
      return nil
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
