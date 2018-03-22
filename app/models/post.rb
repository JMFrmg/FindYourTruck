class Post < ApplicationRecord
  belongs_to :user
  belongs_to :foodtrucker
  acts_as_votable
end
