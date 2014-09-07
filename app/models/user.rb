class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  has_many :reviews

  has_attached_file :user_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_photo, :content_type => /\Aimage\/.*\Z/
  validates :user_photo, :attachment_presence => true
end
