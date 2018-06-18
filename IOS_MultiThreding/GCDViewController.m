//
//  GCDViewController.m
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operationQueue=[[NSOperationQueue alloc]init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)DownLoadButton1:(UIButton *)sender
{
    self.blockOperation1=[NSBlockOperation blockOperationWithBlock:^{
        NSString *path1=@"http://images.fanpop.com/images/image_uploads/Marguerite-Daisy-flowers-724870_1024_768.jpg";
        NSURL *url1=[NSURL URLWithString:path1];
        NSData *data1=[NSData dataWithContentsOfURL:url1];
        if(data1)
        {
            UIImage *image1=[UIImage imageWithData:data1];
            [self performSelectorOnMainThread:@selector(updateUI1:) withObject:image1 waitUntilDone:NO];
        }
    }];
    self.blockOperation2=[NSBlockOperation blockOperationWithBlock:^{
        NSString *path2=@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4mcVPHCnnzapjeNHQf-a86OqK5lrSf_p7RCHFwFzdYjVXUwF1fA";
        NSURL *url2=[NSURL URLWithString:path2];
        NSData *data2=[NSData dataWithContentsOfURL:url2];
        if(data2)
        {
            UIImage *image2=[UIImage imageWithData:data2];
            [self performSelectorOnMainThread:@selector(updateUI2:) withObject:image2 waitUntilDone:NO];
        }
    }];
    [self.blockOperation1 addDependency:self.blockOperation2];
    [self.operationQueue addOperation:self.blockOperation1];
    [self.operationQueue addOperation:self.blockOperation2];
}
-(void)updateUI1:(UIImage *)myImage
{
    self.FirstImageView1.image=myImage;
}
-(void)updateUI2:(UIImage *)myImage
{
    self.SecondImageView1.image=myImage;
}

@end
