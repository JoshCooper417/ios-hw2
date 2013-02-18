//
//  JECDataManager.m
//  Stalker
//
//  Created by Joshua Cooper on 2/17/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECDataManager.h"

@implementation JECDataManager

static JECDataManager *dataManager;

+ (JECDataManager *)dataManager
{
    
    
        if (!dataManager){
            dataManager = [[JECDataManager alloc] init];
            self.dataManager.locationManager = [[CLLocationManager alloc] init];
            
        }
        
        return dataManager;

}


@end
