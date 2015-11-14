//
//  NearViewController.h
//  吃喝玩乐—尽享生活
//
//  Created by mac on 15/10/12.
//  Copyright (c) 2015年 mac. All rights reserved.
//

#import "BaseViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "NearByViewController.h"

@interface NearViewController : BaseViewController <CLLocationManagerDelegate> {
    
    CLLocationManager *_locationManager;
}

@end
