var Counter = React.createClass({

  getInitialState() {
    return {
      count: 0
    };
  },
  onClick(e) {
    // e is SyntheticEvent
    alert();
  },
  render() {
    return (
      <div>
        <span>click count is {this.state.count}</span>
        <button onClick={this.onClick}>click{this.onClick}!</button>
      </div>
    );

  }});

// id='app'に<HelloWorld />を埋め込む（マウント）
var m = React.render(<Counter />, document.getElementById('top'));