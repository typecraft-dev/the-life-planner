class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user
  after_commit :notify_task

  def notify_task
    broadcast_append_to(
      [ task, "messages" ],
      target: "messages",
      partial: "messages/message",
      locals: { message: self }
    )
  end
end
