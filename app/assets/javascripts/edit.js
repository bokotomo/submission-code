//コンポーネント

var EditSkilsButton = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(){
		show_edit_area();
	},
	render: function(){
		return(
			<div className="left_contents_header_edit" onClick={this.handleClick}><i className="fa fa-pencil" aria-hidden="true"></i> 編集する</div>
		);
	}
});

//編集ボタン
renderClassElement(<EditSkilsButton />,document.getElementsByClassName("skils_edit_button"));




//キャンセルボタン
var EditSkilsButtonCancel = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick2: function(){
		hide_edit_area();
	},
	render: function(){
		return(
			<div className="cancel_button float_right margin_right_10" onClick={this.handleClick2}>キャンセル</div>
		);
	}
});
React.render(<EditSkilsButtonCancel />, document.getElementById("component_edit_skils_cancel"));


//更新ボタン
var EditSkilsButtonCancel = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick2: function(){
		hide_edit_area();
	},
	render: function(){
		return(
			<div className="edit_end_button float_right" onClick={this.handleClick2}>更新</div>
		);
	}
});
React.render(<EditSkilsButtonCancel />, document.getElementById("component_edit_skils_ok"));




//新しいスキルを入力して確定キーボタン
var EditSkilsInputButton = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(e){
		if(e.keyCode == 13){
			//確定キーなら
			

			document.getElementById("edit_skils_top_tag_add").value = ""
		}
		
	},
	render: function(){
		return(
			<div>
			<input type="text" id="edit_skils_top_tag_add" onKeyDown={this.handleClick} placeholder="新しいスキルを入力して確定キー" />
			</div>
		);
	}
});
React.render(<EditSkilsInputButton />, document.getElementById("component_edit_skils_input"));



//スキルタグ一覧
var EditSkilsAllTags = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	render: function(){
		return(
		<div></div>
		);
	}
});
React.render(<EditSkilsAllTags />, document.getElementById("component_skills_area"));




//スキル編集エリア
var Main = React.createClass({
	getInitialState: function(){
		return {counter: 0};
	},
	handleClick: function(){
		alert();
	},
	render: function(){
		return(
			<div className="skils_edit_area"></div>
		);
	}
});

//編集ボタン
React.render(<Main />, document.getElementById("edit_skils_area"));



//編集エリア表示
function show_edit_area(){	
	document.getElementsByClassName("left_contents_skils_toplist")[0].style.display = "none";
	document.getElementsByClassName("left_contents_skils_underlist")[0].style.display = "none";
	document.getElementsByClassName("skils_edit_button")[0].style.display = "none";
	document.getElementById("component_edit_skils").style.display = "block";
	window.scrollTo( 0, document.getElementById("component_edit_skils").scrollHeight);
}
//編集エリア非表示
function hide_edit_area(){
	document.getElementsByClassName("left_contents_skils_toplist")[0].style.display = "block";
	document.getElementsByClassName("left_contents_skils_underlist")[0].style.display = "block";
	document.getElementsByClassName("skils_edit_button")[0].style.display = "block";
	document.getElementById("component_edit_skils").style.display = "none";
}


//クラス全てrenderする関数
function renderClassElement(toRender, elements) {
  for (var i = 0; i < elements.length; i++) {
    React.render(toRender, elements[i]);
  }
}