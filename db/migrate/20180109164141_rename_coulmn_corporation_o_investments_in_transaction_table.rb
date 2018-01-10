class RenameCoulmnCorporationOInvestmentsInTransactionTable < ActiveRecord::Migration[5.1]
  def change
  	rename_column :transactions, :corporation_investments_id, :corporation_investment_id 
  end
end
