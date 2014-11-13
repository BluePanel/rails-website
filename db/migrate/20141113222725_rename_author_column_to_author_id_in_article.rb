class RenameAuthorColumnToAuthorIdInArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :author, :author_id
  end
end
