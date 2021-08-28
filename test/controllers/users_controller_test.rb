require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @params = { password: "easily_guessed_password" }
  end

  test "not providing the password results in 403" do
    event = events(:seeds)
    get users_url, params: { event_id: event.id }
    assert @response.status == 403
  end

  test "the index provides a list of users for an event" do
    event = events(:seeds)
    users = event.users
    get users_url, params: @params.merge(event_id: event.id)
    assert users.size == JSON.parse(@response.body).size
  end

  test "the index includes invite response and attendance for users" do
    event = events(:mixer)
    get users_url, params: @params.merge(event_id: event.id)
    fields = JSON.parse(@response.body).first.keys
    assert fields.include?("invite_response") && fields.include?("attended_event")
  end

  test "the show route displays the score for a user" do
    user = users(:jeff)
    get "/users/#{user.id}", params: @params
    assert user.score == JSON.parse(@response.body)["score"]
  end
end
