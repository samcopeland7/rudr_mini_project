require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "an event has an associated list of users" do
    event = events(:happy_hour)
    assert event.users.count == 4
  end
end
