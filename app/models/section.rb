class Section < ActiveRecord::Base
  attr_accessible :html, :ordinal, :page_id, :site_id, :updated_at
  
  belongs_to :page, touch: true
  belongs_to :site
  
  has_many :widgets
  
  before_save do
    if self.html == "" || self.html == "<br>" || self.html == "<br />" || !self.html
      if self.element == "section"
        self.html = "Droppable"
      elsif self.element == "img"
        self.html = "/assets/rails.png,"
      else
        self.html = "1.888.370.0370"
      end
    end
  end
  
  after_save do
    if !self.page
      self.site.updated_at = Time.now
      self.site.save
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