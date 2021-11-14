//
//  KSRootViewController.m
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import "KSRootViewController.h"

@interface KSRootViewController ()

@end

@implementation KSRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Demo";
    if (@available(iOS 13.0, *)) {
        self.view.backgroundColor = [UIColor systemBackgroundColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
}


@end
