class Article < ActiveRecord::Base
  resourcify

  belongs_to :author, :class_name => 'User', :foreign_key => :author_id

  def content_preview
      content.truncate(BP_CONFIG['article_preview_sign_length'])
  end
end
