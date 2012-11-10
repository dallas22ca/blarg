class Page < ActiveRecord::Base
  has_permalink
  
  attr_accessible :body, :site_id, :title, :pattern_id, :ordinal
  
  belongs_to :site, touch: true
  belongs_to :pattern
  
  has_many :children, :class_name => "Page", :foreign_key => "parent_id"
  
  validates_presence_of :pattern_id
  
  default_scope order(:ordinal)
  
  scope :roots, where(parent_id: nil)
  
  before_save do
    generate_permalink!
  end
end
