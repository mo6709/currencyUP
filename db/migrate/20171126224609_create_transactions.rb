class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer  :corporation_id
      t.integer  :investor_id
      t.integer  :currency_id
      t.float    :total_amount
      t.float    :dolar_rate
      t.float    :return_rate
      t.integer  :t_type

      t.timestamps
    end
  end
end
