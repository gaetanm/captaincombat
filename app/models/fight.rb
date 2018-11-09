class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter"
  belongs_to :loser, class_name: "Fighter"

  has_many :turns

  delegate :name, to: :winner, prefix: true, allow_nil: true
end
