class Article < ActiveRecord::Base
  resourcify

  has_many :translations, :class_name => 'Article', :foreign_key => :original_id, :inverse_of => :original
  belongs_to :original, :class_name => 'Article', :foreign_key => :original_id, :inverse_of => :translations

  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  validates_uniqueness_of :original_id, scope: :locale, allow_blank: true
  validates_presence_of :locale

  default_scope { order('created_at DESC') }

  def content_preview
      content.truncate(BP_CONFIG['article_preview_sign_length'])
  end

  def self.latest_articles
    limit(BP_CONFIG['count_of_articles_on_index_page'])
  end
end
