class AddOriginalIdAndLocaleToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :original_id, :integer
    add_column :articles, :locale, :string
  end
end
