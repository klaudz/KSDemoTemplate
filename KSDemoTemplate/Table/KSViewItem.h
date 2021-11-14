//
//  KSViewItem.h
//  KSDemoTemplate
//
//  Created by Klaudz on 2021/11/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KSViewItem : NSObject

+ (NSString *)defaultCellIdentifer;

@property (nonatomic, copy) NSString *cellIdentifer;

@property (nonatomic, copy, nullable) NSString *title;
@property (nonatomic, copy, nullable) NSString *subtitle;

@property (nonatomic, copy, nullable) void (^didSelectBlock)(KSViewItem *viewItem);

@end

NS_ASSUME_NONNULL_END
