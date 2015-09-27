class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]


  has_many :membership_relations, class_name: "Membership",
    foreign_key: "member_id",
    dependent: :destroy

  has_many :participation_relationship, class_name: "Participation", 
    foreign_key: 'user_id', dependent: :destroy

  has_many :myevents, through: :participation_relationship, source: :event, foreign_key: "event_id"

  has_many :owned_groups, class_name: "Group", 
    foreign_key: "user_id", dependent: :destroy

  has_many :mygroups, through: :membership_relations, source: :group

  has_many :owned_events, class_name: "Event", 
    foreign_key: "user_id", dependent: :destroy

  def member_of?(group)
    membership_relations.find_by(group_id: group.id)
  end

  def join_group(group)
    membership_relations.create(group_id: group.id)
  end

  def leave_group(group)
    membership_relations.find_by(group_id: group.id).destroy
  end

  def participant_of?(event)
    participation_relationship.find_by(event_id: event.id)
  end

  def join_event(event)
    participation_relationship.create(event_id: event.id)
  end

  def leave_event(event)
    participation_relationship.find_by(event_id: event.id).destroy
  end

  def self.from_omniauth (auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendsly_token[0,20]
    end
  end
end
