//
//  main.m
//  pigLatin
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PigLatin.h"
#import "NSString+PigLatined.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
//        NSMutableString *finalString = [@"" mutableCopy];
        NSMutableString *userInput = [@"Thwip'd" mutableCopy];
//        NSMutableString *searchString = [@"th" mutableCopy];
        NSMutableString *userInputSentence = [@"This'll be our f'orst T'aste" mutableCopy];
        userInput = [[userInput lowercaseString] mutableCopy]; // takes userInput and drops it to lowercase
        userInput = [[userInput componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
        PigLatin *pigTest = [[PigLatin alloc] init];
        
        NSLog(@"WORD TEST    ::%@", [pigTest makePigLatin:userInput]);
        
        NSLog(@"SENTENCE TEST::%@", [pigTest makePigLatinSentence:userInputSentence]);

        

        
    }
    return 0;
}



