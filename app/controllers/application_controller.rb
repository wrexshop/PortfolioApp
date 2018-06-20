class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  include ConcernDeviseWhitelist
  include ConcernSetSource
  include ConcernCurrentUser
  include ConcernDefaultPageContent
end