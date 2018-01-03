class Transaction < ApplicationRecord
	belongs_to :corporation
	belongs_to :currency
	belongs_to :investor
    belongs_to :corporation_investments

	enum :t_type => [:to_corp, :from_corp, :purchased_by_corp]
end
