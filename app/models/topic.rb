class Topic < ApplicationRecord
  # Parent of blog
  has_many :blogs

  # Prevent blogs to be created unless all data is filled out
  validates_presence_of :title
end
