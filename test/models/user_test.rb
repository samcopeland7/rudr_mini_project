require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user can see all events they have been invited to" do
    user = users(:sam)
    assert user.events.count == 4
  end

  test "a user has a score based on their invites and attendance status" do
    previous_score = users(:jeff).score
    event = Event.create(description: "Board Meeting", time: Time.now)
    Invite.create(user: users(:jeff), event: event, response: 'accepted', attended: true)
    assert users(:jeff).score == previous_score + 2
  end

  test "a user's score is updated if an existing update status is changed" do
    previous_score = users(:absent).score
    event = events(:happy_hour)
    users(:absent).invites.find_by(event: event).update(response: 'declined')
    assert users(:absent).score == previous_score + 1
  end
end
