//
//  ViewController.m
//  InstaKilo180516
//
//  Created by Yasmin Ahmad on 2016-05-18.
//  Copyright © 2016 YasminA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) UICollectionViewLayout *defaultLayout;
@property (strong, nonatomic) UICollectionViewLayout *locationLayout; 
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSArray<NSArray<NSString*>*> *arrayOfArrays;
@property (strong, nonatomic) NSArray *titleArray;
@property (strong, nonatomic) NSArray *categoryArray;
@property (strong, nonatomic) NSArray *locationArray;
@property (strong, nonatomic) NSArray<NSArray<NSString*>*> *arrayOfLocations;
@property (strong, nonatomic) NSArray<NSArray<NSString*>*> *arrayOfCategories;
@property (strong, nonatomic) NSString *titleHeader;
@property (strong, nonatomic) IBOutlet UISegmentedControl *changeView;
@property (strong, nonatomic) UISegmentedControl *segmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//IMAGE ARRAYS
    NSArray<NSString*> *s1Images = @[@"aydin1.jpg", @"aydin2.jpeg", @"aydin3.jpeg"];
    NSArray<NSString*> *s2Images = @[@"babyshower1.jpg", @"babyshower2.jpg"];
    NSArray<NSString*> *s3Images = @[@"drake1.png", @"drake2.png", @"drake3.png"];
    NSArray<NSString*> *s4Images = @[@"funny1.jpg", @"funny2.jpg"];
    self.arrayOfCategories = @[s1Images, s2Images, s3Images, s4Images];

//IMAGE HEADER ARRAY
    self.categoryArray = @[@"Aydin", @"Baby Shower", @"Drake", @"Funny"];

//LOCATION ARRAYS
    NSArray<NSString*> *loc1Images = @[@"aydin1.jpg", @"aydin2.jpeg", @"aydin3.jpeg", @"babyshower1.jpg", @"babyshower2.jpg"];
    NSArray<NSString*> *loc2Images = @[@"drake1.png", @"drake2.png", @"drake3.png", @"funny1.jpg", @"funny2.jpg"];
    self.arrayOfLocations = @[loc1Images, loc2Images];
    
//LOCATION HEADER ARRAY
    self.locationArray = @[@"Toronto", @"International"];
    
    // Default to category
    [self displayByCategory];
    
    self.defaultLayout = self.collectionView.collectionViewLayout;
    
 }


//METHODS TO DISPLAY ARRAYS BY CATEGORY OR LOCATION
- (void)displayByCategory
{
    self.arrayOfArrays = self.arrayOfCategories;
    self.titleArray = self.categoryArray;

}

- (void)displayByLocation
{
    self.arrayOfArrays = self.arrayOfLocations;
    self.titleArray = self.locationArray;
}


//SEGMENTED CONTROL TO TOGGLE BETWEEN TWO VIEWS
- (IBAction)changeCollectionViewData:(UISegmentedControl*)sender {
    
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.arrayOfArrays = self.arrayOfCategories;
            self.titleArray = self.categoryArray;
            break;
        case 1:
            self.arrayOfArrays = self.arrayOfLocations;
            self.titleArray = self.locationArray;
            break;
    }
    [self.collectionView reloadData];
    
}


#pragma mark - UICollectionViewDataSource

//SET NUMBER OF SECTIONS
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return self.arrayOfArrays.count;
}


//SET NUMBER OF ITEMS
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arrayOfArrays[section].count;
}


//SET INDEX PATH
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"prototypeCell" forIndexPath:indexPath];

    UIImageView *cellImage = (UIImageView*)[cell viewWithTag:1];
    cellImage.image = [UIImage imageNamed:self.arrayOfArrays[indexPath.section][indexPath.item]];
    
    return cell;
}


//SET HEADER
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        NSString *title = self.titleArray[indexPath.section];
        header.backgroundColor = [UIColor grayColor];
        
        UILabel *sectionName = [header viewWithTag:1];
        sectionName.text = [NSString stringWithFormat:@"%@", title];
        
        return header;
    }
    return nil;
}

@end
