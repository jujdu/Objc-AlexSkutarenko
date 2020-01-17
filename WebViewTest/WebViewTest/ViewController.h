//
//  ViewController.h
//  WebViewTest
//
//  Created by Michael Sidoruk on 17.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@class WKWebView;

@interface ViewController : UIViewController <WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet WKWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardButtonItem;

- (IBAction)actionBack:(id)sender;
- (IBAction)actionForward:(id)sender;
- (IBAction)actionRefresh:(id)sender;

@end

