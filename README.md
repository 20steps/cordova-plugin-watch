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
In Xcode you need to set the development team for your app target and WatchKit Extention target - for this you need a payed iOS dev account). Then add for both targets your desired *App Group* under your target *Capabilities*.

### Usage in JavaScript
#### Initialize
We send messages over certain channels. These cannels are like events in JavaScript.
```
window.cordova.plugins.Watch.initialize('group.com.whatever', 'myIdentifier');
```
#### Send message
We send messages over certain channels. These cannels are like events in JavaScript.
```
window.cordova.plugins.Watch.sendMessage('my message text', 'myChannel');
```

#### Receive message
We listen for messages on a certain channel.
```
window.cordova.plugins.Watch.listen('myOtherChannel', function(message) {
  // my callback function
});
```

### Usage in Objective-C

For the watch to be able to read the messages send by cordova you need to add MMWormhole to your WatchKit Extension in Xcode.

#### Initialize
We initialize MMWormhole with the *App Group* and an Identifier within this group, in case multiple Apps use the same *App Group*.
```
wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:@"group.com.whatever" optionalDirectory:@"myIdentifier"];

```
#### Send message
We send messages over certain channels. These cannels are like events in JavaScript.
```
[wormhole passMessageObject:@"my message text" identifier:@"myChannel"];
```

#### Receive message
We listen for messages on a certain channel.
```
[wormhole listenForMessageWithIdentifier:@"myOtherChannel" listener:^(id message) {
  // my callback function 
}];

```

also see http://github.com/mutualmobile/MMWormhole

### Example App
You can find an example app here: http://github.com/20steps/cordova-plugin-watch-example
The example is a simple cordova app -- using the ionic framework -- that commuincates with an apple watch (watchkit) app

### Resources 
* MMWormhole: http://github.com/mutualmobile/MMWormhole
* Cordova: http://cordova.apache.org/
* Ionic Framework: http://ionicframework.com/docs/guide/starting.html
