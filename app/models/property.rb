class Property < ActiveRecord::Base
  has_many :votes

  def votes_for_user(user_id)
    self.votes.find_all_by_voted_on_id(user_id)
  end
end
