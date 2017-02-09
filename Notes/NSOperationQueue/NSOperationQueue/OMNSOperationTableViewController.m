//
//  OMNSOperationTableViewController.m
//  NSOperationQueue
//
//  Created by Admin on 6/11/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNSOperationTableViewController.h"

@interface OMNSOperationTableViewController ()

@property (strong, nonatomic) NSArray *images;
@property (strong, nonatomic) NSOperationQueue *myQueue;

@end

static NSString* const identifier = @"imageCell";

@implementation OMNSOperationTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIEdgeInsets insets = UIEdgeInsetsMake(20, 0, 5, 0);
    self.tableView.contentInset = insets;
    
    NSMutableDictionary *image1 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://i.stack.imgur.com/ILTQq.png", @"url", nil];
    NSMutableDictionary *image2 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://images2.wikia.nocookie.net/__cb20120807053107/poohadventures/images/4/45/Goofy_hq.png", @"url", nil];
    NSMutableDictionary *image3 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://live.todocast.tv/images/Twitter-Bird.png", @"url", nil];
    NSMutableDictionary *image4 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://vignette4.wikia.nocookie.net/robber-penguin-agency/images/6/6e/Small-mario.png/revision/latest?cb=20150107080404", @"url", nil];
    NSMutableDictionary *image5 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://xn--80aalcbc2bocdadlpp9nfk.xn--d1acj3b/images/persona/kolya.png", @"url", nil];
    NSMutableDictionary *image6 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://s1.iconbird.com/ico/0612/HydroPROv2/w512h5121339358929Network.png", @"url", nil];
    NSMutableDictionary *image7 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://s1.iconbird.com/ico/0912/ILikeButtons3A/w512h5121348753316CuteBallGames.png", @"url", nil];
    NSMutableDictionary *image8 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"https://en.opensuse.org/images/8/83/Thunderbird_logo.png", @"url", nil];
    NSMutableDictionary *image9 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://juegayestudia.com/images/users/tiburon.png", @"url", nil];
    NSMutableDictionary *image10 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://iconizer.net/files/Brilliant/orig/muscle_car.png", @"url", nil];
    NSMutableDictionary *image11 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.fleetexpo.lu/wp-content/uploads/2015/09/VW-Golf.png", @"url", nil];
    NSMutableDictionary *image12 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://farniente.com/wp-content/uploads/2013/12/car_car.png", @"url", nil];
    NSMutableDictionary *image13 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"https://gaycarboys.files.wordpress.com/2012/01/image9.png", @"url", nil];
    NSMutableDictionary *image14 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"https://d19hkjflplfhx2.cloudfront.net/media/google/google-logo.png", @"url", nil];
    NSMutableDictionary *image15 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://thcsvinhninh.edu.vn/uploads/thcsvinhninh.edu.vn/albums/canh_dep/anh7.jpg", @"url", nil];
    NSMutableDictionary *image16 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://sharbatrepublic.com/wp-content/themes/sharbat/img/animated/bird.png", @"url", nil];
    NSMutableDictionary *image17 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"https://upload.wikimedia.org/wikipedia/commons/7/7a/Basketball.png", @"url", nil];
    NSMutableDictionary *image18 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://3.bp.blogspot.com/--1wPBNN2VAU/VLbUoh5WMLI/AAAAAAAAEvk/pM1EUq0b--A/s1600/962px-Ground_Pound_Yoshi.png", @"url", nil];
    NSMutableDictionary *image19 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://www.samsung.com/us/images/header/header-level.png", @"url", nil];
    NSMutableDictionary *image20 = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"http://pngimg.com/upload/grape_PNG521.png", @"url", nil];
    
    self.images = @[image1, image2, image3, image4, image5, image6, image7, image8, image9, image10, image11, image12, image13,
                    image14, image15, image16, image17, image18, image19, image20];
    
    self.myQueue = [[NSOperationQueue alloc] init];
    self.myQueue.maxConcurrentOperationCount = 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.images.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    NSArray *object = self.images[indexPath.row];
    cell.textLabel.text = [[object valueForKey:@"url"] lastPathComponent];
    
    if ([object valueForKey:@"status"]) {
        
        if ([[object valueForKey:@"status"] isEqualToString:@"completed"] && [object valueForKey:@"image"] && [[object valueForKey:@"image"] isKindOfClass:[UIImage class]]) {
            cell.imageView.contentMode = UIViewContentModeScaleToFill;
            cell.imageView.image = [object valueForKey:@"image"];
        }
        
    } else if ([object valueForKey:@"downloaded"]) {
        
        cell.imageView.image = [UIImage imageNamed:@""];
        
    } else {
        
        [object setValue:@"downloaded" forKey:@"status"];
        
        [self.myQueue addOperationWithBlock:^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[object valueForKey:@"url"]]]];
            [object setValue:image forKey:@"image"];
            [object setValue:@"completed" forKey:@"status"];
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationRight];
            }];
            
        }];
        
    }
    
    return cell;
    
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100.f;
    
}

@end
