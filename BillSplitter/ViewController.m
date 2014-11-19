//
//  ViewController.m
//  BillSplitter
//
//  Created by Calvin Nisbet on 2014-10-20.
//  Copyright (c) 2014 Calvin Nisbet. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *buttonTap;
@property (nonatomic, strong) IBOutlet UILabel *individualPrice;
@property (nonatomic, strong) IBOutlet UISlider *peopleAmount;
@property (nonatomic, strong) IBOutlet UITextField *totalMeal;
@property (nonatomic, strong) IBOutlet UISegmentedControl *tipPercentage;
@property (nonatomic, strong) IBOutlet UILabel *sliderValue;

-(void)priceWithTip;
-(void)pricePerPerson;
@property (strong, nonatomic) NSArray *tipPercentages;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tipPercentages = @[@(1.10), @(1.15), @(1.20), @(1.25), @(1.30)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderValueChanged:(id)sender {
    
    self.sliderValue.text = [NSString stringWithFormat:@"%f", self.peopleAmount.value];
    
}

- (IBAction)buttonTap:(id)sender {
    [self pricePerPerson];
}


- (void)pricePerPerson{
    float mealPrice = [self.totalMeal.text floatValue];
    float personPrice = mealPrice / self.peopleAmount.value;
  
 
    self.individualPrice.text = [NSString stringWithFormat:@"%.2f", personPrice];

}


- (void)updateWithTip{

   // float priceWithTip = personPrice * [self.tipPercentages.value ];
   

}


@end
