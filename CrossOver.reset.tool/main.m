//
//  main.m
//  CrossOver.reset.tool
//
//  Created by sma11case on 2021/7/19.
//  Copyright © 2021 none. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *f1 = [NSString stringWithFormat:@"%@/Library/Preferences/com.codeweavers.CrossOver.plist", NSHomeDirectory()];
        NSMutableDictionary *t1 = [NSMutableDictionary dictionaryWithContentsOfFile:f1];
        NSDate *old = t1[@"FirstRunDate"];
        NSDate *date = [NSDate date];
        t1[@"FirstRunDate"] = date;
        BOOL r1 = [t1 writeToFile:f1 atomically:YES];
        printf("[INFO] old: %s ==> to: %s\n", old.description.UTF8String, date.description.UTF8String);
        
        if (r1)
        {
            t1 = [NSMutableDictionary dictionaryWithContentsOfFile:f1];
            old = t1[@"FirstRunDate"];
            
            if ((uint64_t)old.timeIntervalSince1970 == (uint64_t)date.timeIntervalSince1970) printf("[INFO] update success.\n");
        }
        else
        {
            printf("[ERROR] update failed, write file error.\n");
        }
        
        usleep(1);
    }
    return 0;
}
