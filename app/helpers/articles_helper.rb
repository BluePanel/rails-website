module ArticlesHelper
  def editedHelper(article)
    t('.edited') + l(article.updated_at) if !article.nil? && !(article.updated_at.eql? article.created_at)
  end
end
