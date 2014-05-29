class Vote < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :voted_on, class_name: "User"
  belongs_to :property

end
