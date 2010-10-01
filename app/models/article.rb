class Article < ActiveRecord::Base
validates :title, :presence=>true
validates :body, :presence=>true
belongs_to :user
has_many :comments, :order=>'created_at DESC', :dependent=>:destroy

    def published?
	published_at.present?
    end
    def owned_by?(owner)
    return false unless owner.is_a? User
    user==owner
    end
end
