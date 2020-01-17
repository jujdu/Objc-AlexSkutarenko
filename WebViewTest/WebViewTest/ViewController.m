//
//  ViewController.m
//  WebViewTest
//
//  Created by Michael Sidoruk on 17.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView.navigationDelegate = self;
    // Do any additional setup after loading the view.
    
//    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"pdf" ofType:@"pdf"];
//
////    NSData * fileData = [NSData dataWithContentsOfFile:filePath];
////
////    [self.webView loadData:fileData MIMEType:@"application/pdf"
////     characterEncodingName:@"UTF-8"
////                   baseURL:[NSURL URLWithString:@""]];
//
//    NSURL *fileUrl = [NSURL fileURLWithPath:filePath];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
//
//    [self.webView loadRequest:request];
    
    NSString *htmlString = @"<html>"
                                "<body>"
                                    "<p style=\"font-size: 500%; text-align: center;\">Hello World!</p>"
                                    "<a href=\"https://google.com\">hoogle</a>"
                                    "<a href=\"cmd:show_alert\">hoogle</a>"
                                "</body>"
                            "</html>";

    [self.webView loadHTMLString:htmlString baseURL:nil];
     
//    NSString *urlString = @"https://google.com";
//
//    NSURL *url = [NSURL URLWithString:urlString];
//    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//
//    [self.webView loadRequest:urlRequest];
    
//    WKWebView *webView = [WKWebView alloc]initWithFrame:<#(CGRect)#> configuration:<#(nonnull WKWebViewConfiguration *)#>];
    
}

#pragma mark - WKNavigationDelegate

- (void)refreshButtons {
    [self.activityIndicator stopAnimating];
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    if (navigationAction.navigationType == UIWebViewNavigationTypeLinkClicked) {

    }
    NSString *url = [navigationAction.request.URL absoluteString];
    NSLog(@"decidePolicyForNavigationAction %@, %@", [navigationAction.request debugDescription] , url);
    
    if ([url hasPrefix:@"cmd:"]) {
        NSString *command = [url substringFromIndex:4];
        if ([command isEqualToString:@"show_alert"]) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Hi" message:@"this is awesome" preferredStyle:UIAlertControllerStyleAlert];
            [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
            [self presentViewController:alert animated:YES completion:nil];
        }
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation {
    NSLog(@"didStartProvisionalNavigation");
//    [UIApplication.sharedApplication.isNetworkActivityIndicatorVisible] /depricated
    [self.activityIndicator startAnimating];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {    NSLog(@"didFinishNavigation");
    [self refreshButtons];
}
- (void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"didFailNavigation %@", [error localizedDescription]);
    [self refreshButtons];
}

- (IBAction)actionBack:(id)sender {
    if ([self.webView canGoBack]) {
        [self.webView stopLoading];
        [self.webView goBack];
    }
}

- (IBAction)actionForward:(id)sender {
    if ([self.webView canGoForward]) {
        [self.webView stopLoading];
        [self.webView goForward];
    }
}

- (IBAction)actionRefresh:(id)sender {
    [self.webView stopLoading];
    [self.webView reload];
}
@end
