class CreateInvestors < ActiveRecord::Migration[5.1]
  def change
    create_table :investors do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :region
      t.string  :uid, default: "", null: false
      t.string  :image
      t.string  :password_digest

      
      t.timestamps
    end
  end
end
