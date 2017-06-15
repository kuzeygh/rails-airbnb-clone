class DashboardsController < ApplicationController

  def index
    @user = current_user
    @myevents = Attendance.where(user_id: current_user.id).map { |attendance| attendance.event }
  end
end
