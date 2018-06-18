class BlogsController < ApplicationController
  # allows actions to have access to the @blogs instance variable
  before_action :set_blog_id, only: [:show, 
                                     :edit, 
                                     :update, 
                                     :destroy, 
                                     :toggle_status
                                    ]
  # Use blog layout
  layout "blog"

  # Specific actions for user roles
  access all: [:show, :index], 
         user: {except: [:toggle_status, :destroy, :new, :create, :update, :edit]}, 
         site_admin: :all

  # GET /blogs
  def index
    @blogs = Blog.page params[:page]
    @page_title = "Blog Section"
  end

  # GET /blogs/1
  def show
    @page_title = @blog.title
    @seo_keywords = @blog.body
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  def create
    @blog = Blog.new(allowed_blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'The blog is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  def update
    respond_to do |format|
      if @blog.update(allowed_blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'The post was delete.' }
    end
  end

  def toggle_status
    if @blog.draft? # if blog status = draft
      @blog.published! # change to publish
    else
      @blog.draft! # change to draft
    end

    redirect_to blogs_url, notice: "The post status was changed to #{@blog.status}."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_id
      @blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allowed_blog_params
      params.require(:blog).permit(:title, :body)
    end
end
