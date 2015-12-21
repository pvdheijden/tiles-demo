var React = require('react');
var ReactDOM = require('react-dom');

var Tile = React.createClass({displayName: 'Tile',
    render: function() {
        return (
            <img className='tile' src={this.props.src} />
        );
    }
});

ReactDOM.render(
    <div>
        <Tile src='../assets/ninja.png'/>
        <Tile src='../assets/geisha.jpg'/>
        <Tile src='../assets/samourai.jpg'/>
    </div>,
    document.getElementById('index')
);