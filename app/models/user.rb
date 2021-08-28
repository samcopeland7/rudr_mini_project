class User < ApplicationRecord
  has_many :invites
  has_many :events, through: :invites

  def as_json_for_event event_id
    invite_for_event = invites.find_by(event_id: event_id)

    as_json(except: [:created_at, :updated_at, :score]).merge({
      "invite_response" => invite_for_event.response,
      "attended_event" => invite_for_event.attended
    })
  end

  def update_user_score
    update(score: user_score)
  end

  def user_score
    invites.count + accepted_invites.count - declined_invites.count -
      (2 * ignored_invites.count) - (3 * non_declined_missed_meetings.count)
  end

  def accepted_invites
    invites.where(response: 'accepted')
  end

  def declined_invites
    invites.where(response: 'declined')
  end

  def ignored_invites
    invites.where(response: 'ignored')
  end

  def non_declined_missed_meetings
    invites.where({ attended: false, response: ['accepted', 'ignored'] })
  end
end
