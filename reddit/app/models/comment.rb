class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true
  
  belongs_to :parent_comment,
    class_name: :Comment,
    optional: true
  
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
    
  has_many :child_comments,
    foreign_key: :parent_comment_id,
    class_name: :Comment
    
  belongs_to :post
end
