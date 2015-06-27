//
//  petKnowDefine.h
//  
//
//  Created by 孟钰丰 on 15/6/12.
//
//

#ifndef _petKnowDefine_h
#define _petKnowDefine_h

//接口信息
//--------------------------------------------------
#define NETWORK_GET_LOGIN_A @"UserLogin"                        //登陆
#define NETWORK_GET_USEREXTINFO_D @"GetUserExtInfo"             //获得医生（用户）扩展信息





//常用宏
//--------------------------------------------------
#define ACCOUNT_TOKEN [[NSUserDefaults standardUserDefaults] objectForKey:@"accountToken"]
#define COLOR(a,b,c,d) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:(d)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
