module ApplicationHelper
  
  # Displayed on home page
  def sample_helper
    content_tag(:div, "Sample Helper!")
  end

  def login_helper style = ''
    if current_user.is_a?(GuestUser)
      (login = link_to "Login", new_user_session_path, class: style) +
      " ".html_safe + 
      (register = link_to "Register", new_user_registration_path, class: style)
    else
      link_to "Log out", destroy_user_session_path, method: :delete, class: style
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

  def nav_items
    [
      {
        url: root_path,
        title: 'Home'
      },
      {
        url: about_path,
        title: 'About'
      },
      {
        url: contact_path,
        title: 'Contacts'
      },
      {
        url: blogs_path,
        title: 'Blogs'
      },
      {
        url: portfolios_path,
        title: 'Portfolios'
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, sticky: false)
  end

end
