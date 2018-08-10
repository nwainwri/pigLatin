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
        
        NSMutableString *finalString = [@"" mutableCopy];
        NSMutableString *userInput = [@"That'll" mutableCopy];
        NSMutableString *userInputSentence = [@"This'll be our f'orst T'aste" mutableCopy];
        
        PigLatin *pigword = [[PigLatin alloc] init];
        //WORD TEST
        userInput = [[pigword makePigLatin:userInput] mutableCopy];
        NSLog(@"WORD TEST: %@", userInput);
        //SENTANCE TEST
        finalString = [[pigword makePigLatinSentence:userInputSentence] mutableCopy];
        NSLog(@"SENTENCE TEST: %@", finalString);
        // TRICK TO REMOVE ALL SPACES FROM A SENTENCE BEOFRE TOSSING INTO ARRAY
        // https://stackoverflow.com/questions/4814641/how-to-separate-string-by-space-using-objective-c
        
        //WORD TEST WITH CATEGORY --  WORKS
        [userInput wordByPigLatinization];
        NSLog(@"CATEGORY TEST; WORD: %@", userInput);
        
        //SENTENCE TEST WITH CATEGORY
        userInputSentence = [[userInputSentence stringByPigLatinization] mutableCopy];
        NSLog(@"CATEGORY TEST: SENTENCT: %@", userInputSentence);
        
//        NEXT STEP IS MAKING A CONSONANT DICTIONARY AND USING TO CHECK WORDS FOR themeBadTextColorErr
//        https://www.sltinfo.com/syllables-and-clusters/

    }
    return 0;
}



