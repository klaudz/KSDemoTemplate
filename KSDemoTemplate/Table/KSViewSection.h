//
//  KSViewSection.h
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class KSViewItem;

@interface KSViewSection : NSObject

@property (nonatomic, copy, nullable) NSString *headerTitle;
@property (nonatomic, copy, nullable) NSString *footerTitle;

@property (nonatomic, strong, readonly) NSMutableArray<KSViewItem *> *viewItems;

@end

NS_ASSUME_NONNULL_END
