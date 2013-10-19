//
//  AnnouncementView.h
//  Troy High
//
//  Created by Kyle Minshall on 2/27/13.
//
//

#import <UIKit/UIKit.h>

@class FirstViewController;

@interface AnnouncementView : UIViewController
{
    //IBOutlet UIWebView *_webView;  //Reference and initialization for the WebView used to show the RSS Results
    FirstViewController *_entry; //Just a call to the FirstViewController
    NSString *request;//This is what will be requesting the link for the application to show
    IBOutlet UIActivityIndicatorView *active; //Activity Indicator
    
}

@property IBOutlet UIWebView *webView;
@property FirstViewController *entry;
@property NSString *request;
@property UIActivityIndicatorView *active;
@property (nonatomic, strong) NSString *mime;

@end
