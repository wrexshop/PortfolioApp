class Blog < ApplicationRecord
  # in order to toggle the status of the blog
  enum status: { draft: 0, published: 1 }

  extend FriendlyId
  friendly_id :title, use: :slugged

  # Prevent blogs to be created unless there is a title and body
  validates_presence_of :title, :body

  belongs_to :topic
end
