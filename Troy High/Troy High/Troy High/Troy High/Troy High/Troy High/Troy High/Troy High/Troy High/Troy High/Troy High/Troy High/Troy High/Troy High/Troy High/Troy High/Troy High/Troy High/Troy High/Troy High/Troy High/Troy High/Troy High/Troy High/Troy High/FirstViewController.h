//
//  FirstViewController.h
//  Troy High
//
//  Created by Kyle Minshall on 11/5/12.
//
//  Consulted tutorial by Jason Terhost from www.gigaom.com "How to build an RSS reader for iPhone"

#import <UIKit/UIKit.h>

@class AnnouncementView;

@interface FirstViewController : UITableViewController
{
    IBOutlet UITableView *myNews;
    
    IBOutlet UIView *aView;
    
    IBOutlet UIActivityIndicatorView *activityIndicator;

//    CGSize cellSize;
    
    NSXMLParser * rssParser;
    
    NSMutableArray * stories;
    
    // a temporary item; added to the "stories" array one at a time, and cleared for the next one
	NSMutableDictionary * item;
    
    // it parses through the document, from top to bottom...
	// we collect and cache each sub-element value, and then save each item to our array.
	// we use these to track each current item, until it's ready to be added to the "stories" array
	NSString * currentElement;
    
	NSMutableString * currentTitle, * currentDate, * currentSummary, * currentLink;
    
    NSString *_articleUrl;
    
    AnnouncementView *_AnnouncementView;
    
}

@property NSString *articleUrl;
@property AnnouncementView *AnnouncementView;
@property NSString *storyLink;

@end
