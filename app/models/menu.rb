class Menu < ApplicationRecord
	belongs_to :foodtrucker
	has_many :dishes, class_name: "Dish"
	has_many :sidedishes
	has_many :deserts
	has_many :drinks
end
