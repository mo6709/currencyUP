class AddCorporationInvestmentsIdColumnToTransactionsTable < ActiveRecord::Migration[5.1]
  def change
  	add_column :transactions, :corporation_investments_id, :integer
  end
end
