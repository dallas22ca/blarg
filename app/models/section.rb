class Section < ActiveRecord::Base
  attr_accessible :html, :ordinal, :page_id, :site_id
  
  belongs_to :page, touch: true
  belongs_to :site
  
  has_many :widgets
  
  before_save do
    if self.html == "" || self.html == "<br>" || self.html == "<br />" || !self.html
      if self.element == "section"
        self.html = "Droppable"
      elsif self.element == "img"
        self.html = "/assets/rails.png,http://www.google.com"
      else
        self.html = "1.888.370.0370"
      end
    end
  end
  
  def info
    self.html.split(",")
  end
  
  def alt
    info.last
  end
  
  def href
    info.second
  end
  
  def src
    info.first
  end
end