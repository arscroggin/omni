class User < ApplicationRecord
    devise :saml_authenticatable

    has_one :organization

end
