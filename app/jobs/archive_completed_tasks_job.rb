class ArchiveCompletedTasksJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Task.where(status: "completed").update_all(status: "archived")
  end
end
