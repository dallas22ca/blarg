class Medium < ActiveRecord::Base
  attr_accessible :site_id, :file
  belongs_to :site
  
  has_attached_file :file,
    :path => Rails.env.production? ? "/home/deployer/apps/eo/shared/public/media/:path/:hash/:style/:filename" : "#{Rails.root}/public/media/:path/:hash/:style/:filename",
    :url => "/media/:path/:hash/:style/:filename",
    :hash_secret => "ThisIsA4SUPRTKDFKAS{LK$J#KN$#K$}",
    :default_url => "/assets/no_image.jpg",
    :styles => {
      :thumb => ["150x150#"],
      :large => ["1000x"]
    }
    
  scope :images, where("file_content_type = 'image/jpg' OR file_content_type = 'image/jpeg' OR file_content_type = 'image/png' OR file_content_type = 'image/gif'").order("ordinal asc")
  
  default_scope order("created_at desc")
  
  validates_attachment :file,
    :size => { :in => 0..10.megabytes }

  before_post_process :is_image?
  after_post_process :save_image_dimensions
  
  Paperclip.interpolates :path do |medium, style|
    medium.instance.site_id.to_s(36)
  end
  
  def is_image?
    ["image/jpeg", "image/jpg", "image/pjpeg", "image/png", "image/x-png", "image/gif"].include?(self.file_content_type) 
  end

  def save_image_dimensions
    geo = Paperclip::Geometry.from_file(self.file.queued_for_write[:original])
    self.image_width = geo.width
    self.image_height = geo.height
  end
end
