class SkillCheckUsers < ActiveRecord::Base
  attr_accessible :receive_user_id, :send_user_id, :skill_id
end
