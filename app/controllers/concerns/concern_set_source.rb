module ConcernSetSource
  extend ActiveSupport::Concern
  # Purpose: The method will track where the user is originating from.
  #          The param is stored and shared across all views

  included do
    before_action :set_source
  end

  def set_source
    # :source and :q can be anything
    session[:source] = params[:q] if params[:q]    
  end
end