import React, { Component } from 'react';
import './App.css';
import { subscribeToTimer, subscribeToSpaces, emitToSpaces } from './api';
// Server emits time and spaces
// App subscribes to time and spaces
// Clicking 'book class' emits to server - takes one space
// Server responds with remaining spaces
// if spaces < 1 disable button
class App extends Component {
  constructor(props) {
    super(props);
    subscribeToTimer(1000, (err, timestamp) => this.setState({
      timestamp 
    }));
    subscribeToSpaces(1000, (err, spaces) => this.setState({
      spaces 
    }));
  }
  takeSpace(){
    emitToSpaces();
  }
  isDisabled(){
    if(this.state.spaces < 1){
      return true;
    }
  }
  state = {
    timestamp: 'no timestamp yet',
    spaces: 'no data yet'
  };
  render() {
    return (
      <div className="App">
        <p className="time">{this.state.timestamp}</p>
        <p className="spaces">Spaces Left: {this.state.spaces}</p>
        <button disabled={this.isDisabled()} onClick={this.takeSpace}>Book Class</button>
      </div>
    );
  }
}

export default App;