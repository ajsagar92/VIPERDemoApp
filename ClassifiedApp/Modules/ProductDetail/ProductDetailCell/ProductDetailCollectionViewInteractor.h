//
//  ProductDetailCollectionViewInteractor.h
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailCollectionViewInteractor : NSObject

-(instancetype) initWithImages: (NSArray<NSString *> *) images;

- (void) fetchImageAtIndexPath: (NSIndexPath *) indexPath onSuccess: (void (^)(UIImage *)) image onErrorBlock:(void (^)(NSError *)) errorBlock;

@end

NS_ASSUME_NONNULL_END
