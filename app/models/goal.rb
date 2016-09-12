class Goal < ActiveRecord::Base
  belongs_to :author,
    class_name: 'User',
    foreign_key: :author_id
  
  validates :author, :title, presence: true



end
