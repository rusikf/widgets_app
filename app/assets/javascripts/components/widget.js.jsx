var Widget = createReactClass({
  propTypes: {
    name: PropTypes.string,
    description: PropTypes.string,
    signedIn: PropTypes.integer
  },

  render: function(props) {
    return (
      <React.Fragment>
        <div className="col-sm-4">
          <div className="card border-primary mb-3">
            <div className="card-header">
              {this.props.name}
            </div>
            <div className="card-body">
              <p className="card-text">{this.props.description}</p>
            </div>
          </div>
        </div>
      </React.Fragment>
    );
  }
})
