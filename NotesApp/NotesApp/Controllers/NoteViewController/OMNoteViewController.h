//
//  OMNoteViewController.h
//  NotesApp
//
//  Created by Admin on 4/8/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OMNote.h"

@protocol OMNoteViewControllerDelegate;

@interface OMNoteViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) id<OMNoteViewControllerDelegate> delegate;

@property (strong, nonatomic) OMNote *note;
@property (assign, nonatomic) BOOL isEdit;

@end

@protocol OMNoteViewControllerDelegate <NSObject>

- (void)noteViewController:(OMNoteViewController *)viewController didCreateNote:(OMNote *)note;

- (void)noteViewController:(OMNoteViewController *)viewController didUpdateNote:(OMNote *)note;

@end