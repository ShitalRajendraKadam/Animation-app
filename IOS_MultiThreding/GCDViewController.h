//
//  GCDViewController.h
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *FirstImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *SecondImageView1;
- (IBAction)DownLoadButton1:(UIButton *)sender;


@property NSOperationQueue *operationQueue;
@property NSBlockOperation *blockOperation1;
@property NSBlockOperation *blockOperation2;
@end
