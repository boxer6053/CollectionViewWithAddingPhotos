//
//  ANViewController.h
//  PhotoAndLibrary
//
//  Created by ANovoselskyi on 20.06.13.
//  Copyright (c) 2013 Alteso. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDImageCache.h>

@interface ANViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)showActionSheet:(id)sender;

@end
