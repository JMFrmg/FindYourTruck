class Userlocation < ApplicationRecord
  geocoded_by :ip
  after_validation :geocode
end
