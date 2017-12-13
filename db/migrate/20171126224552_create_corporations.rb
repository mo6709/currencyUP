class CreateCorporations < ActiveRecord::Migration[5.1]
  def change
    create_table :corporations do |t|
      t.string  :regions_array
      t.integer :investment_period
      t.string  :name
      t.string  :title
      t.string  :uid, default: "", null: false
      t.string  :image
      t.string  :email
      t.string  :password_digest
      t.timestamps
    end
  end
end
