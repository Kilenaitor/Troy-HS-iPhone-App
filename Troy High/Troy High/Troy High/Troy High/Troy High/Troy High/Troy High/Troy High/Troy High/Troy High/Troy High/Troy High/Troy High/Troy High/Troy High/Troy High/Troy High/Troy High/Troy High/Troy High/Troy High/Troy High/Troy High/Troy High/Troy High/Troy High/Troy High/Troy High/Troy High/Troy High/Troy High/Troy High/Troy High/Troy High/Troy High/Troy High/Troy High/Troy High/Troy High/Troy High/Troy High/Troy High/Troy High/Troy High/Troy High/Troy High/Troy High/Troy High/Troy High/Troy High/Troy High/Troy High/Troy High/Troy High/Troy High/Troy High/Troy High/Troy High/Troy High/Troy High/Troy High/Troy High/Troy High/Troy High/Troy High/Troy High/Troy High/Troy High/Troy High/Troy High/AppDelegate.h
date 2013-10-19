//
//  AppDelegate.h
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    IBOutlet UITabBarController *rootController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *rootController;


@end
