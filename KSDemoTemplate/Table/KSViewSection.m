//
//  KSViewSection.m
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import "KSViewSection.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KSViewSection

@synthesize viewItems = _viewItems;

- (NSMutableArray<KSViewItem *> *)viewItems {
    if (_viewItems == nil) {
        _viewItems = [[NSMutableArray alloc] init];
    }
    return _viewItems;
}

@end

NS_ASSUME_NONNULL_END
