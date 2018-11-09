class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter"
  belongs_to :loser, class_name: "Fighter"

  has_many :turns, dependent: :destroy

  delegate :name, to: :winner, prefix: true, allow_nil: true
  delegate :name, to: :loser, prefix: true, allow_nil: true

  def vs_title
    winner_name + " versus " + loser_name
  end
end