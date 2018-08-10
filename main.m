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
        
        NSMutableString *userInput = [@"This" mutableCopy];
//        NSMutableString *firstPartPigWord = [@"" mutableCopy];
        //NSRange range = NSMakeRange(0, 1); // ONLY GRABBING FIRST LETTER
        
        PigLatin *pigword = [[PigLatin alloc] init];
        
        userInput = [pigword makePigLatin:userInput];
        NSLog(@"Final: %@", userInput);
        
//        firstPartPigWord = [[userInput substringWithRange:NSMakeRange(0, 1)] mutableCopy];
//        NSLog(@"UserInput: %@", userInput);
//        NSLog(@"firstPartPigWord: %@", firstPartPigWord);
//        userInput = [[userInput stringByReplacingCharactersInRange:range withString:@""] mutableCopy];
//        [userInput appendString:firstPartPigWord];
//
//        NSLog(@"UserInput: %@", userInput);
    }
    return 0;
}



