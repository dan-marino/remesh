class Message < ApplicationRecord
  validates :text, presence: true, length: { minimum: 1 }
  validates :conversation_id, presence: true
  belongs_to :conversation
  has_many :thoughts, dependent: :destroy
end
