class CreateCurrencyCorporations < ActiveRecord::Migration[5.1]
  def change
    create_table :currency_corporations do |t|
      t.integer  :currency_id
      t.integer  :corporation_id
      t.float    :total_amount

      t.timestamps
    end
  end
end
