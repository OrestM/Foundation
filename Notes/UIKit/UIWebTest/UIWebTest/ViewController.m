//
//  ViewController.m
//  UIWebTest
//
//  Created by Admin on 3/25/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
    NSString *urlGoogleWithString = @"https://www.google.com.ua/";
    NSURL *urlGoogle = [NSURL URLWithString:urlGoogleWithString];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlGoogle];
    [self.webView loadRequest:request];
    self.webView.scalesPageToFit = YES;
    */
    /*
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"1" ofType:@"pdf"];
    NSURL *urlPath = [NSURL fileURLWithPath:filePath];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:urlPath];
    [self.webView loadRequest:request];
    self.webView.scalesPageToFit = YES;
     */
    
    NSString *stringHTML = @"<html>"
                                "<head>"
                                "</head>"
                                    "<body>"
                                        "<h1 style=\"text-align: center; font-size: 50; color: blue;\">Hello World!</h1>"
                                        "<a href=\"https://www.google.com.ua/\" style=\"font-size: 50;\">Google</a>"
                                    "</body>"
                            "</html>";
    
    [self.webView loadHTMLString:stringHTML baseURL:nil];
    self.webView.scalesPageToFit = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)refreshButton {
    
    self.backButtonItem.enabled = [self.webView canGoBack];
    self.forwardButtonItem.enabled = [self.webView canGoForward];
    
}

#pragma mark - Actions

- (IBAction)actionBack:(id)sender {
    
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    
}

- (IBAction)actionForward:(id)sender {
    
    if ([self.webView canGoForward]) {
        [self.webView goForward];
    }
    
}

- (IBAction)actionRefresh:(id)sender {

        [self.webView reload];
    
}

#pragma mark - UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    NSLog(@"shouldStartLoadWithRequest %@", [request debugDescription]);
    return YES;
    
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    NSLog(@"webViewDidStartLoad");
    [self.indicator startAnimating];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSLog(@"webViewDidFinishLoad");
    [self.indicator stopAnimating];
    [self refreshButton];
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error {
    
    NSLog(@"didFailLoadWithError");
    [self.indicator stopAnimating];
    [self refreshButton];
    
}

@end
