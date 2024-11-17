class Task < ApplicationRecord
  STATUSES = %w[in_progress completed archived].freeze
end
