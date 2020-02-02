var WidgetHeaderButtons = createReactClass({
  render: function(props) {
    if (!this.props.signedIn) {
      return null
    }

    return (
      <React.Fragment>
        <a data-confirm="Are you sure?" rel="nofollow" data-method="delete" href={`/widgets/${this.props.id}`}>
          <i class="fa fa-trash pull-right"></i>
        </a>
        <a href={`/widgets/${this.props.id}/edit`}>
          <i class="fa fa-edit pull-right"></i>
        </a>
      </React.Fragment>
    );
  }
})


var WidgetHeader = createReactClass({
  render: function(props) {
    let link = `/users/${this.props.userId}`
    let title = (this.props.userId) ? <a href={link}>{this.props.name}</a> : this.props.name
    return (
      <React.Fragment>
        <div className="card-header">
          {title}

          <WidgetHeaderButtons signedIn={this.props.signedIn} id={this.props.id} />
        </div>
      </React.Fragment>
    );
  }
})
