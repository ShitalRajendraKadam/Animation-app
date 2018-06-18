//
//  FirstViewController.h
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)DownLoadButton:(UIButton *)sender;

@end

