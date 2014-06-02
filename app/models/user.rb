class User < ActiveRecord::Base

  has_many :submitted_votes, class_name: "Vote", foreign_key: :voter_id
  has_many :received_votes, class_name: "Vote", foreign_key: :voted_on_id
  has_many :properties, through: :received_votes

  include BCrypt

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

  def most_recent_comment_time
    self.submitted_votes.last.created_at if self.submitted_votes.length > 0
  end

  def time_active
    (self.most_recent_comment_time - self.created_at).round.to_s + "s" if self.submitted_votes.length > 0
  end

end
