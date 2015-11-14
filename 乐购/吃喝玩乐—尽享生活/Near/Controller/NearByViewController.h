//
//  NearByViewController.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/29.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface NearByViewController : BaseViewController <CLLocationManagerDelegate,MKMapViewDelegate>

@end
