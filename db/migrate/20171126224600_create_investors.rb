class CreateInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :investors do |t|
      t.string   :first_name
      t.string   :last_name
      t.string   :email
      t.string   :region
      
      t.timestamps
    end
  end
end
