class Design < ActiveRecord::Base
  attr_accessible :css, :js, :token, :patterns_attributes, :name
  
  has_many :sites
  has_many :patterns
  
  accepts_nested_attributes_for :patterns, allow_destroy: true
  
  before_create do
    self.token = SecureRandom.hex(10)
  end
  
  def to_param
    token
  end
end
