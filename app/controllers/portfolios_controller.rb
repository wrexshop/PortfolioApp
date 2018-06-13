class PortfoliosController < ApplicationController
  # Remember: before_action is only for update show delete edit
  before_action :portfolio_id, only: [:update, 
                                      :show, 
                                      :edit, 
                                      :destroy
                                      ]
  layout 'portfolio'

  # Custom action - for custom scope
  def angular
    @angular_portfolio_items = Portfolio.angular
  end
  
  def index
    @portfolio_items = Portfolio.all
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

    # Hard coded version - This will change later in the course
    3.times { @portfolio_item.technologies.build }
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
                                      technologies_attributes: [:name]
                                      )
  end

  def portfolio_id
    @portfolio_item = Portfolio.find(params[:id])
  end
end
