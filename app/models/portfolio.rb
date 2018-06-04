class Portfolio < ApplicationRecord
  # Unable to create a portfolio unless all data has been filled.
  validates_presence_of :title, :body, :main_image, :thumb_image
end
