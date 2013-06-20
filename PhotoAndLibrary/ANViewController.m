//
//  ANViewController.m
//  PhotoAndLibrary
//
//  Created by ANovoselskyi on 20.06.13.
//  Copyright (c) 2013 Alteso. All rights reserved.
//

#import "ANViewController.h"

@interface ANViewController ()

@property (strong, nonatomic) NSMutableArray *imagesArray;

@end

@implementation ANViewController

@synthesize collectionView = _collectionView;
@synthesize imagesArray = _imagesArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    self.imagesArray = [[NSMutableArray alloc] init];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self setCollectionView:nil];
}

- (void)didReceiveMemoryWarning
{    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Photo", @"Get From Gallery", nil];
    
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self takePhoto];
    }
    if (buttonIndex == 1)
    {
        [self getFromGellary];
    }
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.imagesArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
        
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
            
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[self.imagesArray objectAtIndex:indexPath.row]];
    
    cell.backgroundView = backgroundImageView;
    
    return cell;
}

- (void)takePhoto
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    [picker setDelegate:self];
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)getFromGellary
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    [picker setDelegate:self];
    [picker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self.imagesArray addObject:[info valueForKey:@"UIImagePickerControllerOriginalImage"]];
        
    [self.collectionView reloadData];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    picker = nil;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    picker = nil;
}

@end
