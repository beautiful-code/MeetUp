class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  after_commit :test

  def test
    puts [User.find(user.id).email, Event.find(event.id).name, User.find(member_id).email, notification_type].join("|")
  end

  module Status
    READ = "Read"
    UNREAD = "Unread"
  end

  module Type
    USER_JOINED_EVENT = "joined"
    USER_LEFT_EVENT = "left"
  end

  def member_email
    User.find(self.member_id).email
  end

  def event_name
    Event.find(self.event_id).name
  end

end
