//
//  ViewController.m
//  iWeather
//
//  Created by CIARA on 3/4/16.
//  Copyright © 2016 CIARA. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *tempC;

@end

@implementation ViewController

{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    NSArray* tempCs;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do", @"Đi một ngày đàng học một sàng khôn"];
    
    locations = @[@"Hanoi, Vietnam", @"TP.HCM, Vietnam", @"Seoul, Korean", @"NewYork, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    
    tempCs = @[@"C", @"F"];
}

- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d",quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherIcon.image = [UIImage imageNamed:photoFiles[photoIndex]];
    
    self.tempC.text = tempCs[0];
    
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
}

- (IBAction)ctof:(id)sender {
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self changeTem]];
    [self.temperature setTitle:string forState:UIControlStateNormal];
    self.tempC.text = tempCs[1];
}

- (float)changeTem{
    float tem = self.getTemperature;
    return (tem *1.8) + 32 ;
}

- (float)getTemperature{
    return 14.0 + arc4random_uniform(18) + (float)arc4random() / (float) INT32_MAX;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
