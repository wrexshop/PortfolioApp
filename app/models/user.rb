class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Grab the first element in the collection
  def first_name
    self.name.split.first
  end

  # Grab the second element in the collection
  def last_name
    self.name.split.last
  end
end
