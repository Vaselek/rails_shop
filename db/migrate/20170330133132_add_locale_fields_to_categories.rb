class AddLocaleFieldsToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :name, :name_en
    add_column :categories, :name_ru, :string
  end
end
