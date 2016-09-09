class CreateSkillCheckUsers < ActiveRecord::Migration
  def change
    create_table :skill_check_users do |t|
      t.integer :receive_user_id
      t.integer :send_user_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
