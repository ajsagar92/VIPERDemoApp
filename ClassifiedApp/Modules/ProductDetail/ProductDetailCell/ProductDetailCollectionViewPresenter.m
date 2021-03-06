//
//  ProductDetailCollectionViewPresenter.m
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import "ProductDetailCollectionViewPresenter.h"
#import "ClassifiedApp-Swift.h"

@interface ProductDetailCollectionViewPresenter()

@property (strong, nonatomic) ProductDetailCollectionViewInteractor *interactor;

@end

@implementation ProductDetailCollectionViewPresenter

- (instancetype) initWithImages:(NSArray<NSString *> *) images {
    self = [self init];
    self.interactor = [[ProductDetailCollectionViewInteractor alloc] initWithImages:images];
    return self;
}

- (void) fetchImageAtIndexPath: (NSIndexPath *) indexPath onSuccess: (void (^)(UIImage *)) successBlock onErrorBlock:(void (^)(NSError *)) errorBlock {
    [[self interactor] fetchImageAtIndexPath:indexPath onCompletion:^(UIImage * _Nullable image) {
        if (image != nil) {
            successBlock(image);
        }
        else {
            NSError *error = [NSError errorWithDomain:@"ImageFailure" code:-1 userInfo:nil];
            errorBlock(error);
        }
    }];
}

@end

