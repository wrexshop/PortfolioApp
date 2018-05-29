class PortfoliosController < ApplicationController
  # Remember: before_actoin is only for update show delete edit

  def index
    @portfolio_items = Portfolio.all
  end
  
end
