class ApplicationController < ActionController::Base
  include ConcernDeviseWhitelist
  include ConcernSetSource

end
