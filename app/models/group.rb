class Group < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "user_id"

  has_many :membership_relations, class_name: "Membership", 
    foreign_key: "group_id",
    dependent: :destroy

  has_many :members, through: :membership_relations, source: :user, foreign_key: "member_id"

  after_commit :add_owner_to_the_group

  def add_owner_to_the_group
    self.owner.join self
  end
end
