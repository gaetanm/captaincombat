class Stuff < ApplicationRecord
  has_many :fighters, dependent: :nullify
end
