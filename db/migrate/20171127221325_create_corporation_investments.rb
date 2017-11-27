class CreateCorporationInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :corporation_investments do |t|
      t.integer "currency_id"
      t.integer "corporation_id"
      t.float   "return_rate"
      t.boolean "active"

      t.timestamps
    end
  end
end
