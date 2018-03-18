class Street < ApplicationRecord
	belongs_to :foodtrucker
	geocoded_by :address
	after_validation :geocode
end
