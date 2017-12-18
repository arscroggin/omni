class WelcomeController < ApplicationController
  
  def initialize
    super # this calls ActionController::Base initialize
    OneLogin::RubySaml::Logging.logger = Logger.new(File.open('./log/ruby-saml.log', 'w'))
  end
  
  
  def index
    @user = current_user
  end
end
