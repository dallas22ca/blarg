class Widget < ActiveRecord::Base
  attr_accessible :ordinal, :section_id, :style, :html
  
  belongs_to :section
  
  default_scope order(:ordinal)
  
  before_create do
    if style == "text"
      self.html = "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment..."
    else
    end
  end
end
