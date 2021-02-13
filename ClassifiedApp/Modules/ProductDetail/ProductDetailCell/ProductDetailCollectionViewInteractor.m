//
//  ProductDetailCollectionViewInteractor.m
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import "ProductDetailCollectionViewInteractor.h"

@interface ProductDetailCollectionViewInteractor()

@property (nonatomic, strong) NSArray<NSString *> *images;

@end

@implementation ProductDetailCollectionViewInteractor

- (instancetype) initWithImages: (NSArray<NSString *> *) images {
    self = [super init];
    if (self) {
        self.images = images;
    }
    return self;
}

- (void) fetchImageAtIndexPath: (NSIndexPath *) indexPath onSuccess: (void (^)(UIImage *)) image onErrorBlock:(void (^)(NSError *)) errorBlock {
}

@end
