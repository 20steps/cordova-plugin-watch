//
//  CDVWatch.h
//  Tirol
//
//  Created by Bastian Brodbeck on 05/01/15.
//
//

#import <Cordova/CDVPlugin.h>
#import "MMWormhole.h"

@interface CDVWatch : CDVPlugin {
    MMWormhole* wormhole;
}

-(void)initialize:(CDVInvokedUrlCommand*)command;
-(void)passMessage:(CDVInvokedUrlCommand*)command;
-(void)listenForMessage:(CDVInvokedUrlCommand*)command;

@end
