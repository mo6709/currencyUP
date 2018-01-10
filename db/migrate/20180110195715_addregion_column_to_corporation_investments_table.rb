class AddregionColumnToCorporationInvestmentsTable < ActiveRecord::Migration[5.1]
  def change
  	  add_column :corporation_investments, :region, :string
  end
end
