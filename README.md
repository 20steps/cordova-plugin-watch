# cordova-plugin-watch
cordova plugin to communicate with apple watch (watchkit) from javascript via MMWormhole by mutualmobile

## intro
this plugin is a wrapper for *MMWormhole* by mutualmobile to communicate with an apple watch directly from JavaScript via *App Groups*

### installation
```
cordova plugin add https://github.com/20steps/cordova-plugin-watch
```

### usage in JavaScript
#### initialize
```
window.cordova.plugins.Watch.initialize('group.com.whatever', 'myIdentifier');
```
#### send message
```
window.cordova.plugins.Watch.sendMessage('my message text', 'myChannel');
```

#### receive message
```
window.cordova.plugins.Watch.listen('myOtherChannel', function(message) {
  // my callback function
});
```

### example app
find an example app here: http://github.com/20steps/cordova-plugin-watch-example
the exampel is a simple cordova app based upon ionic framework that commuincates with a apple watch (watchkit) app

### Resources 
* MMWormhole: http://github.com/mutualmobile/MMWormhole
* Cordova: http://cordova.apache.org/
* Ionic Framework: http://ionicframework.com/docs/guide/starting.html
