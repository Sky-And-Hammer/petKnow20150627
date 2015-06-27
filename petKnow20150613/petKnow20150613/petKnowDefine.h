//
//  petKnowDefine.h
//  
//
//  Created by 孟钰丰 on 15/6/12.
//
//

#ifndef _petKnowDefine_h
#define _petKnowDefine_h




#define COLOR(a,b,c,d) [UIColor colorWithRed:(a)/255.0 green:(b)/255.0 blue:(c)/255.0 alpha:(d)]
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif
