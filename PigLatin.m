//
//  pigLatin.m
//  pigLatin
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "PigLatin.h"

@interface PigLatin()
@end

@implementation PigLatin

- (NSString *)makePigLatin:(NSString *)word{
//                   CONSONANT DICTIONARY
//                    https://www.sltinfo.com/syllables-and-clusters/
    BOOL whichArray = NO;
    BOOL doneWord = NO;
    NSMutableString *firstPart = [@"" mutableCopy];
//            CONSONTANT ARRAYS
    NSArray *twoLetter = @[@"sm",@"sn",@"st",@"sw",@"sk",@"sl",@"sp",@"dw",@"tw",@"th",@"sp",@"dr",@"tr",@"qu",@"cr",@"cl",@"pr",@"fr",@"br",@"gr",@"pl",@"fl",@"bl",@"gl"];
    NSArray *threeLetter = @[@"shr",@"thr",@"thw",@"sph",@"spl",@"spr",@"str",@"scr",@"squ"];
    
    if (whichArray == NO) {
        for (int a = 0; a < [threeLetter count]; a++) {
            if ([word rangeOfString:threeLetter[a]].location != NSNotFound) {
                NSRange rangeTest = NSMakeRange(0, 3);
                firstPart = [[word substringWithRange:rangeTest] mutableCopy];
                word = [[word stringByReplacingCharactersInRange:rangeTest withString:@""] mutableCopy];
                word = [[word stringByAppendingString:threeLetter[a]] mutableCopy];
                firstPart = [[word stringByAppendingString:@"ay"] mutableCopy];
                doneWord = YES;
            } else {
                whichArray = YES;
            }
        }
        if ((whichArray == YES) && (doneWord == NO)) {
            for (int a = 0; a < [twoLetter count]; a++) {
                if (([word rangeOfString:twoLetter[a]].location != NSNotFound) && doneWord == NO) {
                    NSRange rangeTest = NSMakeRange(0, 2);
                    firstPart = [[word substringWithRange:rangeTest] mutableCopy];
                    word = [[word stringByReplacingCharactersInRange:rangeTest withString:@""] mutableCopy];
                    word = [[word stringByAppendingString:twoLetter[a]] mutableCopy];
                    firstPart = [[word stringByAppendingString:@"ay"] mutableCopy];
                    doneWord = YES;
                }
            }
            
        }
    }
    return firstPart;
}

- (NSString *)makePigLatinSentence:(NSString *)sentance{
    NSArray *array = [sentance componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    int countArray = [array count];
    NSMutableString *tempSentance = [@"" mutableCopy];
    for (int a = 0; a < countArray; a++) {
        NSMutableString *tempWord = [@"" mutableCopy];
        tempWord = [[self makePigLatin:array[a]] mutableCopy];
        tempSentance = [[tempSentance stringByAppendingString:tempWord] mutableCopy];
        tempSentance = [[tempSentance stringByAppendingString:@" "] mutableCopy];
    }
    return tempSentance;
}



@end
