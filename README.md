# React & Express Starter Pack Creation
* **Purpose** - To create a reusble template for creating new React & Express applications.
* **Description** - This application is used to demonstrate an elegant way of connecting a front end React application to a backend Express server

## Prerequisite software
### Node JS
* Install [Node.Js](https://nodejs.org/en/)
* Execute the commands below to quickly install `node.js_v12.16.1-x64`
```batch
curl -o "%cd%\node-v12.16.1-x64.msi" "https://nodejs.org/dist/v12.16.1/node-v12.16.1-x64.msi"
start node-v12.16.1-x64.msi
```

## How to use
* To use this project as template, _clone_ the project into your `~/dev` directory,  
* Upon cloning reconfigure the remote by
    1. delete the `.git` folder associated with project.
    2. `git init` to create a new `.git` folder
    3. point the new `.git` folder to your new remote via `git remote set-url`.
* After reconfiguring remote, open the project in a text editor (VSCode, IntelliJ, SublimeText, Atom, etc.)
* Click view the [`README-sample.md`](./README-sample.md) to view _how_ a `README` should be structured for a project.