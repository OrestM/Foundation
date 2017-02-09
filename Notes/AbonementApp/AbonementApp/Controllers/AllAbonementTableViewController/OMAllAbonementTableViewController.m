//
//  OMAllAbonementTableViewController.m
//  AbonementApp
//
//  Created by Admin on 4/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMAllAbonementTableViewController.h"
#import "OMAbonementViewController.h"
#import "OMVIPAbonementCollectionViewController.h"
#import "OMAllAbonementTableViewCell.h"
#import "OMVIPAbonementTableViewCell.h"
#import "OMVIPAbonement.h"
#import "OMAbonement.h"

@interface OMAllAbonementTableViewController () 

@property (strong, nonatomic) NSArray *allBenefit;

@end

static NSString *abonementIdentifier = @"abonementCell";
static NSString *vipabonementIdentifier = @"vipabonementCell";

@implementation OMAllAbonementTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Abonement list";
    
    UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 0, 0);
    
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    
    OMVIPAbonement *getBenefits = [[OMVIPAbonement alloc] init];
    [self setAllBenefit:getBenefits.benefits];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allBenefit count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.allBenefit[indexPath.row] isMemberOfClass:[OMAbonement class]]) {
    
        OMAllAbonementTableViewCell *cellAbonement = [tableView dequeueReusableCellWithIdentifier:abonementIdentifier];
    
        if (!cellAbonement) {
            
            cellAbonement =
            [[OMAllAbonementTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:abonementIdentifier];
        }
        
        OMAbonement *abonement = self.allBenefit[indexPath.row];
        cellAbonement.benefitAbonementImage.image = abonement.photo;
        cellAbonement.benefitAbonementLabel.text = [NSString stringWithFormat:@"%@ %@", abonement.name, abonement.surname];
        
        return cellAbonement;
    }
    
    if ([self.allBenefit[indexPath.row] isMemberOfClass:[OMVIPAbonement class]]) {
        
        OMVIPAbonementTableViewCell *cellVIPAbonement = [tableView dequeueReusableCellWithIdentifier:vipabonementIdentifier];
    
        if (!cellVIPAbonement) {
            
            cellVIPAbonement = [[OMVIPAbonementTableViewCell alloc]
                                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:vipabonementIdentifier];
            
        }
        
        OMVIPAbonement *vipabonement = self.allBenefit[indexPath.row];
        cellVIPAbonement.benefitVIPAbonementImage.image = vipabonement.photo;
        cellVIPAbonement.benefitVIPAbonementLabel.text = [NSString stringWithFormat:@"%@", vipabonement.name];
        
        return cellVIPAbonement;
    
    }
    
    return nil;
}

#pragma mark - Method for segue

- (UIImage *)imageForSender:(id)sender {
    
    NSIndexPath *lIndexPath = [self.tableView indexPathForCell:sender];
    
    return ((OMAbonement*)_allBenefit[lIndexPath.row]).photo;
    
}

- (NSString *)labelInfoForSender:(id)sender {
    
    NSIndexPath *lIndexPath = [self.tableView indexPathForCell:sender];
    
    NSString *address = ((OMAbonement*)_allBenefit[lIndexPath.row]).address;
    NSInteger phoneNumber = ((OMAbonement*)_allBenefit[lIndexPath.row]).phoneNumber;
    NSInteger age = ((OMAbonement*)_allBenefit[lIndexPath.row]).age;
    NSInteger dateOfBirht = ((OMAbonement*)_allBenefit[lIndexPath.row]).dateOfBirth;
    
    NSString *labelInfo = [NSString stringWithFormat:@"Address: %@,\nPhone Number: %li,\nAge: %li,\nDate of birth: %li.",
                           address, phoneNumber, age, dateOfBirht];
    
    return labelInfo;
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"abonementSeque"]) {
        
        OMAbonementViewController *vc = [segue destinationViewController];
        [vc setImage:[self imageForSender:sender]];
        [vc setLabelInfo:[self labelInfoForSender:sender]];
        
    } else if ([segue.identifier isEqualToString:@"vipAbonementSeque"]) {
    
        OMVIPAbonementCollectionViewController *cvc = [segue destinationViewController];
        [cvc setArrayVip:_allBenefit];
        
    }
    
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 60;
    
}

@end
