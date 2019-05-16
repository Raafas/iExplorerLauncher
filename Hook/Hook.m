//
//  Hook.m
//  Hook
//
//  Created by Rafael Leandro on 5/16/19.
//  Copyright © 2019 Rafa. All rights reserved.
//

#import "Hook.h"
#import <objc/runtime.h>

@implementation Hook
void exchangeInstanceMethod(Class class, SEL originalSelector, SEL newSelector) {
	Method originalMethod = class_getInstanceMethod(class, originalSelector);
	Method newMethod = class_getInstanceMethod(class, newSelector);
	method_exchangeImplementations(originalMethod, newMethod);
}

void exchangeClassMethod(Class class, SEL originalSelector, SEL newSelector) {
	Method originalMethod = class_getClassMethod(class, originalSelector);
	Method newMethod = class_getClassMethod(class, newSelector);
	method_exchangeImplementations(originalMethod, newMethod);
}

static void __attribute__((constructor)) initialize(void) {
	@autoreleasepool {
		exchangeClassMethod(NSClassFromString(@"IERegistrationManager"), NSSelectorFromString(@"figureOutKeyType:"), NSSelectorFromString(@"raafasfigureOutKeyType:"));
	}
}

@end

@implementation NSObject (some)
- (int)raafasfigureOutKeyType:(id)arg1 {
	return 1;
}

@end
