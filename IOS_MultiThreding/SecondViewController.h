//
//  SecondViewController.h
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *FirstImageView;
@property (weak, nonatomic) IBOutlet UIImageView *SecondImageview;
- (IBAction)DownLoadButton1:(UIButton *)sender;


@property dispatch_queue_t queue1;
@property dispatch_queue_t queue2;
@end

