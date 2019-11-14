/**
 * @format
 */

import {AppRegistry} from 'react-native';
import App from './App';
import {name as appName} from './app.json';
import JJApp1 from './JJApp1';
import JJApp2 from './JJApp2';

// AppRegistry.registerComponent(appName, () => App);

AppRegistry.registerComponent("App", ()=> App);
AppRegistry.registerComponent("JJApp1", ()=> JJApp1);
AppRegistry.registerComponent("JJApp2", ()=> JJApp2);
