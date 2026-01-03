class UserActivitiesController < ApplicationController
  before_action :set_activity, only: %i[ show destroy ]

  def index
    @activities = UserActivity.includes(:user).order(created_at: :desc).limit(100)
  end

  def show
    # @activity is set by before_action
  end

  def destroy
    @activity.destroy
    redirect_to user_activities_path, notice: "Log deleted."
  end

  private

  def set_activity
    @activity = UserActivity.find(params[:id])
  end
end