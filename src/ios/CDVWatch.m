//
//  CDVWatch.m
//  Tirol
//
//  Created by Bastian Brodbeck on 05/01/15.
//
//

#import "CDVWatch.h"

@implementation CDVWatch

-(void) initialize:(CDVInvokedUrlCommand*)command
{
    NSArray* arguments = [command arguments];
    NSString* groupIdentifier = [arguments objectAtIndex:0];
    NSString* directory = @"wormhole";
    
    if ([arguments count] >= 2) {
         directory = [arguments objectAtIndex:1];
    }
    
    wormhole = [[MMWormhole alloc] initWithApplicationGroupIdentifier:groupIdentifier
                                                    optionalDirectory:directory];
}

-(void) passMessage:(CDVInvokedUrlCommand*)command {

    NSArray* arguments = [command arguments];
    NSString* message = [arguments objectAtIndex:0];
    NSString* channel = @"";
    
    if ([arguments count] >= 2) {
        channel = [arguments objectAtIndex:1];
    }

    [wormhole passMessageObject:message identifier:channel];
}

-(void) listenForMessage:(CDVInvokedUrlCommand*)command {
    NSString* callbackId = [command callbackId];
    NSArray* arguments = [command arguments];
    NSString* channel = [arguments objectAtIndex:0];
    
    CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                                messageAsString:@"ok"];
    [result setKeepCallbackAsBool:YES];
    
    [wormhole listenForMessageWithIdentifier:channel listener:^(id messageObject) {
        CDVPluginResult* result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK
                                    messageAsString:messageObject];
        [result setKeepCallbackAsBool:YES];
        [self.commandDelegate sendPluginResult:result
                                    callbackId:callbackId];
        
    }];
}

@end
