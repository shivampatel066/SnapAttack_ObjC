//
//  ViewController.m
//  SnapAttack_ObjC
//
//  Created by Shivam Patel on 08/12/19.
//  Copyright © 2019 Shivam Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    timerInt = 20;
    scoreInt = 0;
    gameMode = 0;
    
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i",timerInt];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",scoreInt];

}

- (IBAction)startGame:(id)sender {
    
    if (timerInt == 20) {
        
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimer) userInfo:nil repeats:true];
        imageTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(cardUpdate) userInfo:nil repeats:YES];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
        
        [self.startButton setTitle:@"Snap" forState:UIControlStateNormal];
        
        
    }
    
    if (gameMode == 1) {
        
        if ([self.imageView1.image isEqual:self.imageView2.image]) {
            
            scoreInt++;
            self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",scoreInt];
        } else {
            scoreInt--;
            self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",scoreInt];
        }
        
    }
    if (timerInt == 0) {
        
        timerInt = 20;
        scoreInt = 0;
        gameMode = 0;
        
        self.timeLabel.text = [NSString stringWithFormat:@"Time: %i",timerInt];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i",scoreInt];
        
        self.imageView1.image = [UIImage imageNamed:@"blue_cover"];
        self.imageView2.image = [UIImage imageNamed:@"blue_cover"];
        
        [self.startButton setTitle:@"Start" forState:UIControlStateNormal];
    }
    
}
    
- (void)updateTimer {
    
    timerInt--;
    self.timeLabel.text = [NSString stringWithFormat:@"Time: %i",timerInt];
    
    gameMode = 1;
    
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    
    
    if (timerInt == 0) {
        
        
        [timer invalidate];
        [imageTimer invalidate];
        
        self.startButton.enabled = NO;
        self.startButton.alpha = 0.25;
        
        [self.startButton setTitle:@"Restart" forState:UIControlStateNormal];
        
        [self performSelector:@selector(restartTrigger) withObject:nil afterDelay:4.0];
        
        
        
    }
    
}
-(void)cardUpdate {
    
    NSArray *cardList = @[@"ace_of_hearts",
                        @"2_of_hearts",
                        @"3_of_hearts",
                        @"4_of_hearts",
                        @"5_of_hearts",
                        @"6_of_hearts",
                        @"7_of_hearts",
                        @"8_of_hearts",
                        @"9_of_hearts",
                        @"10_of_hearts"];
    
    int randomCard1 = arc4random() % cardList.count;
    self.imageView1.image = [UIImage imageNamed:cardList[randomCard1]];
    
    int randomCard2 = arc4random() % cardList.count;
    self.imageView2.image = [UIImage imageNamed:cardList[randomCard2]];
    
}
-(void)restartTrigger {
    
    self.startButton.enabled = YES;
    self.startButton.alpha = 1.0;
    
    gameMode = 0;
    
}

@end
