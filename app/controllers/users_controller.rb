class UsersController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    render json:(
      event.users
    )
  end

  def show
    user = User.find(params[:user_id])
    render json: user
  end
end