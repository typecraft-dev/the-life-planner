class Task < ApplicationRecord
  belongs_to :group
  has_many :messages

  STATUSES = %w[in_progress completed archived].freeze
end
