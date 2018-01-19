class AddCryptoColumnToCurrencies < ActiveRecord::Migration[5.1]
    def change
        add_column :currencies, :crypto, :boolean
    end
end
