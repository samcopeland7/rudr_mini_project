class Invite < ApplicationRecord
  after_commit :update_associated_user_score

  belongs_to :user
  belongs_to :event

  def update_associated_user_score
    user.update_user_score
  end
end
