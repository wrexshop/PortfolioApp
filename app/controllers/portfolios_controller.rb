class PortfoliosController < ApplicationController
  # Remember: before_action is only for update show delete edit
  before_action :portfolio_id, only: [:update, 
                                      :edit,
                                      :show, 
                                      :destroy
                                      ]
  layout 'portfolio'

  access all: [:show, :index, :angular], 
         user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, 
         site_admin: :all

  # Custom action - for custom scope
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def index
    @portfolio_items = Portfolio.by_position
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    # Tell rails not to go anywhere
    head :ok
  end

  def show
  end

  def destroy
    @portfolio_item.destroy

    respond_to do |format|
      redirect_and_notice(format, message:'The portfolio item was deleted.')
    end
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create 
    @portfolio_item = Portfolio.new(allowed_params)

    respond_to do |format|
      if @portfolio_item.save
        # Redirect to index page
        redirect_and_notice(format, message:'Your portfolio is now live.')
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(allowed_params)
        # Redirect to index page
        redirect_and_notice(format, message:'Your portfolio successfully updated.')
      else
        format.html { render :edit }
      end
    end
  end

  private

  def redirect_and_notice(format, message:)
    format.html { redirect_to portfolios_path, notice: message }
  end

  def allowed_params
    params.require(:portfolio).permit(:title, 
                                      :subtitle, 
                                      :body,
                                      technologies_attributes: [:name, :id, :_destroy]
                                      )
  end

  def portfolio_id
    @portfolio_item = Portfolio.find(params[:id])
  end
end
