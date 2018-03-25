class Cart < ApplicationRecord
	
	has_and_belongs_to_many :dishes, class_name: "Dish"
	has_many :sidedishes, class_name: "Sidedish"
	has_many :deserts, class_name: "Desert"
	has_many :drinks, class_name: "Drink"
end
