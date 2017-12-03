class Corporation < ApplicationRecord
	# Include default devise modules.
	devise :database_authenticatable, :registerable,
	      :recoverable, :rememberable, :trackable, :validatable,
	      :confirmable, :omniauthable
	include DeviseTokenAuth::Concerns::User
    before_save -> { skip_confirmation! }

	serialize :regions_array, Array

	has_many :currency_corporations
	has_many :currencies, through: :currency_corporations
	has_many :transactions
	has_many :investors, through: :transactions
	has_many :corporation_investments
end
