class UsersController < ApplicationController
  def index
    event = Event.find(params[:event_id])
    render json:(
      event.users.map do |user|
        user.as_json_for_event(params[:event_id])
      end
    )
  end

  def show
    user = User.find(params[:user_id])
    render json: user.as_json(except: [:created_at, :updated_at])
  end
end
