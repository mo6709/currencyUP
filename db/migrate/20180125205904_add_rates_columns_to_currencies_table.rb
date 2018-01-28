class AddRatesColumnsToCurrenciesTable < ActiveRecord::Migration[5.1]
    def change
        add_column :currencies, :yearlly_rates, :string
	    add_column :currencies, :monthly_rates, :string
	    add_column :currencies, :dailly_rates,:string
    end
end
