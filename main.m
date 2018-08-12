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
//        NSMutableString *userInput1 = [@"Before" mutableCopy];
//        NSMutableString *userInputSentence1 = [@"      This'll        be our f'orst            T'aste" mutableCopy];
//        PigLatin *pigTest = [[PigLatin alloc] init];
//        NSLog(@"WORD TEST    ::%@", [pigTest makePigLatin:userInput1]);
//        NSLog(@"SENTENCE TEST::%@", [pigTest makePigLatinSentence:userInputSentence1]);

        
        //NSMutableString *userInput2 = [@"BEfore" mutableCopy];
        //NSLog(@"USER INPUT WORD:: %@", [userInput2 wordByPigLatinization]);
        
        NSMutableString *userInputSentence2 = [@"      This'll        be our f'orst            T'aste" mutableCopy];
        NSLog(@"USER INPUT SENTEANCE:: %@", [userInputSentence2 stringByPigLatinization]);
        

        
        
    }
    return 0;
}



