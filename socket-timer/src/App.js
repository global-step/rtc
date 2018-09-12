import React, { Component } from 'react';
import './App.css';
import { subscribeToTimer, subscribeToSpaces, subscribeToClasses, emitToSpaces } from './api';
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
    subscribeToClasses(1000, (err, classes) => this.setState({
      classes 
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
    title: 'no title yet',
    timestamp: 'no timestamp yet',
    spaces: 'no data yet',
    classes: [{title: 'fetching data', spaces: 'fetching data'}]
  };
  render() {
    return (
      <div className="App">
        <p className="time">{this.state.timestamp}</p>
        {this.state.classes.map( (item, index) => {
          return <Class key={index} title={item.title} start={item.start} spaces={item.spaces} isDisabled={false} join={false} onClick={this.takeSpace} />
        })}
      </div>
    );
  }
}
export default App;

function Class(props){
  return(
    <div className="class">
      <h3 className="title">{props.title}</h3>
      <p className="start">{props.start}:00</p>
      <p className="spaces">Spaces Left: {props.spaces}</p>
      <button disabled={props.isDisabled} join={props.join} onClick={() => props.onClick() }>Book Class</button>
    </div>
  )
}

// server returns class titles, times and spaces
// after booking space if time is past start time show 'join class' button
// spaces randomly reduce every few seconds