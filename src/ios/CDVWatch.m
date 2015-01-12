/*
Copyright 2015 20steps - Digital Full Service Boutique

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

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
