//
//  JECAppDelegate.m
//  Stalker
//
//  Created by Joshua Cooper on 2/13/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECAppDelegate.h"
#import "JECViewController.h"

@implementation JECAppDelegate
JECDataManager *data;
CLLocationManager *locationManager;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    data = [JECDataManager dataManager];
    locationManager = data.locationManager;
    [locationManager stopMonitoringSignificantLocationChanges];
    
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    data = [JECDataManager dataManager];
    locationManager = data.locationManager;
    if(([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized)){
    [locationManager startMonitoringSignificantLocationChanges];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [locationManager setDistanceFilter: 1000];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Announcement"
                              message: @"You should enable location settings; go to your references and do that please!"
                              delegate: nil
                              cancelButtonTitle:@"OK; I'll go and do that now, I promise!"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
