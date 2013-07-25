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

    @property (nonatomic, readwrite) SRWebSocket *warbleSocket;
    @property (nonatomic, readwrite) BOOL socketReady;
@end

@implementation BBXViewController

- (void) viewWillAppear:(BOOL)animated
{
    self.socketReady = NO;
    self.warbleSocket = [[SRWebSocket alloc] initWithURL:[[NSURL alloc] initWithString:@"http://localhost:5555/warble/websocket"]];
    self.warbleSocket.delegate = self;
    [self.warbleSocket open];
}

- (void) viewWillDisappear:(BOOL)animated
{
    [self.warbleSocket close];
    self.warbleSocket = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (self.socketReady) {
        [self.warbleSocket send:[NSString stringWithFormat:@"%@%@", self.input.text, string]];
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// SRWebSocket handlers
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    self.serverMessage.text = (NSString *)message;
}

- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    self.socketReady = YES;
}

- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    self.socketReady = NO;
}
@end
