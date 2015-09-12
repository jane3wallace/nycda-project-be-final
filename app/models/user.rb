class User < ActiveRecord::Base
  
  # one to many relationship for users table to bookmarks table
  has_many :bookmarks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # below added for paperclip
  has_attached_file :avatar, :styles =>
    { :medium => "300x300>", :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :avatar,
    :content_type => /\Aimage\/.*\Z/

  # requires first_name at sign up
  validates :first_name, :presence => true

end
