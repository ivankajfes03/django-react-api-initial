import React, { Component } from 'react';
import logo from './logo.svg';
import axios from 'axios';
import './App.css';

class App extends Component {
  constructor(props:any) {
    super(props);
    this.state = { data: [] }
    axios.get(`http://localhost:8000/api/todos/`).then(res => {
     this.setState( {data: res.data});
  })}



  render() {
    const list = this.state.data.map((item)=>
        <li key={item.id}>
            {item}
        </li>
    );
    return (
      <div className="App">
            {console.log(this.state.data)}
            {this.state.data.map((item, key)=>{
                return <li key={item.id}>{item.id}</li>
            })}

      </div>
    );
  }
}

export default App;
