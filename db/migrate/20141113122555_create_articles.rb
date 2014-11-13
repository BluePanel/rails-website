class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.integer :author
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
