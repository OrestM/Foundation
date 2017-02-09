//
//  OMNavigationController.m
//  NavigationPart 1
//
//  Created by Admin on 3/10/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNavigationController.h"

@interface OMNavigationController ()

@property (strong, nonatomic) NSString *path;
@property (strong, nonatomic) NSArray *contents;

@end

@implementation OMNavigationController

- (id)initWithFolderPath:(NSString *)path {
    
    self = [super initWithStyle:UITableViewStyleGrouped];
    
    if (self) {
        self.path = path;
        
        NSError *error = nil;
        
        self.contents = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.path error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
    }
    
    return self;
    
}

- (void)dealloc {
    NSLog(@"controller with path %@ has been deallocated", self.path);
}

- (void)viewDidLoad {
    [super viewDidLoad];
        
    self.navigationItem.title = [self.path lastPathComponent];
    
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
    NSLog(@"view controller on stack = %ld", [self.navigationController.viewControllers count]);
    NSLog(@"index = %ld\n", [self.navigationController.viewControllers indexOfObject:self]);
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

#pragma mark - Action

- (void)actionBackToRoot:(UIBarButtonItem *)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.contents count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    NSString *fileName = [self.contents objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fileName;
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        cell.imageView.image = [UIImage imageNamed:@"Folder.png"];
        
    } else {
        
        cell.imageView.image = [UIImage imageNamed:@"File.png"];
        
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    if ([self isDirectoryAtIndexPath:indexPath]) {
        
        NSString *fileName = [self.contents objectAtIndex:indexPath.row];
        
        NSString *path = [self.path stringByAppendingPathComponent:fileName];
        
        OMNavigationController *vc = [[OMNavigationController alloc] initWithFolderPath:path];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
}

@end
