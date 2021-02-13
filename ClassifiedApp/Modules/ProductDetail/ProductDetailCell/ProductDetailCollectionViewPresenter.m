//
//  ProductDetailCollectionViewPresenter.m
//  ClassifiedApp
//
//  Created by AJ Sagar Parwani on 14/02/2021.
//

#import "ProductDetailCollectionViewPresenter.h"

@interface ProductDetailCollectionViewPresenter()

@property (strong, nonatomic) ProductDetailCollectionViewInteractor *interactor;

@end

@implementation ProductDetailCollectionViewPresenter

- (instancetype) initWithImages:(NSArray<NSString *> *) images {
    self = [self init];
    self.interactor = [[ProductDetailCollectionViewInteractor alloc] initWithImages:images];
    return self;
}

- (void) viewDidLoad {
    
}

@end

