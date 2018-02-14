class AddDefaultValueToCurrencyCorporations < ActiveRecord::Migration[5.1]
  def change
  	  change_column_default :currency_corporations, :total_amount, 0
  	  change_column_default :currency_investors, :total_amount, 0
  end
end
