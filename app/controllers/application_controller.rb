class ApplicationController < ActionController::Base
  include ConcernDeviseWhitelist
  include ConcernSetSource
  include ConcernCurrentUser
  include ConcernDefaultPageContent
end