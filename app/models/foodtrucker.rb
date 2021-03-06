class Foodtrucker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :users, class_name: "User"
  has_one :menu
  has_many :streetadresses, class_name: "Street"
  has_many :pictures
  has_many :photos
  has_many :posts

  has_attached_file :avatar, :styles => {:large => "500x500", :medium => "300x300>", :thumb => "100x100#" }, :default_url => "logo.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
