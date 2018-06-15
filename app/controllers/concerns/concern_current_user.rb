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
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name =  "Guest"
    guest.last_name = "Guest"
    guest.email = "guest@guest.com"

    # Return the guest object
    guest
  end
end