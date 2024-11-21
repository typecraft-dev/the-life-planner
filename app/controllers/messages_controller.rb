class MessagesController < ApplicationController
  before_action :set_task

  def create
    @message = @task.messages.create(message_params)
    @message.user = Current.user
    @message.save

    redirect_to task_path(@task)
  end

  private

  def set_task
    @task ||= Task.find(params[:task_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
