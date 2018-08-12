//
//  NSString+PigLatined.m
//  pigLatin
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import "NSString+PigLatined.h"

@implementation NSString (PigLatined)

- (NSMutableString *)wordByPigLatinization{
    //                   CONSONANT DICTIONARY
    //                    https://www.sltinfo.com/syllables-and-clusters/
    BOOL whichArray = NO;
    BOOL doneWord = NO;
    NSMutableString *firstPart = [@"" mutableCopy];
    //            CONSONTANT ARRAYS
    NSArray *twoLetter = @[@"sm",@"sn",@"st",@"sw",@"sk",@"sl",@"sp",@"dw",@"tw",@"th",@"sp",@"dr",@"tr",@"qu",@"cr",@"cl",@"pr",@"fr",@"br",@"gr",@"pl",@"fl",@"bl",@"gl"];
    NSArray *threeLetter = @[@"shr",@"thr",@"thw",@"sph",@"spl",@"spr",@"str",@"scr",@"squ"];
    
    NSMutableString *word = [self mutableCopy];
    
    word = [[word lowercaseString] mutableCopy]; // takes userInput and drops it to lowercase
    word = [[[word componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""] mutableCopy];
    
    NSUInteger wordlength = word.length;
    //NSLog(@"WORD LENGTH AS A NUMBER %lu", (unsigned long)wordlength);
    
    if (wordlength < 4) {
        NSRange rangeTest = NSMakeRange(0, 1);
        firstPart = [[word substringWithRange:rangeTest] mutableCopy];
        word = [[word substringFromIndex:1] mutableCopy];
        //word = [[word stringByReplacingCharactersInRange:rangeTest withString:@""] mutableCopy];
        word = [[word stringByAppendingString:firstPart] mutableCopy];
        firstPart = [[word stringByAppendingString:@"ay"] mutableCopy];
        //NSLog(@"SMALL WORD: %@", firstPart);
    } else {
        // where MAIN if will go
    }
    //  MAIN if
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
    } // end MAIN if
    return word;
}

- (NSString *)stringByPigLatinization{
    NSArray *array = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]];
    int countArray = [array count];
    
    NSMutableString *tempSentance = [@"" mutableCopy];
    
    for (int a = 0; a < countArray; a++) {
        NSMutableString *tempWord = [@"" mutableCopy];
        //NSLog(@"PRINT: [%i] : %@", a, array[a]);
        tempWord = [[array[a] wordByPigLatinization] mutableCopy];
        //NSLog(@"PRINT: [%i] : %@", a, tempWord);
        tempSentance = [[tempSentance stringByAppendingString:tempWord] mutableCopy];
        tempSentance = [[tempSentance stringByAppendingString:@" "] mutableCopy];
    }

    return tempSentance;
}

@end
