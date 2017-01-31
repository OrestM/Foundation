//
//  ViewController.m
//  Animal
//
//  Created by Admin on 11/1/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import "Dog.h"
#import "Cat.h"
#import "Bear.h"
#import "Animal+Animals.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"[Base class Animal]");
    Animal *animal = [[Animal alloc]initWithAnimal:@"Alba" andAge:5 andColor:@"Brown"];
    [animal _Voice];
    [animal _Run];
    [animal play];
    NSLog(@"\n");
    
    NSLog(@"[Inherited class Dog objects]");
    Dog *dog = [[Dog alloc]initWithFavorites:@"Nick" andAge:3 andColor:@"black" andPaws:4];
    [dog _namePaws];
    [dog play];
    
    NSLog(@"\n");
    
    NSLog(@"[Inherited class Cat objects]");
    Cat *cat = [[Cat alloc]initWithFavorites:@"Bella" andAge:7 andColor:@"white" andSleep:9];
    [cat _nameSleep];
    [cat play];
    NSLog(@"\n");
    
    NSLog(@"[Inherited class Bear objects]");
    Bear *bear = [[Bear alloc]initWithFavorites:@"Mishka" andAge:6 andColor:@"dark brown" andHunter:@"'hunter'"];
    [bear _hunter];
    [bear play];
    
    NSLog(@"\n");
    
    NSLog(@"[Array animal objects with method _Voice]");
    NSArray *_animal = [NSArray arrayWithObjects:dog, cat, bear, nil];
    for (id animal in _animal) {
        [animal _Voice];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
