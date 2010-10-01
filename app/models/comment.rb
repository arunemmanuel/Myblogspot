class Comment < ActiveRecord::Base
validates :name, :email, :body, :presence=>true
validate :article_should_be_published
belongs_to :article
  def article_should_be_published
    errors.add(:article_id, "is not published yet") if article && !article.published?
  end
end
