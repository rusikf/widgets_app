
var Widgets = createReactClass({
  propTypes: {
    items: PropTypes.array,
    signedIn: PropTypes.bool
  },

  render: function(props) {
    return (
      <React.Fragment>
        <div className="row">
          {
            this.props.items.map((item) => {
              return <Widget name={item.name} description={item.description} key={item.id} signedIn={item.signedIn}/>
            })
          }
        </div>
      </React.Fragment>
    );
  }
});
