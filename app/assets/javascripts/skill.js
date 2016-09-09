
//スキルフォーム
var SkillFormButton = React.createClass({
	propTypes: {
	    skill_id: 0
	},
	render: function(){
		this.skill_id = document.getElementById('get_skill_id').value;
		return(
			<div>
			<form action="add_skill" method="post">
			<input type="hidden" name="get_skill_id" value={this.skill_id} />
			<input type="hidden" name="send_type" value="2" />
			<input type="submit" className ="skillpage_add_skill" value="自分のスキルに追加" />
			</form>
			</div>
		);
	}
});
React.render(<SkillFormButton />, document.getElementById("component_skillpage_add_skill"));

