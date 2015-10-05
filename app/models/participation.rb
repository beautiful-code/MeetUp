class Participation < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  after_create :notify_joined
  after_destroy :notify_left

  def notify_joined
    if self.user_id != event.creator.id
      Notification.create(user_id: event.creator.id,
                          event_id: event.id,
                        notification_type: Notification::Type::USER_JOINED_EVENT,
                        notification_status: Notification::Status::UNREAD,
                        member_id: self.user_id)
    end
  end

  def notify_left
    if self.user_id != event.creator.id
      Notification.create(user_id: event.creator.id,
                          event_id: event.id,
                        notification_type: Notification::Type::USER_LEFT_EVENT,
                        notification_status: Notification::Status::UNREAD,
                        member_id: self.user_id)
    end
  end

end
