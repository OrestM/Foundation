//
//  OMVIPAbonementCollectionViewController.m
//  AbonementApp
//
//  Created by Admin on 4/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMVIPAbonementCollectionViewController.h"
#import "OMVIPAbonementCollectionViewCell.h"
#import "OMAbonement.h"
#import "OMVIPAbonement.h"

@interface OMVIPAbonementCollectionViewController ()

@end

@implementation OMVIPAbonementCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setArrayVip:self.arrayVip];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.arrayVip count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.arrayVip[indexPath.row] isMemberOfClass:[OMAbonement class]]) {
        
        OMVIPAbonementCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        OMAbonement *abonement = self.arrayVip[indexPath.row];
        cell.collectionImage.image = abonement.photo;
        cell.allInfo.text =
        [NSString stringWithFormat:@"Name: %@, Last name: %@,\nPhone number: %li,\nAddress: %@,\nAge: %li, Birthday: %li.", abonement.name, abonement.surname, abonement.phoneNumber, abonement.address, abonement.age, abonement.dateOfBirth];
        
        return cell;
        
    }
    
    if ([self.arrayVip[indexPath.row] isMemberOfClass:[OMVIPAbonement class]]) {
        
        OMVIPAbonementCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        OMVIPAbonement *vipabonement = self.arrayVip[indexPath.row];
        cell.collectionImage.image = vipabonement.photo;
        cell.allInfo.text = [NSString stringWithFormat:@"Name: %@\nInfo: %@", vipabonement.name, vipabonement.info];
        
        return cell;
        
    }
    
    return nil;
}

@end
