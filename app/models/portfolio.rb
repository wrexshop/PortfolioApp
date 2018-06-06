class Portfolio < ApplicationRecord
  # Access to Placeholder concern methods
  include Placeholder

  # Parent of technology
  has_many :technologies
  
  # Unable to create a portfolio unless all data has been filled.
  validates_presence_of :title, :body, :main_image, :thumb_image

  # Custom scope example - best practice
  # It will grab all portfolios with angular subtitle
  def self.angular
    where(subtitle: 'Angular')
  end

  # Example setting defaults
  after_initialize :set_defaults

  def set_defaults
    # self is a specific object of portfolio
    # if the main | thumb does not exist
    # use a default image
    self.main_image ||= Placeholder.image_generator(height: "600", width: "400")
    self.thumb_image ||= Placeholder.image_generator(height: "350", width: "200")
  end
end
