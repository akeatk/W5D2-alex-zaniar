class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validates :subs, length: { minimum: 1 }
  
  has_many :post_subs
  
  has_many :subs, through: :post_subs
  
  belongs_to :author,
    class_name: :User
    
  def author?
    current_user.id == author_id
  end
end
