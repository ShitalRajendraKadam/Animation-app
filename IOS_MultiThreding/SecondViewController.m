//
//  SecondViewController.m
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)DownLoadButton1:(UIButton *)sender
{
    self.queue1=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW,0 );
    self.queue2=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,0 );
    
        dispatch_async(self.queue1,^{
            //code
            
            NSError *error1;
            NSString *path1=@"https://www.cityflowers.co.in/blog/wp-content/uploads/2017/10/hibiscus_flower.jpg";
            NSURL *url1=[NSURL URLWithString:path1];
            NSData *data1=[NSData dataWithContentsOfURL:url1 options:NSDataReadingMapped error:&error1];
            if(data1)
            {
                UIImage *image1=[UIImage imageWithData:data1];
                [self performSelectorOnMainThread:@selector(updateUI1:) withObject:image1 waitUntilDone:NO];
            }
        });
  dispatch_async(self.queue2,^{
        //code
        
        NSError *error2;
        NSString *path2=@"https://cdn.pixabay.com/photo/2017/10/24/18/17/rose-2885586_960_720.jpg";
        NSURL *url2=[NSURL URLWithString:path2];
        NSData *data2=[NSData dataWithContentsOfURL:url2 options:NSDataReadingMapped error:&error2];
        if(data2)
        {
            UIImage *image2=[UIImage imageWithData:data2];
            [self performSelectorOnMainThread:@selector(updateUI2:) withObject:image2 waitUntilDone:NO];
        }
    });
}


-(void)updateUI1:(UIImage *)myImage
{
    self.FirstImageView.image=myImage;
}
-(void)updateUI2:(UIImage *)myImage
{
    self.SecondImageview.image=myImage;
}

@end
