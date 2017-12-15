$callback = Rails.env.development? ? 'http://localhost:3000' : ENV['CALLBACK_ADDRESS']

Devise.setup do |config|  
    config.saml_create_user = true
    config.saml_update_user = true
    config.saml_default_user_key = :email
    config.saml_session_index_key = :session_index
    config.saml_use_subject = true
    config.idp_settings_adapter = nil
    config.saml_configure do |settings|
      settings.assertion_consumer_service_url     = "#{$callback}/users/saml/auth"
      settings.assertion_consumer_service_binding = "urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"
      settings.name_identifier_format             = "urn:oasis:names:tc:SAML:2.0:nameid-format:transient"
      settings.issuer                             = "#{$callback}/users/saml/metadata"
      settings.authn_context                      = ""
      settings.idp_slo_target_url                 = ""
      settings.idp_sso_target_url                 = "https://dev-304373.oktapreview.com/app/sepdev304373_cbsso_1/exkd9zkqkoswo2jOz0h7/sso/saml"
      settings.idp_cert_fingerprint               = 'AC:08:C9:88:1B:30:C1:C6:8F:2E:17:AA:96:D5:79:E6:BF:65:B2:6B:44:3F:39:8C:DC:D2:FA:B8:9E:29:63:BA'
      settings.idp_cert_fingerprint_algorithm     = 'http://www.w3.org/2000/09/xmldsig#sha256'
    end
  end