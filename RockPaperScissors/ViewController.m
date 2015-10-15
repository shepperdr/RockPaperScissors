//
//  ViewController.m
//  RockPaperScissors
//
//  Created by Robert Shepperd on 10/14/15.
//  Copyright © 2015 Robert Shepperd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSString *selectedTool;

@end

static const NSString *rock = @"Rock" ;
static const NSString *paper = @"Paper";
static const NSString *scissors = @"Scissors";



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self firstPlay];
    
    
}


- (void)firstPlay {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome to RPS." message:@"Choose your first tool." preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Rock" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Rock";
        [self presentHandAlert];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Paper" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Paper";
        [self presentHandAlert];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Scissors" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Scissors";
        [self presentHandAlert];
    }]];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (void)presentHandAlert {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[self randomHand] message:[NSString stringWithFormat:@"You selected %@", self.selectedTool] preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Rock" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Rock";
        [self presentHandAlert];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Paper" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Paper";
        [self presentHandAlert];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Scissors" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        self.selectedTool = @"Scissors";
        [self presentHandAlert];
    }]];
    
    [self.navigationController presentViewController:alert animated:YES completion:nil];
}

- (NSString *)randomHand {
    
    int index = (arc4random_uniform((int)([self handQuotes].count)));
    return [self handQuotes][index];
    
}

- (NSArray *) handQuotes {
    
    return @[@"Rock was played.",
             @"Paper was played.",
             @"Scissors was played."
             ];
    
}

- (NSArray *)yourHandPlayed {
    
    return @[@"You played Rock",
             @"You played Paper",
             @"You played Scissors"
             ];
    
}



@end