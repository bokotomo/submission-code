class UsersController < ApplicationController
  
  #変数
  @@myid = 5#自分のID
  
  #プロフィールページ
  def profile
  	#変数宣言
  	@get_user_id = params[:id]
  	@get_my_id = @@myid 
  	@user_data = User.find_by_id(@get_user_id)
  	
  	if @user_data == nil then
		@user_name = "nouser"
	else
		@user_name = @user_data.user_name
	end
	
	
  	#スキルと追加したユーザ一覧上部_6個取得
  	sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN skill_infos as s_i ON c_u.skill_id = s_i.id where c_u.receive_user_id = #{@get_user_id} GROUP BY skill_id ORDER BY num DESC LIMIT 0,6"
  	@user_skill_data_top = SkillCheckUsers.find_by_sql(sql_str)
  	
  	
  	#skillを追加したユーザ一覧_10個取得
  	@skill_user_arr = []
  	@user_skill_data_top.each do |res|
	  	sql_str = "select * from skill_check_users as c_u INNER JOIN users as u_i ON c_u.send_user_id = u_i.id where c_u.receive_user_id = #{@get_user_id} AND c_u.skill_id = #{res.skill_id} LIMIT 0,10"
	  	user_skill_data = User.find_by_sql(sql_str)	
	  	@skill_user_arr.push(user_skill_data)	
	end


  	#スキルユーザ一覧下部_10個取得
  	sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN skill_infos as s_i ON c_u.skill_id = s_i.id where c_u.receive_user_id = #{@get_user_id} GROUP BY skill_id ORDER BY num DESC LIMIT 6,10"
  	@user_skill_data_bottom = SkillCheckUsers.find_by_sql(sql_str)

	
  end




  #編集ページ
  def edit
  	@user_data = User.find_by_id(@@myid)
  	
  	#スキルと追加したユーザ一覧上部_6個取得
  	@sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN skill_infos as s_i ON c_u.skill_id = s_i.id where c_u.receive_user_id = #{@@myid} GROUP BY skill_id ORDER BY num DESC LIMIT 0,6"
  	@user_skill_data_top = SkillCheckUsers.find_by_sql(@sql_str)
  	
  	
	#skillを追加したユーザ一覧_10個取得
  	@skill_user_arr = []
  	@user_skill_data_top.each do |res|
	  	sql_str = "select * from skill_check_users as c_u INNER JOIN users as u_i ON c_u.send_user_id = u_i.id where c_u.receive_user_id = #{@@myid} AND c_u.skill_id = #{res.skill_id} LIMIT 0,10"
	  	user_skill_data = User.find_by_sql(sql_str)	
	  	@skill_user_arr.push(user_skill_data)	
	end
	
  	#スキルユーザ一覧下部_10個取得
  	@sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN skill_infos as s_i ON c_u.skill_id = s_i.id where c_u.receive_user_id = #{@@myid} GROUP BY skill_id ORDER BY num DESC LIMIT 6,10"
  	@user_skill_data_bottom = SkillCheckUsers.find_by_sql(@sql_str)
	

  	#おすすめのスキル
  	@sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN skill_infos as s_i ON c_u.skill_id = s_i.id where c_u.receive_user_id != #{@@myid} GROUP BY skill_id ORDER BY num DESC LIMIT 0,15"
  	@user_skill_data_recommend = SkillCheckUsers.find_by_sql(@sql_str)

	
	
  end
  
  
  
  #スキルページ
  def skill
  	@get_skill_id = params[:id]
  	
  	#スキルと追加したユーザ一覧
  	@skill_info = SkillInfo.find_by_id(@get_skill_id)
  	
	
  	#スキルを持つユーザ
  	@sql_str = "select *,COUNT(*) AS num from skill_check_users as c_u INNER JOIN users as u_i ON c_u.receive_user_id = u_i.id where c_u.skill_id = #{@get_skill_id} GROUP BY c_u.receive_user_id ORDER BY num DESC"
  	@user_skills= SkillCheckUsers.find_by_sql(@sql_str)
  	
  end




  #スキル追加 
  def add_skill
	  
	#変数
	send_skill_id = 1
	type = params[:send_type]

	 if type == "1" then
		#プロフィールページへ
		 
		 if SkillInfo.exists?(skill_name: params[:get_skill_name]) then
			#すでに同じ名前のスキルがあった場合
			
			#スキルIDの検索
			user_skill_data = SkillInfo.find_by_sql("select * from skill_infos where skill_name = '#{params[:get_skill_name]}'")
			user_skill_data.each do |res|
		  		send_skill_id = res.id
			end
			
			
			 #このアカウントですでにユーザに追加していなければ追加
			 if SkillCheckUsers.exists?(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: send_skill_id) == false then
			 	#ユーザのスキルに追加
			 	check_add = SkillCheckUsers.new(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: send_skill_id)
			 	result = check_add.save
			 end
			 
		 	
	      else
		 	#同じ名前のスキルがない場合
		 	
		 	#新規登録
		 	skill_add = SkillInfo.new(skill_name: params[:get_skill_name])
		 	result = skill_add.save
	 	 	
			#スキルIDの検索
			user_skill_data = SkillInfo.find_by_sql("select * from skill_infos where skill_name = '#{params[:get_skill_name]}'")
			user_skill_data.each do |res|
		  		send_skill_id = res.id
			end
		
		 	
		 	#このアカウントですでにユーザに追加していなければ追加
			 if SkillCheckUsers.exists?(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: send_skill_id) == false then
			 	#ユーザのスキルに追加
			 	check_add = SkillCheckUsers.new(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: send_skill_id)
			 	result = check_add.save
			 end
			 
	       end
			
		  #完了
		  redirect_to :action => "profile", :id => params[:get_user_id]
		
	elsif type == "2" then
		#スキルページへ
		 
		 #すでに追加されていたら追加しない
		 if SkillCheckUsers.exists?(send_user_id: @@myid, receive_user_id: @@myid,skill_id: params[:get_skill_id]) == false then
		 	#ユーザのスキルに追加
		 	check_add = SkillCheckUsers.new(send_user_id: @@myid, receive_user_id: @@myid,skill_id: params[:get_skill_id])
		 	result = check_add.save
		 end
		 
		 
		 #完了
		 redirect_to :action => "skill", :id => params[:get_skill_id]
		
	
	else
	
	
		 #すでに追加されていたら追加しない
		 if SkillCheckUsers.exists?(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: params[:get_skill_id]) == false then
		 	#ユーザのスキルに追加
		 	check_add = SkillCheckUsers.new(send_user_id: @@myid, receive_user_id: params[:get_user_id],skill_id: params[:get_skill_id])
		 	result = check_add.save
		 end
		 
		 
		 #完了
		 redirect_to :action => "profile", :id => params[:get_user_id]
	
	end
  end
 
  
end