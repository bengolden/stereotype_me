class Vote < ActiveRecord::Base

  belongs_to :voter, class_name: "User"
  belongs_to :voted_on, class_name: "User"
  belongs_to :property

  # validates_uniqueness_of :property, scope: [:voter_id, :voted_on_id]

end
