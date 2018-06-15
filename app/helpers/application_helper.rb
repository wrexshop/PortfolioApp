module ApplicationHelper
  
  # Displayed on home page
  def sample_helper
    content_tag(:div, "Sample Helper!")
  end

  def login_helper
    if current_user.is_a?(GuestUser)
      (login = link_to "Login", new_user_session_path) +
      "<br>".html_safe + 
      (register = link_to "Register", new_user_registration_path)
    else
      link_to "Log out", destroy_user_session_path, method: :delete
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}" +
                  " and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def set_copyright
    msg = 'All rights reserved.'
    my_name = 'Powered by Wrexshop Productions'

    WrexViewTool::Renderer.copyright my_name, msg 
  end
end
