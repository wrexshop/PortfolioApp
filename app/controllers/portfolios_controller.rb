class PortfoliosController < ApplicationController
  # Remember: before_actoin is only for update show delete edit

  def index
    @portfolio_items = Portfolio.all
  end
  
  def new
    @portfolio_item = Portfolio.new
  end

  def create 
    @portfolio_item = Portfolio.new(allowed_portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        # Redirect to index page
        format.html { redirect_to portfolios_path, notice: 'Your portfolio is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def allowed_portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body)
  end

end
