module ConcernCurrentUser
  extend ActiveSupport::Concern
  # Purpose: Determines if a user is logged in 
  #          and renders the appropriate links.
  
  included do
    before_action :current_user
  end

  # Determine type of current user
  def current_user
    super || guest_user
  end

  # Create a guest user
  def guest_user
    OpenStruct.new(name: "Guest User", 
                   first_name: "Guest", 
                   last_name: "Guest", 
                   email: "guest@guest.com"
                   )
  end
end