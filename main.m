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
        
        //CONSONTANT ARRAYS
        NSArray *twoLetter = @[@"sm",@"sn",@"st",@"sw",@"sk",@"sl",@"sp",@"dw",@"tw",@"th",@"sp",@"dr",@"tr",@"qu",@"cr",@"cl",@"pr",@"fr",@"br",@"gr",@"pl",@"fl",@"bl",@"gl"];
        NSArray *threeLetter = @[@"shr",@"thr",@"thw",@"sph",@"spl",@"spr",@"str",@"scr",@"squ"];
        
        NSMutableString *finalString = [@"" mutableCopy];
        NSMutableString *userInput = [@"That'll" mutableCopy];
        NSMutableString *searchString = [@"th" mutableCopy];
        NSMutableString *userInputSentence = [@"This'll be our f'orst T'aste" mutableCopy];
        
        //        PigLatin *pigword = [[PigLatin alloc] init];
        //        //WORD TEST
        //        userInput = [[pigword makePigLatin:userInput] mutableCopy];
        //        NSLog(@"WORD TEST: %@", userInput);
        //        //SENTANCE TEST
        //        finalString = [[pigword makePigLatinSentence:userInputSentence] mutableCopy];
        //        NSLog(@"SENTENCE TEST: %@", finalString);
        //        // TRICK TO REMOVE ALL SPACES FROM A SENTENCE BEOFRE TOSSING INTO ARRAY
        //        // https://stackoverflow.com/questions/4814641/how-to-separate-string-by-space-using-objective-c
        //
        //        //WORD TEST WITH CATEGORY --  WORKS
        //        [userInput wordByPigLatinization];
        //        NSLog(@"CATEGORY TEST; WORD: %@", userInput);
        //
        //        //SENTENCE TEST WITH CATEGORY
        //        userInputSentence = [[userInputSentence stringByPigLatinization] mutableCopy];
        //        NSLog(@"CATEGORY TEST: SENTENCT: %@", userInputSentence);
        
        //        NEXT STEP IS MAKING A CONSONANT DICTIONARY AND USING TO CHECK WORDS FOR themeBadTextColorErr
        //        https://www.sltinfo.com/syllables-and-clusters/
        
        // first search a string for just "Th"
        // return that as a test.
        // then copy that off
        // then append that to the end
        
        // then make a dictionary of all 'starting' consonants
        // then use prev function/block to search string for starting constanont; rip off; append to end; then add "ay"
        
        // use above code to modify 'string return piglat'
        
        //        NSString *string = @"lorem ipsum dolor sit amet";
        //        NSLog(@"TEST: %@", string);
        //        NSRange range = [string rangeOfString:@"ipsum"];
        //        // {.location=6, .length=5}
        //        NSString *substring = [string substringWithRange:range];
        //        NSLog(@"TEST: %@", substring);
        //        // @"ipsum"
        
        //        NSRange rangeTest = [userInput rangeOfString:searchString];
        //
        //
        //        NSMutableString *substring2 = [[userInput substringWithRange:rangeTest] mutableCopy];
        //
        //        NSLog(@"TEST: %@", substring2);
        
        userInput = [[userInput lowercaseString] mutableCopy]; // takes userInput and drops it to lowercase
        
        NSRange rangeTest = [userInput rangeOfString:searchString];
        //        NSRange range = NSMakeRange(0, 1);
        NSMutableString *firstPart = [@"" mutableCopy];
        NSLog(@"firstPart: %@", firstPart);
        userInput = [[userInput componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]] componentsJoinedByString:@""];
        //NSLog(@"userInput PUNC REMOVED: %@", userInput);
        // this finds "Th" (consonant" and removes from front... puts on end... adds "ay" ...
        
        // first take userInput; go through "three letter" consonant array
        
        for (int a = 0; a < [threeLetter count]; a++) {
            
            if ([userInput rangeOfString:threeLetter[a]].location != NSNotFound) {
                NSLog(@"three letter found %@", threeLetter[a]);
            }
        }
        
//        NSString *string = @"hello bla bla";
//        if ([string rangeOfString:@"bla"].location == NSNotFound) {
//            NSLog(@"string does not contain bla");
//        } else {
//            NSLog(@"string contains bla!");
//        }
        
        firstPart = [[searchString substringWithRange:rangeTest] mutableCopy];
        //NSLog(@"substringWithRange: firstPart %@", firstPart);
        
        userInput = [[userInput stringByReplacingCharactersInRange:rangeTest withString:@""] mutableCopy];
        //NSLog(@"stringByReplacingCharactersInRange: %@", userInput);
        userInput = [[userInput stringByAppendingString:firstPart] mutableCopy];
        //NSLog(@"stringByAppendingString: %@", userInput);
        firstPart = [[userInput stringByAppendingString:@"ay"] mutableCopy];
        //NSLog(@"stringByAppendingString: %@", firstPart);
        

    }
    return 0;
}



