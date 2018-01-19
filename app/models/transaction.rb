class Transaction < ApplicationRecord
	belongs_to :corporation
	belongs_to :currency
	belongs_to :investor
    belongs_to :corporation_investment

	enum :t_type => [:to_corp, :from_corp, :purchased_by_corp]
end

# class Transaction < ActiveRecord::Base

#   # This model has a separate currency column
#   attr_accessible :amount_cents, :currency, :tax_cents

#   # Use model level currency
#   register_currency :gbp

#   monetize :amount_cents, with_model_currency: :currency
#   monetize :tax_cents, with_model_currency: :currency

# end

# # Now instantiating with a specific currency overrides
# # the model and global currencies
# t = Transaction.new(:amount_cents => 2500, :currency => "CAD")
# t.amount == Money.new(2500, "CAD") # true
