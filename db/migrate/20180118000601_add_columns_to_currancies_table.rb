class AddColumnsToCurranciesTable < ActiveRecord::Migration[5.1]
  def change
  	i = ["priority", "subunit_to_unit", "exponent", "iso_numeric", "smallest_denomination"]
    s = ["thousands_separator", "html_entity", "decimal_mark", "symbol", "iso_code", "subunit"]

    i.each do |culmn|
    	add_column :currencies, culmn.to_sym, :integer
    end

    s.each do |culmn|
    	add_column :currencies, culmn.to_sym, :string
    end

    add_column :currencies, :symbol_first, :boolean
  end
end