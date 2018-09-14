import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import './App.css';
import { subscribeToTimer, subscribeToSpaces, subscribeToClasses, emitToSpaces } from './api';
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
import { faLanguage, faCalculator, faLandmark, faRobot, faRocket, faFrog, faToriiGate } from '@fortawesome/free-solid-svg-icons'
library.add(faCalculator)
library.add(faLanguage)
library.add(faLandmark)
library.add(faFrog)
library.add(faRobot)
library.add(faRocket)
library.add(faToriiGate)
// Server emits time and class titles, times and spaces
// App subscribes to time and classes
// Clicking 'book class' emits to server - takes one space
// Server responds with remaining spaces
// if spaces < 1 disable button
const App = () => (
  <Router>
    <div className="nav">
      <img src="https://cdn.gsacademy.com/online/gsa_logo.png" alt="logo"/>
      <ul>
        <li>
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="/classes">Classes</Link>
        </li>
      </ul>
      <hr />
      <Route exact path="/" component={Home} />
      <Route path="/classes" component={ClassList} />
    </div>
  </Router>
);

const Home = () => (
  <div className="home">
    <h1>Welcome to GSA Online</h1>
    <p>View today's classes:</p>
    <Link to="/classes">Classes</Link>
  </div>
);

class ClassList extends Component {
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
  takeSpace(i){
    emitToSpaces(i);
  }
  state = {
    title: 'no title yet',
    timestamp: 'no timestamp yet',
    spaces: 'no data yet',
    classes: [{title: 'fetching data', spaces: '0', taken: '0'}]
  };
  render() {
    return (
      <div className="App">
        <h1>GSA Online Classes</h1>
        <p className="time">{this.state.timestamp}</p>
        {this.state.classes.map( (item, index) => {
          return <Class key={index} title={item.title} icon={item.icon} start={item.start} spaces={item.spaces} taken={item.taken} isDisabled={item.spaces === item.taken ? true : false} onClick={() => this.takeSpace(index)} />
        })}
      </div>
    );
  }
}

function Class(props){
  return(
    <div className="class">
      <h3 className="title"><FontAwesomeIcon icon={props.icon} />{props.title}</h3>
      <p className="start">{props.start}:00</p>
      <p className="spaces">{props.taken}/{props.spaces}</p>
      <button disabled={props.isDisabled} join={props.join} onClick={props.onClick} >{props.spaces === props.taken ? 'Fully Booked' : 'Reserve'}</button>
      <a className="join" rel="noopener noreferrer" target="_blank" href="https://zoom.us/j/895806108">Join Class</a>
    </div>
  )
}

// after booking space if time is past start time show 'join class' button
// spaces randomly reduce every few seconds

export default App;