class Article < ActiveRecord::Base
  resourcify

  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  translates :title, :content, :fallbacks_for_empty_translations => true

  default_scope { order('created_at DESC') }

  self.per_page = BP_CONFIG['articles_per_page']

  def content_preview
      content.truncate(BP_CONFIG['article_preview_sign_length'])
  end

  def self.latest_articles
    limit(BP_CONFIG['count_of_articles_on_index_page'])
  end
end
