module Shadmin
  class ApplicationController < ActionController::Base
  	before_filter :authenticate_admin!
  end
end
