//
//  ViewController.h
//  MineSweeper
//
//  Created by Tyler Vanderhoef on 27/04/15.
//  Copyright (c) 2015 Tyler Vanderhoef. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MineField.h"

@interface ViewController : NSViewController

-(IBAction)minefieldClicked:(NSMatrix*)sender;
-(IBAction)selectLevel:(id)sender;
-(IBAction)newGame:(id)sender;

@property (assign, nonatomic) NSInteger levelIndex;
@property (weak) IBOutlet NSTextField *scoreTextField;
@property (weak) IBOutlet NSMatrix *minefieldMatrix;

@end

