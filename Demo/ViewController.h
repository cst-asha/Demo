//
//  ViewController.h
//  Demo
//
//  Created by fab3 on 06/01/15.
//  Copyright (c) 2015 sunny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource , UITableViewDelegate>{
    
    NSMutableArray *arrWorks;
    NSMutableArray *arrService;
    NSMutableArray *arrGoods;
    
    IBOutlet UITableView *tblView;
}


@end

