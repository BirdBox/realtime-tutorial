//
//  BBXViewController.m
//  Warble
//
//  Created by Tres Spicher on 7/25/13.
//  Copyright (c) 2013 Birdbox. All rights reserved.
//

#import "BBXViewController.h"

@interface BBXViewController ()
    @property (weak, nonatomic) IBOutlet UITextView *serverMessage;
    @property (weak, nonatomic) IBOutlet UITextField *input;
@end

@implementation BBXViewController

- (void) viewWillDisappear:(BOOL)animated
{
    
}

- (void) viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
