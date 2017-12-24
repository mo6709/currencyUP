class AddCodeColumnToCurrencies < ActiveRecord::Migration[5.1]
  def change
  	add_column :currencies, :acronym, :string
  end
end
