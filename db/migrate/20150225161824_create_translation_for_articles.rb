class CreateTranslationForArticles < ActiveRecord::Migration
  def up
    I18n.locale = :en
		Article.create_translation_table!({title: :string, content: :text}, {migrate_data: true})

    # use existing translations for new concept
    I18n.locale = :de
    Article.all.where.not(original_id: nil).each do |old_article|
      original_article = Article.find(old_article.original_id)
			original_article.title = old_article.title
      original_article.content = old_article.content
      original_article.save

      # remove old articles
      old_article.destroy
    end

		# remove old columns
    remove_column :articles, :locale, :string
    remove_column :articles, :original_id, :integer
    remove_column :articles, :title, :string
    remove_column :articles, :content, :text
  end

  def down
    # restore old columns
    add_column :articles, :locale, :string
    add_column :articles, :original_id, :integer

    # restore existing translations
    I18n.locale = :de
    Article.all.each do |article|
			locale_article = Article.new
      locale_article.author_id = article.author_id
      locale_article.original_id = article.id
      locale_article.locale = "de"
      locale_article.title = article.title
      locale_article.content = article.content
      locale_article.save
    end

    I18n.locale = :en
		Article.drop_translation_table! migrate_data: true
    Article.all.where(original_id: nil).each do |article|
      article.locale = "en"
      article.save
    end
  end
end
