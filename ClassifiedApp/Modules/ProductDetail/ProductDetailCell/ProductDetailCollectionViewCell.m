//
//  ProductDetailCollectionViewCell.m
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import "ProductDetailCollectionViewCell.h"

@interface ProductDetailCollectionViewCell()

@property (strong, nonatomic) ProductDetailCollectionViewPresenter *_presenter;

@end

@implementation ProductDetailCollectionViewCell

- (void) setPresenter: (ProductDetailCollectionViewPresenter *)presenter forIndexPath: (NSIndexPath *) indexPath {
    self._presenter = presenter;
    [self fetchImageWithIndexPath: indexPath];
    
}

- (void) fetchImageWithIndexPath: (NSIndexPath *) indexPath {
    NSLog(@"Fetching Image");
    [[self _presenter] fetchImageAtIndexPath:indexPath onSuccess:^(UIImage * _Nonnull uiimage) {
        if (uiimage != nil) {
            if (self)
                self->_uiimageProduct.image = uiimage;
        }
    } onErrorBlock:^(NSError * _Nonnull error) {
        NSLog(@"Picture Loading failed..");
        
    }];
    
}

@end
