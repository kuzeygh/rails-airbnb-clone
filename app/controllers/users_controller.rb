class UsersController < ApplicationController

  def dashboard
    @user = User.find(params[:user_id])
    @myevents = Attendance.where(user_id: @user.id).map { |attendance| attendance.event }
  end
end
