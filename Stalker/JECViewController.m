//
//  JECViewController.m
//  Stalker
//
//  Created by Joshua Cooper on 2/13/13.
//  Copyright (c) 2013 Joshua Cooper. All rights reserved.
//

#import "JECViewController.h"

@interface JECViewController ()

@end

@implementation JECViewController

JECDataManager *data;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    data = [JECDataManager dataManager];
    self.locationManager = data.locationManager;
    self.locationManager.delegate = self;
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - CLLocationManagerDelegate methods
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = [locations lastObject];
    NSLog(@"lat: %f, lon:%f", location.coordinate.latitude, location.coordinate.longitude);
    [self addPinToMapAtLocation:location];
}


- (void)addPinToMapAtLocation:(CLLocation *)location
{
    MKPointAnnotation *pin = [[MKPointAnnotation alloc] init];
    pin.coordinate = location.coordinate;
    pin.title = @"foo";
    pin.subtitle = @"bar";
    [self.mapView addAnnotation:pin];
    [self.mapView setCenterCoordinate:location.coordinate];
    MKPointAnnotation *annotation;
    double minLat,maxLat,minLong,maxLong;
     for(int i = 0; i < [self.mapView.annotations count]; i++){
        annotation = self.mapView.annotations[i];
        minLat = fmin(minLat, annotation.coordinate.latitude);
        maxLat = fmax(maxLat, annotation.coordinate.latitude);
        minLong = fmin(minLong, annotation.coordinate.longitude);
        maxLong = fmax(maxLong, annotation.coordinate.longitude);
    }
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, fabs(maxLat - minLat + 10) * 1.1, fabs(maxLong - minLong + 10) * 1.1);
    //    region = [self.mapView regionThatFits:region];
    [self.mapView setRegion:region];
}



@end
