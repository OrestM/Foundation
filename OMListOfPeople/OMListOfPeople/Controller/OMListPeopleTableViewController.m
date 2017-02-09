//
//  OMListPeopleTableViewController.m
//  OMListOfPeople
//
//  Created by Orest Mykha on 2/4/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "OMListPeopleTableViewController.h"
#import "PersonModel.h"
#import "OMListPeopleTableViewCell.h"
#import "OMMapViewController.h"

@interface OMListPeopleTableViewController ()

@property (strong, nonatomic) NSDictionary *people;
@property (strong, nonatomic) NSArray *values;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *longitude;
@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) NSCache *cashe;

@end

@implementation OMListPeopleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
    
    self.people = [[PersonModel sharedManager] getInfoOfPerson];
    self.values = [_people allValues];
    
    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:nil];
    self.cashe = [NSCache new];
    
}

- (IBAction)showOnMap:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    NSLog(@"%ld", (long)indexPath.row);
    OMMapViewController *vc = [OMMapViewController sharedManager];
    _latitude = [NSString stringWithFormat:@"%@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"latitude"]];
    _longitude = [NSString stringWithFormat:@"%@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"longitude"]];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    vc = [storyBoard instantiateViewControllerWithIdentifier:@"OMMap"];
    vc.latitude = _latitude.floatValue;
    vc.longitude = _longitude.floatValue;
    UIViewController *top = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [top presentViewController:vc animated:YES completion:nil];
}

- (IBAction)moreAction:(id)sender {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[sender tag] inSection:0];
    NSLog(@"%ld", (long)indexPath.row);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[NSString stringWithFormat:@"More info about %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"name"]] message:[NSString stringWithFormat:@"Date death: %@,\n Place: %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"death"], [[self.values objectAtIndex:indexPath.row] valueForKey:@"placeDead"]] preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Back" style:UIAlertActionStyleCancel handler:nil];
    
    UIViewController *top = [[[UIApplication sharedApplication] keyWindow] rootViewController];
    [alert addAction:cancel];
    [top presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.values.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OMListPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[OMListPeopleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    if ([[self.values objectAtIndex:indexPath.row] valueForKey:@"death"] == nil) {
        cell.more.hidden = YES;
    } else {
        cell.more.hidden = NO;
    }
    
    cell.more.tag = indexPath.row;
    cell.showOnMap.tag = indexPath.row;
    
    cell.session = self.session;
    cell.cashe = self.cashe;
    
    NSURL *url = [NSURL URLWithString:[[self.values objectAtIndex:indexPath.row] valueForKey:@"picture"]];
    [cell loadImageWithUrl:url];

    cell.name.text = [NSString stringWithFormat:@"Name: %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"name"]];
    cell.birth.text = [NSString stringWithFormat:@"Birth: %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"birth"]];
    cell.gender.text = [NSString stringWithFormat:@"Gender: %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"gender"]];
    cell.place.text = [NSString stringWithFormat:@"Place: %@", [[self.values objectAtIndex:indexPath.row] valueForKey:@"place"]];
    
    return cell;
}

@end
