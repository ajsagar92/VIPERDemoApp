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

@property (strong, nonatomic, readonly) NSArray<NSString *> *images;

@end

NS_ASSUME_NONNULL_END
