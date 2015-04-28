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
        int neighbors = [field exposeCellAtRow:(int)r Col:(int)c];
        bcell = [sender cellAtRow:r column:c];
        [bcell setEnabled:false];
        NSString *neighborsAsString =[ NSString stringWithFormat:@"%d",neighbors];
        
        if(neighbors == -2){
            //not allowed...
        }
        else if (neighbors == -1){
            //blew up
            [self.scoreTextField setStringValue:@"BOOM"];

            [bcell setTitle: @"1"];
            for(int i = 0; i < field.height; i++){
                for(int j = 0; j < field.width; j++){
                    //grab button and expose/disable
                    bcell = [sender cellAtRow:i column:j];
                    
                    //get neighbor count for this cell
                    cell = [field cellAtRow:(int)i Col:(int)j];
                    
                    //set text appropriatly.
                    [bcell setTitle: cell.hasMine ? @"X" : [NSString stringWithFormat:@"%d", cell.numSurroundingMines]];
                    [bcell setEnabled:false];
                }
            }
        }
        else if (neighbors == 0){
            //expose 3x3 around this cell.
            //top
            if(r == 0){
                if(c == 0){
                    //top left
                    bcell = [sender cellAtRow:r column:c+1];
                    cell = [field cellAtRow:(int)r Col:(int)c+1];

                    [bcell setTitle:cell.numSurroundingMines == 0 ? @"" :
                     [NSString stringWithFormat:@"%d", cell.numSurroundingMines]];
                    
                    [bcell setEnabled:false];
                    [bcell setState:1];
                    
                    bcell = [sender cellAtRow:r+1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                    
                    bcell = [sender cellAtRow:r+1 column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
                else if (c == field.width){
                    // top right
                    bcell = [sender cellAtRow:r column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r+1 column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r+1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
                else{
                    //top row, not corner
                    bcell = [sender cellAtRow:r column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r+1 column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r+1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r+1 column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
                
            }
            //bottom
            else if (r == field.height){
                if(c == 0){
                    //bottom left
                    bcell = [sender cellAtRow:r column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
                else if (c == field.width){
                    //bottom right
                    bcell = [sender cellAtRow:r column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:-1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
                else{
                    //bottom row, not corner
                    bcell = [sender cellAtRow:r column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c+1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r-1 column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];

                    bcell = [sender cellAtRow:r column:c-1];
                    [bcell setEnabled:false];
                    [bcell setState:1];
                }
            }
            else{
                //do any other case.
                //expose all!
                bcell = [sender cellAtRow:r column:c+1];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r-1 column:c+1];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r-1 column:c];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r-1 column:c-1];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r column:c-1];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r+1 column:c-1];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r+1 column:c];
                [bcell setEnabled:false];
                [bcell setState:1];

                bcell = [sender cellAtRow:r+1 column:c+1];
                [bcell setEnabled:false];
                [bcell setState:1];

            }
            
        }
        else if(neighbors == 1){
            //expose this cell.
            [bcell setTitle:neighborsAsString];
            [bcell setEnabled:false];
        }
        else {
            //expose other cells up to n
            
        }
    }
}

-(IBAction)selectLevel:(id)sender {
    const NSInteger level = [sender indexOfSelectedItem];
    
    if (level == self.levelIndex)
        return; // no change
    self.levelIndex = level; // else record change
    static struct {
        int width, height, numMines;
    } levels[4] = {
        {10, 10, 10}, // 0 : beginner
        {20, 15, 50}, // 1 : intermediate
        {25, 18, 90}, // 2 : advanced
        {30, 20, 150} // 3 : expert
    };
    const int w = levels[level].width; // determine new minefield configuration
    const int h = levels[level].height;
    const int m = levels[level].numMines;
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
    
   // self.matrixWidthConstraint.constant = newMatrixSize.width;
   // self.matrixHeightContraint.constant = newMatrixSize.height;
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
  //  [self updateCells];
  //  [self updateScore];
}

-(IBAction)newGame:(id)sender {
    
    int w = 0;
    int h = 0;
    int m = 0;
    
    if(self.levelIndex == 0){
        //beginer
        field = [[MineField alloc] initWithWidth:10 Height:10 Mines:10];
        w = h = 10;
        m = 10;
    }
    else if(self.levelIndex == 1){
        //intermediate
        field = [[MineField alloc] initWithWidth:25 Height:25 Mines:15];
        w = h = 25;
        m = 15;
    }
    else if(self.levelIndex == 2){
        //advanced
        field = [[MineField alloc] initWithWidth:50 Height:50 Mines:20];
        w = h = 50;
        m = 20;
    }
    else{
        //expert
        field = [[MineField alloc] initWithWidth:100 Height:100 Mines:30];
        w = h = 100;
        m = 30;
    }
    
    for(int i = 0; i < w; i++){
        for (int j = 0; j < h; j++){
            NSButtonCell *bcell = [self.minefieldMatrix cellAtRow:i column:j];
            [bcell setTitle:@""];
            [bcell setEnabled:true];
            [bcell setState:0];
        }
    }
}

@end
