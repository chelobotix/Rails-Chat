class Message < ApplicationRecord
  validates :body, presence: true, length: { minimum: 1, maximum: 200 }

  belongs_to :user

  scope :last_twenty_msgs, -> { order(:created_at).last(20) }
end
