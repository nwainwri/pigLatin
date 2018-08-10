//
//  pigLatin.m
//  pigLatin
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "PigLatin.h"

@interface PigLatin()

//@property NSMutableString *firstPart;
//@property NSMutableString *finishWord;

@end

@implementation PigLatin


// basic PigLatin; doens't remove punc or check for constantants

- (NSString *)makePigLatin:(NSString *)word{
    NSRange range = NSMakeRange(0, 1);
    NSMutableString *firstPart = [@"" mutableCopy];
    
    firstPart = [[word substringWithRange:NSMakeRange(0, 1)] mutableCopy];
    //NSLog(@"UserInput: %@", word);
    //NSLog(@"firstPartPigWord: %@", firstPart);
    word = [[word stringByReplacingCharactersInRange:range withString:@""] mutableCopy];
    //NSLog(@"UserInput: %@", word);

    word = [word stringByAppendingString:firstPart];
    //[word appendString:firstPart];
    
    //NSLog(@"UserInput: %@", word);
    return word;
}

@end
