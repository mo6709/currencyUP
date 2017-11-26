class CreateCurrencyInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_investors do |t|
        t.integer   :currency_id
    	t.integer   :investor_id
    	t.float     :total_amount

      t.timestamps
    end
  end
end
