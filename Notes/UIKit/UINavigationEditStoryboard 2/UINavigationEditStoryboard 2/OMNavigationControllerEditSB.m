//
//  OMNavigationControllerEditSB.m
//  UINavigationEditStoryboard 2
//
//  Created by Admin on 3/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNavigationControllerEditSB.h"
#import "OMFileCell.h"
#import "UIView+OMUITableViewCell.h"

@interface OMNavigationControllerEditSB ()

@property (strong, nonatomic) NSArray *contents;

@end

@implementation OMNavigationControllerEditSB

- (id)initWithFolderPath:(NSString *)path {
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        self.path = path;
        
    }
    
    return self;
    
}

- (void)setPath:(NSString *)path {
    
    _path = path;
    
    NSError *error = nil;
    
    self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
    
    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }
    
    [self.tableView reloadData];
    
    self.navigationItem.title = [self.path lastPathComponent];
}

- (void)dealloc {
    NSLog(@"controller with path %@ has been deallocated", self.path);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = [self.path lastPathComponent];
    
    if (!self.path) {
        self.path = @"/Users/admin/Desktop/Pllug 1-st Semester";
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self.navigationController.viewControllers count] > 1) {
        
        UIBarButtonItem *item = [[UIBarButtonItem alloc]
                                 initWithTitle:@"Back to Root"
                                 style:UIBarButtonItemStylePlain
                                 target:self
                                 action:@selector(actionBackToRoot:)];
        
        self.navigationItem.rightBarButtonItem = item;
    }
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"path = %@", self.path);
    NSLog(@"view controller on stack = %u", [self.navigationController.viewControllers count]);
    NSLog(@"index = %u\n", [self.navigationController.viewControllers indexOfObject:self]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)isDirectoryAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    NSString *filePath = [self.path stringByAppendingPathComponent:fileName];
    
    BOOL isDirectory = NO;
    
    [[NSFileManager defaultManager] fileExistsAtPath:filePath isDirectory:&isDirectory];
    
    return isDirectory;
    
}

- (NSString *)fileSizeFromValue:(unsigned long long)size {
    
    static NSString *units[] = {@"B", @"KB", @"MB", @"GB", @"TB"};
    static int unitsCount = 5;
    int index = 0;
    
    double fileSize = (double)size;
    
    while (fileSize > 1024 && index < unitsCount) {
        fileSize /= 1024;
        index++;
    }
    
    return [NSString stringWithFormat:@"%.2f %@", fileSize, units[index]];
}

- (void)showMessage:(NSString *)message withTitle:(NSString *)title {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK!" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Click actionInfo");
    }];
    
    [alert addAction:action];
    
    UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    
    [vc presentViewController:alert animated:YES completion:nil];
    
}

#pragma mark - Action

- (void)actionBackToRoot:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (IBAction)actionInfo:(UIButton *)sender {
    
    UITableViewCell *cell = [sender superCell];
    
    if (cell) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
        
        [self showMessage:[NSString stringWithFormat:@"%d %d", indexPath.section, indexPath.row] withTitle:@"Yohho!"];
        
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.contents count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *fileIdentifier = @"FileCell";
    static NSString *folderIdentifier = @"FolderCell";
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:folderIdentifier];
        
        cell.textLabel.text = fileName;
        
        return cell;
        
    } else {
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        NSDictionary *attributes = [[NSFileManager defaultManager] attributesOfItemAtPath:path error:nil];
        
        OMFileCell *cell = [tableView dequeueReusableCellWithIdentifier:fileIdentifier];
        
        cell.nameLabel.text = fileName;
        cell.sizeLabel.text = [self fileSizeFromValue:[attributes fileSize]];
        
        NSDateFormatter *dateFormatter = nil;
        
        if (!dateFormatter) {
            dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM/dd/yyyy hh:mm a"];
        }
        
        cell.dateLabel.text = [dateFormatter stringFromDate:[attributes fileModificationDate]];
        
        return cell;
    }
    
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        return 44.f;
    } else {
        return 80.f;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        OMNavigationControllerEditSB *vc =
        [self.storyboard instantiateViewControllerWithIdentifier:@"OMNavigationControllerEditSB"];
        vc.path = path;        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

@end
