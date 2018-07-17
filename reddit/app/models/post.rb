class Post < ApplicationRecord
  validates :title, :sub_id, :author_id, presence: true
  
  belongs_to :sub
  
  belongs_to :author,
    class_name: :User
    
  def author?
    current_user.id == author_id
  end
end
