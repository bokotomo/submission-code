class CreateSkillInfos < ActiveRecord::Migration
  def change
    create_table :skill_infos do |t|
    	t.string :skill_name
      t.timestamps
    end
  end
end
