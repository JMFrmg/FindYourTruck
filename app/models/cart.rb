class Cart < ApplicationRecord
	
	has_and_belongs_to_many :dishes, class_name: "Dish"
end
