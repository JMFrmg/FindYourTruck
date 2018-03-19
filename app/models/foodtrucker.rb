class Foodtrucker < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_and_belongs_to_many :users, class_name: "User"
  has_one :menu
  has_many :streetadresses, class_name: "Street"
  has_many :pictures
end
