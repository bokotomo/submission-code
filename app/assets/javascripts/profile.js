//スキルを推薦ボタン
var ProfileAddSkillButton = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(){
		document.getElementsByClassName("left_contents_header_add_input")[0].style.display = "block";
		document.getElementById("component_profile_add_skill").style.display = "none";
	},
	render: function(){
		return(
			<div className="left_contents_header_add" onClick={this.handleClick}><i className="fa fa-plus-circle"></i> スキルを推薦する</div>
		);
	}
});
React.render(<ProfileAddSkillButton />, document.getElementById("component_profile_add_skill"));


//スキルをキャンセルボタン
var ProfileSkillCancelButton = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(){
		document.getElementsByClassName("left_contents_header_add_input")[0].style.display = "none";
		document.getElementById("component_profile_add_skill").style.display = "block";
	},
	render: function(){
		return(
			<div id="left_contents_header_skill_cancel" onClick={this.handleClick}>キャンセル</div>
		);
	}
});

//スキルを登録ボタン
var ProfileSkillRegisterButton = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(){
		document.getElementsByClassName("left_contents_header_add_input")[0].style.display = "none";
		document.getElementById("component_profile_add_skill").style.display = "block";
	},
	render: function(){
		return(
			<input type="submit" id="left_contents_header_skill_register" onClick={this.handleClick} value="登録する" />
		);
	}
});

//スキルを登録ボタン
var ProfileSkillInputButton = React.createClass({
	getInitialState: function(){
		return {textValue: ""};
	},
	changeText: function(e){
		this.setState({textValue: e.target.value});
	},
	render: function(){
		return(
			<input type="text" placeholder="スキルを入力..." name="get_skill_name" id="left_contents_header_skill_input" value={this.state.textValue} onChange={this.changeText} />
		);
	}
});

//スキルフォーム
var ProfileSkillFormButton = React.createClass({
	propTypes: {
	    user_id: 0
	},
	render: function(){
		this.user_id = document.getElementById('get_user_id').value;
		return(
			<div>
			<form action="add_skill" method="post">
			<input type="hidden" name="get_user_id" value={this.user_id} />
			<input type="hidden" name="send_type" value="1" />
			<ProfileSkillInputButton />
			<ProfileSkillRegisterButton />
			<ProfileSkillCancelButton />
			</form>
			</div>
		);
	}
});
React.render(<ProfileSkillFormButton />, document.getElementById("component_profile_add_skill_form"));


//スキル追加ボタンの処理
function add_skill_button(skill_id){
	document.getElementById('get_skill_id').value = skill_id;
	document.getElementById('add_skill_plus_submit').submit();
}