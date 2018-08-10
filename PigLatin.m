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
    
    word = [[word componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];

    firstPart = [[word substringWithRange:NSMakeRange(0, 1)] mutableCopy];
    word = [[word stringByReplacingCharactersInRange:range withString:@""] mutableCopy];
    word = [word stringByAppendingString:firstPart];
    word = [word stringByAppendingString:@"ay"];

    return word;
}

- (NSString *)makePigLatinSentence:(NSString *)sentance{
    NSArray *array = [sentance componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    array = [array filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF != ''"]]; // removes extra spaces; see below URL
    int countArray = [array count];
    
    NSMutableString *tempSentance = [@"" mutableCopy];
    
    for (int a = 0; a < countArray; a++) {
        NSMutableString *tempWord = [@"" mutableCopy];
        //NSLog(@"PRINT: [%i] : %@", a, array[a]);
        tempWord = [[self makePigLatin:array[a]] mutableCopy];
        //NSLog(@"PRINT: [%i] : %@", a, tempWord);
        tempSentance = [[tempSentance stringByAppendingString:tempWord] mutableCopy];
        tempSentance = [[tempSentance stringByAppendingString:@" "] mutableCopy];
    }
    //NSLog(@"Sentenace: %@", tempSentance);
    return tempSentance;
}



@end
