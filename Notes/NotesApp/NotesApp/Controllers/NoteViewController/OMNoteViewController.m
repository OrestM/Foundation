//
//  OMNoteViewController.m
//  NotesApp
//
//  Created by Admin on 4/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMNoteViewController.h"

@interface OMNoteViewController ()

@end

@implementation OMNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.textView.text = self.note.text;
    
    if (self.editing == NO) {
        
        self.note = [[OMNote alloc] init];
        self.note.name = @"Note";
        
    }
}

- (IBAction)actionSave:(UIButton *)sender {
    
    self.note.text = self.textView.text;
    [self.navigationController popViewControllerAnimated:YES];
    
    if (self.editing == YES) {
        
        [self.delegate noteViewController:self didUpdateNote:self.note];
        
    } else {
        
        [self.delegate noteViewController:self didCreateNote:self.note];
        
    }
    
}

@end
