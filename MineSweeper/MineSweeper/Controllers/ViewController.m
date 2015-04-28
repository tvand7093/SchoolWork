//
//  ViewController.m
//  MineSweeper
//
//  Created by Tyler Vanderhoef on 27/04/15.
//  Copyright (c) 2015 Tyler Vanderhoef. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController {
    MineField *field;
    int score;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newGame: self];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

-(void)processCells {
    for (int r = 0; r < field.height; r++) {
        for(int c = 0; c < field.width; c++){
            //loop over all and update if necessary
            NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
            Cell *cell = [field cellAtRow:r Col:c];
            if(cell.exposed && !cell.marked){
                //expose...
                [bcell setTitle: cell.numSurroundingMines == 0
                 ? @"" : [NSString stringWithFormat:@"%d", cell.numSurroundingMines]];
                
                [bcell setEnabled:false];
                [bcell setState:1];
            }
        }
    }
}

-(void)processWin {
    for (int r = 0; r < field.height; r++) {
        for(int c = 0; c < field.width; c++){
            //loop over all and update if necessary
            NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:r column:c];
            Cell *cell = [field cellAtRow:r Col:c];
            if(cell.hasMine){
                //disable mine
                [bcell setTitle: [NSString stringWithFormat:@"X"]];
                
                [bcell setEnabled:false];
                [bcell setState:1];
            }
        }
    }
}

-(IBAction)minefieldClicked:(NSMatrix*)sender {
    const NSInteger r = [sender selectedRow];
    const NSInteger c = [sender selectedColumn];
    NSButtonCell *bcell = [sender selectedCell];
    Cell *cell = [field cellAtRow:(int)r Col:(int)c];

    BOOL shiftKeyDown = ([[NSApp currentEvent] modifierFlags] &
                         (NSShiftKeyMask | NSAlphaShiftKeyMask)) !=0;
    
    if (shiftKeyDown) {
        cell.marked = !cell.marked; // toggle marked cell
        [bcell setTitle: cell.marked ? @"P" : @""];
    }else{
        //process it!
        int neighbors = [field exposeCellAtRow:(int)r Col:(int)c];
        bcell = [sender cellAtRow:r column:c];
        [bcell setEnabled:false];
        
        if (neighbors == -1){
            //blew up, process loss.
            [self.scoreTextField setStringValue:@"BOOM"];

            [bcell setTitle: @"1"];
            for(int i = 0; i < field.height; i++){
                for(int j = 0; j < field.width; j++){
                    //grab button and expose/disable
                    bcell = [sender cellAtRow:i column:j];
                    
                    //get neighbor count for this cell
                    cell = [field cellAtRow:(int)i Col:(int)j];
                    
                    //set text appropriatly.
                    
                    NSString *toPrint;
                    if(cell.hasMine){
                        toPrint = @"X";
                    }
                    else{
                        toPrint = cell.numSurroundingMines == 0 ? @""
                            : [NSString stringWithFormat:@"%d", cell.numSurroundingMines];
                    }
                    
                    [bcell setTitle: toPrint];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
            }
        }
        else if (neighbors >= 0){
            [self processCells];
            //update score
            if(field.unexposedCells == 0){
                //win!
                [self.scoreTextField setStringValue:@"WIN"];
                [self processCells];
            }
            else{
                [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%d", field.unexposedCells]];
            }
        }
    }
}

-(IBAction)selectLevel:(id)sender {
    const NSInteger level = [sender indexOfSelectedItem];
    
    if (level == self.levelIndex)
        return; // no change
    self.levelIndex = level; // else record change
}

-(void)resetBoard:(int)h width:(int)w {
    for(int i = 0; i < w; i++){
        for (int j = 0; j < h; j++){
            NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:i column:j];
            [bcell setTitle:@""];
            [bcell setEnabled:true];
            [bcell setState:0];
        }
    }
    
    [self.scoreTextField setStringValue:[NSString stringWithFormat:@"%d", field.unexposedCells]];
}

-(IBAction)newGame:(id)sender {
    static struct {
        int width, height, numMines;
    } levels[4] = {
        {10, 10, 10}, // 0 : beginner
        {20, 15, 50}, // 1 : intermediate
        {25, 18, 90}, // 2 : advanced
        {30, 20, 150} // 3 : expert
    };
    const int w = levels[self.levelIndex].width; // determine new minefield configuration
    const int h = levels[self.levelIndex].height;
    const int m = levels[self.levelIndex].numMines;
    //
    // Update minefield matrix and record change in size.
    // Update AutoLayout size constraints on minefield matrix.
    //
    const CGSize matrixSize = self.minefieldMatrix.frame.size;
    [self.minefieldMatrix renewRows: h columns: w];
    [self.minefieldMatrix sizeToCells];
    const CGSize newMatrixSize = self.minefieldMatrix.frame.size;
    const CGSize deltaSize = CGSizeMake(newMatrixSize.width - matrixSize.width,
                                        newMatrixSize.height - matrixSize.height);
    
    //self.matrixWidthConstraint.constant = newMatrixSize.width;
    //self.matrixHeightContraint.constant = newMatrixSize.height;
    //
    // Resize enclosing window according to size
    // of the minefield matrix.
    //
    NSRect windowFrame = self.view.window.frame;
    NSRect newWindowFrame = CGRectMake(windowFrame.origin.x,
                                       windowFrame.origin.y - deltaSize.height,
                                       windowFrame.size.width + deltaSize.width,
                                       windowFrame.size.height + deltaSize.height);
    
    [self.view.window setFrame:newWindowFrame display:YES animate:NO];
    //
    // Allocate a new minfield model and update the minefield
    // matrix cells.
    //
    field = [[MineField alloc] initWithWidth:w Height:h Mines:m];
    [self resetBoard:w width:h];

}

@end
