class Skill < ApplicationRecord
  # Grant access to Placeholder concern methods
  include Placeholder

  # Data validation
  validates_presence_of :title, :percent_utilized

  # Example setting defaults
  after_initialize :set_defaults

  def set_defaults
    # self is a specific object of portfolio
    # if the main | thumb does not exist
    # use a default image
    self.badge ||= Placeholder.image_generator(height: "250", width: "250")
  end
end
