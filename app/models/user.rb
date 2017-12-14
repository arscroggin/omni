class User < ApplicationRecord

    #devise :database_authenticatable, :registerable,
    #   :recoverable, :rememberable, :trackable, :validatable

    devise :omniauthable, omniauth_providers: [:okta]
end
