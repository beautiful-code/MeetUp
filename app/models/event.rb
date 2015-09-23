class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :participation_relationship, class_name: "Participation", 
    foreign_key: 'event_id', dependent: :destroy
  has_many :participants, through: :participation_relationship, source: :user, foreign_key: 'user_id'
  after_commit :add_participant_to_the_event

  def add_participant_to_the_event
    self.creator.join_event self
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
