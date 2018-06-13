module ApplicationHelper
  
  def login_helper
    if current_user.is_a?(OpenStruct)
      (login = link_to "Login", new_user_session_path) +
      "<br>".html_safe + 
      (register = link_to "Register", new_user_registration_path)
    else
      link_to "Log out", destroy_user_session_path, method: :delete
    end
  end

end
