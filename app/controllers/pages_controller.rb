class PagesController < ApplicationController
  def home
    # For demonstrating purposes
    @blogs = Blog.all
    @skills = Skill.all
  end

  def about
  end

  def contact
  end
end
