class Task < ApplicationRecord
  belongs_to :group

  STATUSES = %w[in_progress completed archived].freeze
end
