#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <mach-o/dyld.h>
#import "TSUtil.h"
#import "SBFApplication.h"

BOOL isJailbroken(void);

int main (int __unused argc, char* argv[]) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* TaurinePath = [NSString stringWithFormat:@"%@/Taurine", [[SBFApplication alloc] initWithApplicationBundleIdentifier: @"org.coolstar.taurine"].bundleURL.path];
    if (!isJailbroken() && [fileManager fileExistsAtPath: @"/var/mobile/.untether"]) {
        sleep(45);
        spawnRoot(TaurinePath, @[@"jailbreak"]);
    }
}

BOOL isJailbroken(void) {
    for (int i = 0; i <= _dyld_image_count(); i++) {
        char* name = (char*)_dyld_get_image_name(i);
        if (name) {
            if (strcmp(name, "/usr/lib/pspawn_payload-stg2.dylib") == 0) {
                return true;
            }
        }
    }
    return false;
}