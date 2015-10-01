//
//  USEparse.h
//  UserLoginAndRegistration
//
//  Created by inv obr on 4/09/15.
//  Copyright (c) 2015 inv obr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface USEparse : NSObject

-(void)parse:(NSDictionary *)datos path:(NSString *)url httpMethod:(NSString *) method completion:(void(^)(NSDictionary *response)) block;

@end
