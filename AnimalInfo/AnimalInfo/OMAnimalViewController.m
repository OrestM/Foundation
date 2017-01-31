//
//  OMAnimalViewController.m
//  AnimalInfo
//
//  Created by Admin on 3/30/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMAnimalViewController.h"
#import "OMCat.h"
#import "OMDog.h"
#import "OMMonkey.h"

@interface OMAnimalViewController ()

@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;

@property (assign, nonatomic) NSInteger index;
@property (strong, nonatomic) NSArray *arrayAnimal;

@end

@implementation OMAnimalViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    OMCat *animalCat = [[OMCat alloc] init];
    
    animalCat.name = @"Kate";
    animalCat.age = 6;
    animalCat.color = @"White";
    
    OMDog *animalDog = [[OMDog alloc] init];
    
    animalDog.name = @"Bob";
    animalDog.age = 3;
    animalDog.color = @"Balck";
    
    OMMonkey *animalMonkey = [[OMMonkey alloc] init];
    
    animalMonkey.name = @"Charly";
    animalMonkey.age = 7;
    animalMonkey.color = @"Brown";
    
    _arrayAnimal = @[animalCat, animalDog, animalMonkey];
    
    [self updateAnimal];
}

- (void)updateAnimal {
    
    OMAnimal *currentAnimal = self.arrayAnimal[self.index];
    
    self.nameLabel.text = currentAnimal.name;
    self.ageLabel.text = [NSString stringWithFormat:@"%d", currentAnimal.age];
    self.colorLabel.text = currentAnimal.color;
    
}

- (IBAction)actionNext:(UIButton *)sender {
    
    self.index++;
    
    if (self.index == self.arrayAnimal.count) {
    
        self.index = self.arrayAnimal.count - 1;
    
    }
    
    [self updateAnimal];
}

- (IBAction)actionPrevious:(UIButton *)sender {
    
    self.index = self.index - 1;
    
    if (self.index == -1) {
        
        self.index += 1;
        [self updateAnimal];
        
    }
    
    [self updateAnimal];
    
    
}

- (IBAction)actionVoice:(UIButton *)sender {
    
    OMAnimal *currentAnimal = self.arrayAnimal[self.index];
        
    [currentAnimal voice];
    
}

@end
