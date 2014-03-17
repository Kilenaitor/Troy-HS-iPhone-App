//
//  Principal.h
//  Troy HS
//
//  Created by Kyle Minshall on 3/11/14.
//
//

#import <UIKit/UIKit.h>

@interface Principal : UIViewController
{
    IBOutlet UIActivityIndicatorView *active; //Activity Indicator
    IBOutlet UIWebView *site;
}

//@property (nonatomic,retain) IBOutlet UIWebView *site;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, retain) UITextView *message;

@end
