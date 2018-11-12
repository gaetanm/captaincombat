class Fight < ApplicationRecord
  belongs_to :winner, class_name: "Fighter", autosave: true
  belongs_to :loser, class_name: "Fighter", autosave: true

  has_many :turns, dependent: :destroy

  delegate :name, to: :winner, prefix: true, allow_nil: true
  delegate :name, to: :loser, prefix: true, allow_nil: true

  module NullObjects
    def winner
      super || FighterNullObject.new
    end

    def loser
      super || FighterNullObject.new
    end
  end
  include NullObjects
end