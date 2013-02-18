//
//  JECDataManager.h
//  Stalker
//
//  Created by Joshua Cooper on 2/17/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>


@interface JECDataManager : NSObject

@property (nonatomic, strong) CLLocationManager *locationManager;
+ (JECDataManager *)dataManager;

@end
