class SamlSessionsController < Devise::SamlSessionsController

    def create
      super
      
      # User and Org
      user = current_user

      if user.organization.nil?
        domain = user.email.split("@").last.downcase
        org = Organization.find_by_domain(domain)

        if org != nil
          org.users << user
        end

      end
    end

    def idp_sign_out
      super
    end
    
end