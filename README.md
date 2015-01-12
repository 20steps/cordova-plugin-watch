# cordova-plugin-watch
Cordova plugin to communicate with apple watch (watchkit) from javascript via MMWormhole by mutualmobile

## Intro
This plugin is a wrapper for *MMWormhole* by mutualmobile to communicate with an apple watch directly from JavaScript via *App Groups*

### Supported platforms
* iOS

### Installation
```
cordova plugin add https://github.com/20steps/cordova-plugin-watch
```

### Configuration
In Xcode you need to set the development team for your app target and WatchKit Extention target - for this you need a payed iOS dev account). Then add for both tagetes yourt desired *App Group* under your target *Capabilities*.

### Usage in JavaScript
#### Initialize
```
window.cordova.plugins.Watch.initialize('group.com.whatever', 'myIdentifier');
```
#### Send message
```
window.cordova.plugins.Watch.sendMessage('my message text', 'myChannel');
```

#### Receive message
```
window.cordova.plugins.Watch.listen('myOtherChannel', function(message) {
  // my callback function
});
```

### Usage in Objective-C
#### Initialize
```
wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.whatever" optionalDirectory:@"myIdentifier"];

```
#### Send message
```
[wormhole passMessageObject:@"my message text" identifier:@"myChannel"];
```

#### Receive message
```
[wormhole listenForMessageWithIdentifier:@"myOtherChannel" listener:^(id message) {
  // my callback function 
}];

```

also see http://github.com/mutualmobile/MMWormhole

### Example App
Find an example app here: http://github.com/20steps/cordova-plugin-watch-example
the exampel is a simple cordova app based upon ionic framework that commuincates with a apple watch (watchkit) app

### Resources 
* MMWormhole: http://github.com/mutualmobile/MMWormhole
* Cordova: http://cordova.apache.org/
* Ionic Framework: http://ionicframework.com/docs/guide/starting.html
