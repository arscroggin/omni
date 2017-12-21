class SamlSessionsController < Devise::SamlSessionsController

    def create
      puts 'Got in SamlSessionsController#create.'
      super
    end
  end