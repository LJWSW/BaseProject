//
//  Enumeration.h
//  HuMaShiTin
//
//  Created by 吴福增 on 2017/6/8.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//  全局枚举

#ifndef Enumeration_h
#define Enumeration_h

//当status=0时，说明调用成功
//当status=-97时，说明有系统级异常发生
//当status=-96时，说明有token不合法、
//当status=-95时，说明有token过期、
//当status=-10时，说明有业务级异常发生
//当status=-1~-9时，说明有业务级逻辑错误发生 msg可以直接显示

/**
    服务器错误码
 */
typedef enum : NSUInteger
{    
    FZErorCodeTypeSystemException    = -97,//当status=-97时，说明有系统级异常发生
    FZErorCodeTypeTokenIllegal       = 96,//当status=-96时，说明有token不合法、
    FZErorCodeTypeTokenOverdue       = -95,//当status=-95时，说明有token过期、
    FZErorCodeTypeBusinessExceptions = -10,//当status=-10时，说明有业务级异常发生
    FZErorCodeTypeSuccess            = 0,//当status=0时，说明调用成功
    FZErorCodeTypeStatus1            = 1,//当status=-1~-9时，说明有业务级逻辑错误发生 msg可以直接显示
    FZErorCodeTypeStatus2,
    FZErorCodeTypeStatus3,
    FZErorCodeTypeStatus4,
    FZErorCodeTypeStatus5,
    FZErorCodeTypeStatus6,
    FZErorCodeTypeStatus7,
    FZErorCodeTypeStatus8,
    FZErorCodeTypeStatus9,

} FZErorCodeType;











#endif /* Enumeration_h */
