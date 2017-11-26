class CreateCurrencies < ActiveRecord::Migration[5.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.float  :rate
      t.string :region
      t.string :icon

      t.timestamps
    end
  end
end
