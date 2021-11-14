//
//  KSViewItem.m
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import "KSViewItem.h"

NS_ASSUME_NONNULL_BEGIN

@implementation KSViewItem

+ (NSString *)defaultCellIdentifer {
    return @"KSViewItem";
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellIdentifer = [[self class] defaultCellIdentifer];
    }
    return self;
}

@end

NS_ASSUME_NONNULL_END
