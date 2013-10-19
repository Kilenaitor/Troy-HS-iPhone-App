//
//  RSSEntry.h
//  Troy High
//
//  Created by Kyle Minshall on 3/4/13.
//
//


#import <Foundation/Foundation.h>

@interface RSSEntry : NSObject {
    NSString *_blogTitle;
    NSString *_articleTitle;
    NSString *_articleUrl;
    NSDate *_articleDate;
}

@property NSString *blogTitle;
@property NSString *articleTitle;
@property NSString *articleUrl;
@property NSDate *articleDate;

- (id)initWithBlogTitle:(NSString*)blogTitle articleTitle:(NSString*)articleTitle articleUrl:(NSString*)articleUrl articleDate:(NSDate*)articleDate;

@end