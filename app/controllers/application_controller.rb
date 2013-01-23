class ApplicationController < ActionController::Base
  protect_from_forgery

  def raise_not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
