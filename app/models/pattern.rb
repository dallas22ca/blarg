class Pattern < ActiveRecord::Base
  attr_accessible :design_id, :html, :name
  
  belongs_to :design
  has_many :pages
  
  before_save do
    self.name = self.name.downcase.parameterize
  end
end
