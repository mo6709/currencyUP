class CreateCorporations < ActiveRecord::Migration[5.1]
  def change
    create_table :corporations do |t|
      t.string  :regions_array
      t.integer :investment_period
      t.string  :name
      t.string  :title
      
      t.timestamps
    end
  end
end
