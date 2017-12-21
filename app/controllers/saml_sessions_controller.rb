class SamlSessionsController < Devise::SamlSessionsController

    def create
      super
      
      # TODO: How do I tie the logged in user to an organization?
      user = current_user
    end

    def idp_sign_out

      if params[:SAMLRequest] && Devise.saml_session_index_key

        saml_config = saml_config(get_idp_entity_id(params))

        logout_request = OneLogin::RubySaml::SloLogoutrequest.new(params[:SAMLRequest], settings: saml_config)

        resource_class.reset_session_key_for(logout_request.name_id)

        redirect_to generate_idp_logout_response(saml_config, logout_request.id)

      elsif params[:SAMLResponse]

        #Currently Devise handles the session invalidation when the request is made.

        #To support a true SP initiated logout response, the request ID would have to be tracked and session invalidated

        #based on that.

        if Devise.saml_sign_out_success_url

          redirect_to Devise.saml_sign_out_success_url

        else

          redirect_to action: :new

        end

      else

        head :invalid_request

      end

  end

  def generate_idp_logout_response(saml_config, logout_request_id)
    OneLogin::RubySaml::SloLogoutresponse.new.create(saml_config, logout_request_id, nil)  
  end


end