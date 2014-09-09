class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  validates :email, presence: true,
                  uniqueness: { case_sensitive: false },
                  format: {
                    with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9\.-]+\.[A-Za-z]+\Z/
                  }

  has_many :reviews

  before_save :downcase_userinfo

  has_attached_file :user_photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :user_photo, :content_type => /\Aimage\/.*\Z/
  validates :user_photo, :attachment_presence => true

  private
    def downcase_userinfo
      self.email = self.email.downcase if self.email
    end
end
