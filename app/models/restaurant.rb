class Restaurant < ActiveRecord::Base
  has_attached_file :restaurant_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :restaurant_photo, :content_type => /\Aimage\/.*\Z/
end
