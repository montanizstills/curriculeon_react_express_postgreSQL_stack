
## Instructions to Replicate this Project

## Part 1 - Creating the Backend Application

### Part 1.1 - Dependency Management & File Infrastructure
* Create project directory
    * `mkdir reactexpress-template`
* Navigate to newly created directory
    * `cd reactexpress-template`
* Open in text editor
    * `code .` (_Visual Studio Code_)
* Create `server.js` file for Express server.
    * `touch server.js`
* Create `package.json` file
    * `npm init`
        * Description - React Express Template
        * Entry Point - `server.js`
* Install Express
    * `npm i express concurrently`
* Install `nodemon`;
    * `npm i nodemon --save-dev`
        * _Runs application and watches for development so that it auto-updates upon change._

### Part 1.2 - Modify the `package.json` file
```json
"scripts" : {
    "start": "node server.js",
    "server": "nodemon server.js"
}
```
* `"start" : "node server.js"` will call `node`, then call the `server.js` _entry point_
* `"server": "nodemon server.js"` will use nodemon to watch for changes.

### Part 1.3 - Modify the `server.js` file

```javascript
const express = require('express');  // import express
const app = express(); // initialize express
const port = 5000; // create port variable to listen on
const funcToRunUponListening = () => console.log(`Server started on port ${port}`);
const funcToRunUponReceivingRequest = (req, res) => {
    const customers = [ // TODO - replace with call to Database
        {"id":1, "firstName":"Ischa","lastName":"Boul"},
        {"id":2, "firstName":"Mark","lastName":"Lauren"},
        {"id":3, "firstName":"Ralph","lastName":""}
    ];    
    res.json(customers);
};

app.get('/api/customers', funcToRunUponReceivingRequest)
app.listen(port, funcToRunUponListening);
```


### Part 1.4 - Running Server and _Hitting_ Endpoint
* _Before running the application, you may want to kill any process occupying port `5000`._
    * In windows, execute the following command
        * `for /f "tokens=5" %a in ('netstat -aon ^| find ":5000" ^| find "LISTENING"') do taskkill /f /pid %a`
    * In OSX / Linux, execute the following command
        * ``kill -kill `lsof -t -i tcp:5000` ``

* To run the application, execute `npm run server`.
* Navigate to `localhost:5000/api/customers` to view the json being returned by the Express server.
* The `JSON` below is indicative of the expected render from the browser.

```JSON
[{"id":1, "firstName":"Ischa","lastName":"Boul"},
 {"id":2, "firstName":"Mark","lastName":"Lauren"},
 {"id":3, "firstName":"Ralph","lastName":"Jacob"}]
```

<hr><hr>
<br><br><br>
<hr><hr>


## Part 2 - Creating the Frontend Application

### Part 2.1 - Install `create-react-app` cli command
* `npm uninstall -g create-react-app`
* `npm install react-scripts --save`

### Part 2.2 - Create React application
* To generate a new React application named `client`, execute the following cli command 
    * `create-react-app client`
    * `cd client`
    * `npm i -g create-react-app` will fix [this issue](https://stackoverflow.com/questions/47928735/react-scripts-is-not-recognized-as-an-internal-or-external-command).
    * `npm run-script build`
* _there is a potential for this to fail on Windows OS. Please see the section below._
    1. if the cli command `create-react-app client` fails, try the following 
        * `npx create-react-app my-app`
    2. if the cli command `npx create-react-app my-app` fails, try the following 
        * `npm init react-app my-app`
    3. if suggestions `1` and `2` both fail, please visit the link [here](https://github.com/facebook/create-react-app/issues/6512).


### Part 2.3 - Modify `client/package.json` to include `proxy` to backend

```JSON
"scripts" : {
    ...,
},
"proxy": "http://localhost:5000",
```


* `proxy` key allows us to make requests to backend without having to include full URL in fetch request
    * Enables expressions like
        * `fetch('/api/customers')`
        * `fetch('/api/customers/1')`
    * Eliminates redundant uri usage like
        * `fetch('http://localhost:5000/api/customers')`
        * `fetch('http://localhost:5000/api/customers/1')`



### Part 2.4 - Running React Server
* From the root directory of this project execute `npm start ./client`.
* Navigate to `localhost:3000` to view the the ReactJS application.


## Part 3 - Creating Customers components
### Part 3.1 - Creating `components` directory
* Create a `components` directory by executing the command below
    * `mkdir ./components`
* The purpose of this directory is to containerize all _components_ to be created
    * A component is typically a single _web-element_, with its own _style_, and potentially _javascript_.

### Part 3.2 - Creating `customers` directory
* Create a `customers` directory by executing the command below
    * `mkdir ./components/customers`
* The purpose of this directory is to containerize the `customer` webelement implementation.


### Part 3.3 - Creating `customers.js`
* Create `customers.js` by executing the command below
    * `touch client/components/customers/customers.js`
* The purpose of this file is to containerize the _view_ of the `customer` webelement

```javascript
import React, { Component } from 'react';
import './customers.css';

class Customers extends Component {
    constuctor() {
        super();
        this.state = {
            customers:[]
        }
    }    

    componentDidMount() { // runs automatically when component is mounted to the DOM
        fetch('/api/customers') // fetches customers from express server and sets `state`-value to customers that were fetched
            .then(res => res.json())
            .then(customers => this.setState({customers}, () => console.log("Customers fetched...", customers)))
    }

    render() {
        return (
            <div>
                <h2>Customers</h2>
                <ul>{ this.state.customer.map(customer =>
                    <li key={customer.id}>
                        { customer.firstName } {customer.lastName}
                    </li>
                )}</ul>
            </div>
        );
    }
}

export default Customers;
```


### Part 3.4 - Creating `customers.css`
* Create `customers.css` by executing the command below
    * `touch client/components/customers/customers.css`
* The purpose of this file is to containerize the _style_ of the _view_ of the `customer` webelement.





_This application is based on a youtube tutorial which can be found [here](https://www.youtube.com/watch?v=v0t42xBIYIs)._
