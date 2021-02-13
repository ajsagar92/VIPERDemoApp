//
//  ProductDetailCollectionViewPresenter.h
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import <Foundation/Foundation.h>
#import "ProductDetailCollectionViewInteractor.h"

NS_ASSUME_NONNULL_BEGIN

@protocol ProductDetailPresenter

@required
- (void) viewDidLoad;

@end

@interface ProductDetailCollectionViewPresenter : NSObject <ProductDetailPresenter>


- (instancetype) initWithImages: (NSArray<NSString*> *) images;


@end

NS_ASSUME_NONNULL_END
