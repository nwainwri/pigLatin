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
    NSRange range = NSMakeRange(0, 1);
    NSMutableString *firstPart = [@"" mutableCopy];
    NSMutableString *word = [self mutableCopy];
    word = [[[word componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""] mutableCopy];
    firstPart = [[word substringWithRange:NSMakeRange(0, 1)] mutableCopy];
    word = [[word stringByReplacingCharactersInRange:range withString:@""] mutableCopy];
    word = [[word stringByAppendingString:firstPart] mutableCopy];
    word = [[word stringByAppendingString:@"ay"] mutableCopy];
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
