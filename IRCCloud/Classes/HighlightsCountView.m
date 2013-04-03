//
//  HighlightsCountView.m
//  IRCCloud
//
//  Created by Sam Steele on 3/20/13.
//  Copyright (c) 2013 IRCCloud, Ltd. All rights reserved.
//

#import "HighlightsCountView.h"

@implementation HighlightsCountView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _font = [UIFont boldSystemFontOfSize:14];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _font = [UIFont boldSystemFontOfSize:14];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

-(void)setCount:(NSString *)count {
    _count = count;
    [self setNeedsDisplay];
}

-(NSString *)count {
    return _count;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    CGContextAddEllipseInRect(ctx, rect);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
    CGContextFillPath(ctx);
    CGContextRestoreGState(ctx);
    CGContextSaveGState(ctx);
    [[UIColor whiteColor] set];
    CGSize size = [_count sizeWithFont:_font forWidth:rect.size.width lineBreakMode:UILineBreakModeClip];
    [_count drawInRect:CGRectMake(rect.origin.x + ((rect.size.width - size.width) / 2), rect.origin.y + ((rect.size.height - size.height) / 2), size.width, size.height)
              withFont:_font];
    CGContextRestoreGState(ctx);
}

@end