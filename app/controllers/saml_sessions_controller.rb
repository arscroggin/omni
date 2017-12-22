class SamlSessionsController < Devise::SamlSessionsController

    def create
      super
      
      # TODO: How do I tie the logged in user to an organization?
      user = current_user
    end

    def idp_sign_out
      super
    end
    
end