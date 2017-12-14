class CallbacksController < Devise::OmniauthCallbacksController
    def okta
        @user = User.from_omniauth(request.env["omniauth.auth"])
        sign_in_and_redirect @user
    end

    def passthru
    end
end