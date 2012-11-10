class Site < ActiveRecord::Base
  has_permalink
  
  attr_accessible :title, :design_id
  
  belongs_to :design
  
  has_many :pages
  has_many :siteships
  has_many :sections
  has_many :media

  has_many :users, through: :siteships
  
  validates_presence_of :title
  
  before_create do
    self.design = Design.all.sample
  end
  
  after_create do
    pages.create(
      title: "Home",
      pattern_id: design.patterns.sample.id,
      ordinal: 0
    )
    pages.create(
      title: "About Us",
      pattern_id: design.patterns.sample.id,
      ordinal: 1
    )
    pages.create(
      title: "Contact Us",
      pattern_id: design.patterns.sample.id,
      ordinal: 2
    )
  end
  
  before_save do
    generate_permalink!
  end
end
