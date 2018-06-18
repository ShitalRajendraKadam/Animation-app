//
//  FirstViewController.m
//  IOS_MultiThreding
//
//  Created by Student P_02 on 18/06/18.
//  Copyright © 2018 Shital. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)DownLoadButton:(UIButton *)sender
{
    NSString *imagePath=@"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4mcVPHCnnzapjeNHQf-a86OqK5lrSf_p7RCHFwFzdYjVXUwF1fA";
    
    [NSThread detachNewThreadSelector:@selector(downloadimage:) toTarget:self withObject:imagePath];

}
-(void)downloadimage:(NSString *)sender
{
    NSError *error;
    NSURL *url=[NSURL URLWithString:sender];
    NSData *data=[NSData dataWithContentsOfURL:url options:NSDataReadingMapped error:&error];
    if(!error)
    {
        UIImage *myImage=[UIImage imageWithData:data];
        if(data)
        {
            [self performSelectorOnMainThread:@selector(UpdateUI:) withObject:myImage waitUntilDone:NO];
        }
    }
    else
    {
        NSLog(@"%@",error.localizedDescription);
    }
}

-(void)UpdateUI:(UIImage *)myImage
{
    self.myImageView.image=myImage;
}

@end
