//
//  ProductDetailCollectionViewCell.h
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import <UIKit/UIKit.h>
#import "ProductDetailCollectionViewPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProductDetailCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *uiimageProduct;

@property (nonatomic, strong) ProductDetailCollectionViewPresenter *presenter;

@end

NS_ASSUME_NONNULL_END
