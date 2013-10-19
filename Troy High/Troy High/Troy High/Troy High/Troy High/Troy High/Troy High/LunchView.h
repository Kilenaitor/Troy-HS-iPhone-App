//
//  LunchView.h
//  Troy High
//
//  Created by Kyle Minshall on 3/13/13.
//
//

#import <UIKit/UIKit.h>

@interface LunchView : UIViewController
{
    IBOutlet UIActivityIndicatorView *indicator;
}

@property IBOutlet UIWebView *webView;
@property UIActivityIndicatorView *indicator;

@end
