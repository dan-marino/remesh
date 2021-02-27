class Thought < ApplicationRecord
  validates :text, presence: true, length: { minimum: 1 }
  validates :message_id, presence: true
  belongs_to :message
end
