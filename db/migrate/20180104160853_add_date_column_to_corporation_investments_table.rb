class AddDateColumnToCorporationInvestmentsTable < ActiveRecord::Migration[5.1]
  def change
  	  add_column :corporation_investments, :investment_date, :datetime
  end
end
