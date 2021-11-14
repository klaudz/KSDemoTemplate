//
//  main.m
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import <UIKit/UIKit.h>
#import "KSAppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([KSAppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
