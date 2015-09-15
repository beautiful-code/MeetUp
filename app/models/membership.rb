class Membership < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "member_id"
  belongs_to :group, class_name: "Group"
end
