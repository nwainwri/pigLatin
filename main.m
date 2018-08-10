//
//  main.m
//  pigLatin
//
//  Created by Nathan Wainwright on 2018-08-10.
//  Copyright © 2018 Nathan Wainwright. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PigLatin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSMutableString *finalString = [@"" mutableCopy];
        
        NSMutableString *userInput = [@"That'll" mutableCopy];
        
        NSMutableString *userInputSentence = [@"This'll be our f'orst T'aste" mutableCopy];
        
        PigLatin *pigword = [[PigLatin alloc] init];

        //WORD TEST
        userInput = [[pigword makePigLatin:userInput] mutableCopy];
        NSLog(@"Final Word Test: %@", userInput);
        
        //SENTANCE TEST
        finalString = [[pigword makePigLatinSentence:userInputSentence] mutableCopy];
        
        NSLog(@"FINAL: %@", finalString);
        
        // TRICK TO REMOVE ALL SPACES FROM A SENTENCE BEOFRE TOSSING INTO ARRAY
        // https://stackoverflow.com/questions/4814641/how-to-separate-string-by-space-using-objective-c

    }
    return 0;
}



