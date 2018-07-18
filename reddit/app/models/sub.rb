class Sub < ApplicationRecord
  validates :title, :description, :moderator_id, presence: true
  validates :title, uniqueness: true
  
  belongs_to :moderator,
    foreign_key: :moderator_id,
    class_name: :User
    
  has_many :post_subs
    
  has_many :posts, through: :post_subs 
  
  def moderator?
    moderator_id == current_user.id
  end
end
