class Siteship < ActiveRecord::Base
  attr_accessible :site_id, :user_id
  
  belongs_to :user
  belongs_to :site
end
