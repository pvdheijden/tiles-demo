var React = require('react');
var ReactDOM = require('react-dom');

var $ = require('../lib/jquery/jquery.js');

var Tile = React.createClass({
    displayName: 'Tile',

    handleMouseOver: function(event) {
        this.props.setSelectedSrc(this.props.src);
    },

    render: function() {
        return (
            <div className='tile' onMouseOver={this.handleMouseOver} >
                <img src={this.props.src} />
            </div>
        );
    }
});

var Picture = React.createClass({
    displayName: 'Picture',

    render: function() {
        return (
            <div className="Picture">
                <img src={this.props.src} />
            </div>
        )
    }
});

var TileList = React.createClass({
    displayName: 'TileList',

    getInitialState: function() {
        return {
            srcList: []
        }
    },

    componentDidMount: function() {
        $.ajax({
            url: '/image-sources.json',
            dataType: 'json',
            cache: false,
            success: function(data) {
                console.log('image-sources', data);
                this.setState({
                    srcList: data
                });
            }.bind(this),
            error: function() {
                console.log('could not get image-sources');
                this.setState(this.getInitialState());
            }.bind(this)
        });
    },

    render: function() {
        var tileList = [];
        this.state.srcList.forEach(function(src, idx) {
            tileList.push(<Tile key={idx} src={src} setSelectedSrc={this.setSelectedSrc}/>)
        }.bind(this));

        return this.state.selectedSrc ? (
            <div>
                <Picture src={this.state.selectedSrc}/>
                <div className="tile-list">
                    {tileList}
                </div>
            </div>
        ) : (
            <div className="tile-list">
                {tileList}
            </div>
        )
    },

    setSelectedSrc: function(src) {
        this.setState({
            selectedSrc: src
        });
    }

});

ReactDOM.render(
    <TileList />, document.getElementById('index')
);