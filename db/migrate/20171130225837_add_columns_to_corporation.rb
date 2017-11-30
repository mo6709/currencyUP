class AddColumnsToCorporation < ActiveRecord::Migration[5.1]
  def change
  	add_column :corporations, :regions_array, :string 
  	add_column :corporations, :investment_period, :integer
  	add_column :corporations, :title, :string
  end
end
