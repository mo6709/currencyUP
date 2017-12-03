class Investor < ApplicationRecord
  # Include default devise modules.
	devise :database_authenticatable, :registerable,
	      :recoverable, :rememberable, :trackable, :validatable,
	      :confirmable, :omniauthable
	include DeviseTokenAuth::Concerns::User

	before_save -> { skip_confirmation! }

	has_many :currency_investors
	has_many :currencies, through: :currency_investors
	has_many :transactions 
	has_many :corporations, through: :transactions

end
