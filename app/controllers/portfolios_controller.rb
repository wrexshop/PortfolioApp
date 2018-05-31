class PortfoliosController < ApplicationController
  # Remember: before_action is only for update show delete edit
  before_action :set_portfolio_id, only: [:update, :show, :edit, :destroy]

  def index
    @portfolio_items = Portfolio.all
  end
  
  def show
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'The portfolio item was deleted.' }
    end
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

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(allowed_portfolio_params)
        # Redirect to index page
        format.html { redirect_to portfolios_path, notice: 'Your portfolio successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def allowed_portfolio_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body)
  end

  def set_portfolio_id
    @portfolio_item = Portfolio.find(params[:id])
  end

end
