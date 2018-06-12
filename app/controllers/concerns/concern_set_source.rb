module ConcernSetSource
  extend ActiveSupport::Concern

  included do
    before_action :set_source
  end

  def set_source
    # :source and :q can be anything
    session[:source] = params[:q] if params[:q]    
  end
end