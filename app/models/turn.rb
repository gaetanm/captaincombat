class Turn < ApplicationRecord
  belongs_to :fight
  belongs_to :initiator, class_name: "Fighter"
  belongs_to :target, class_name: "Fighter"
end
