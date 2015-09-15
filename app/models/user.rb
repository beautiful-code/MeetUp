class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :membership_relations, class_name: "Membership",
    foreign_key: "member_id",
    dependent: :destroy

  has_many :ownership_groups, class_name: "Group", 
    foreign_key: "user_id", dependent: :destroy

  has_many :membership_groups, through: :membership_relations, source: :group

  def member_of?(group)
    membership_relations.find_by(group_id: group.id)
  end

  def join(group)
    membership_relations.create(group_id: group.id)
  end

  def leave(group)
    membership_relations.find_by(group_id: group.id).destroy
  end

end
