class Cart < ApplicationRecord
	
	has_and_belongs_to_many :dishes, class_name: "Dish"
	has_and_belongs_to_many :sidedishes, class_name: "Sidedish"
	has_and_belongs_to_many :deserts, class_name: "Desert"
	has_and_belongs_to_many :drinks, class_name: "Drink"
end
