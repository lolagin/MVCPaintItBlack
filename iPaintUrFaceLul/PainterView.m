//
//  PainterView.m
//  iPaintUrFaceLul
//
//  Created by Jeffrey C Rosenthal on 3/20/15.
//  Copyright (c) 2015 Jeffreycorp. All rights reserved.
//



//!!!!MOVE THIS SHIT TO VC, keep props here but copy in vc, switch touches to pan
#import "PainterView.h"

@interface PainterView ()
@property (strong, nonatomic)UIBezierPath *path;
@property (strong, nonatomic)NSMutableArray *pathBank;
@end
@implementation PainterView
-(void)awakeFromNib{
        self.path = [UIBezierPath bezierPath];
    self.pathBank = [[NSMutableArray alloc]init];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    CGPoint touching = [[touches anyObject] locationInView:self];
    [self.path moveToPoint:touching];
        [self setNeedsDisplay];
    
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    CGPoint touching = [[touches anyObject] locationInView:self];
    [self.path addLineToPoint:touching];
        [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint touching = [[touches anyObject] locationInView:self];
    [self.path addLineToPoint:touching];
    [self.pathBank addObject:self.path];
        [self setNeedsDisplay];
    self.path = nil;
    self.path = [UIBezierPath bezierPath];
    
}




// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [[UIColor greenColor]setStroke];
    //[self.path stroke];
    
    for (UIBezierPath *thePath in self.pathBank){
        [thePath stroke];
    }
}


@end
