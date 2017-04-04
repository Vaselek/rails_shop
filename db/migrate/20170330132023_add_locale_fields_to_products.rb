class AddLocaleFieldsToProducts < ActiveRecord::Migration
  def change
    rename_column :products, :title, :title_en
    rename_column :products, :description, :description_en
    add_column :products, :title_ru, :string
    add_column :products, :description_ru, :text
  end
end