class Conversation < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1 }
  has_many :messages, dependent: :destroy
end
