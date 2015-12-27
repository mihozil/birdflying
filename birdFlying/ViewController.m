//
//  ViewController.m
//  birdFlying
//
//  Created by Apple on 12/27/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    UIImageView *backgroundforest;
    UIImageView *bird;
}

- (void) initproject{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initproject];
    [self forestCreating];
    [self birdCreating];
    [self flyupdown];
}
- (void) forestCreating{

    backgroundforest = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"jungle.jpg"]];
    backgroundforest.frame = self.view.bounds;
    [self.view addSubview:backgroundforest];
    
    
}
- (void) birdCreating{
    bird = [[UIImageView alloc]initWithFrame:CGRectMake(0,0,110,68)];
    
    NSMutableArray *image = [[NSMutableArray alloc]initWithCapacity:6];
    
    
    for (int i=0; i<6; i++){
        NSString *name = [NSString stringWithFormat:@"bird%i.png",i];
        [image addObject:[UIImage imageNamed:name]];
    }
    
    bird.animationImages = image;
    bird.animationDuration=1;
    bird.animationRepeatCount=0;
    
    [self.view addSubview:bird];
    [bird startAnimating];
    
  
            
    
}
- (void) flyupdown{
    
 bird.transform = CGAffineTransformIdentity;
   
    [UIView animateWithDuration:4 animations:^{
        bird.center = CGPointMake(self.view.bounds.size.width,self.view.bounds.size.height);
        
    }completion:^(BOOL finished){
        bird.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(-1,1),
                                                 CGAffineTransformMakeRotation(M_PI_4));
        
        [UIView animateWithDuration:6 animations:^{
            bird.center = CGPointMake(0, 0);
        }completion:^(BOOL finished){
            [self flyupdown];
        }
         ];
    }];
     
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
