class ApplicationController < ActionController::Base
  include ConcernDeviseWhitelist
  include ConcernSetSource
  include ConcernCurrentUser
  
end
