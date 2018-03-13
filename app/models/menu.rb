class Menu < ApplicationRecord
	belongs_to :foodtrucker
	has_many :dishes, class_name: "Dish"
end
