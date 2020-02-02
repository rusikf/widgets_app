var Widget = createReactClass({
  propTypes: {
    name: PropTypes.string,
    description: PropTypes.string,
    signedIn: PropTypes.bool
  },

  render: function(props) {
    return (
      <React.Fragment>
        <div className="col-sm-4">
          <div className="card border-primary mb-3">
            <WidgetHeader name={this.props.name} id={this.props.id} signedIn={this.props.signedIn} userId={this.props.user_id}/>
            <div className="card-body">
              <p className="card-text">{this.props.description}</p>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
})
