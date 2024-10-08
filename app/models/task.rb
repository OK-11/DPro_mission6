class Task < ApplicationRecord
  has_many :user_tasks , dependent: :destroy
  has_many :users , through: :user_tasks


  validates :title, presence: true
  validates :content, presence: true
end
