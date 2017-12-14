# Just for testing
unless Rails.env.production?
    ENV['OKTA_CLIENT_ID'] = "0oad5f6y0t70zBgj80h7"
    ENV['OKTA_CLIENT_SECRET'] = "00CshvnjQ7lKR8TPRrHBGGpHDqOLQgtQSvau04wbZA"
    ENV['OKTA_ORG'] = "your-org"
    ENV['OKTA_DOMAIN'] = "https://dev-304373.oktapreview.com"
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :okta, ENV['OKTA_CLIENT_ID'], ENV['OKTA_CLIENT_SECRET']
end
