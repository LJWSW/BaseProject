//
//  UIColor+WFZ_Extension.m
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import "UIColor+WFZ_Extension.h"

/**
 *  ColorSense是使有工作的Xcode的插件UIColor（和NSColor）更直观。
 *
 *  限制：
 *
 *      它仅适用于不变的颜色，像[UIColor colorWithWhite:foo * bar + 1 alpha:baz]将无法工作。
 *      只有RGB（ colorWithRed:green:blue:alpha:），灰度（colorWithWhite:alpha:），并命名为颜色（redColor...）的时刻（无HSB或CMYK）的支持。
 */

@implementation UIColor (WFZ_Extension)
// See http://blog.alexedge.co.uk/speeding-up-uicolor-categories/
/**
 *  宏的定义
 *
 *  @param COLOR_NAME 颜色名
 *  @param RED        红色
 *  @param GREEN      绿色
 *  @param BLUE       蓝色
 *
 *  @return color
 */

/**
 *  宏的实现
 *
 *  + (UIColor *)COLOR_NAME{
 *      static UIColor* COLOR_NAME;
 *      static dispatch_once_t _onceToken;
 *      dispatch_once(&_onceToken, ^{
 *          COLOR_NAME = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
 *      });
 *      return COLOR_NAME;
 *  }
 *
 */


/**
 *  十六进制 颜色
 *
 *  @param hexStr 十六进制的字符串
 *  @param alpha  透明头
 *
 *  @return color
 */
+(UIColor*)colorWithRGBHex:(NSString*)hexStr andAlpha:(CGFloat)alpha
{
    
    // 创建字符串的扫描对象
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    // 判断扫描对象是否是 16 进制  若不是直接返回
    unsigned hexNum;
    //扫描十六进制无符整型，unsigned int指针指向的地址值为 扫描到的值，包含溢出时的UINT_MAX。
    if (![scanner scanHexInt:&hexNum])
    {
        return[UIColor clearColor];
    }
    
    int r = (hexNum >> 16) & 0xFF;
    int g = (hexNum >> 8) & 0xFF;
    int b = (hexNum) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:alpha];
}



/**
 *  RGB 创建颜色 【宏定义】
 *
 *  @param RGB_COLOR_NAME 方法名
 *  @param RED            红色
 *  @param GREEN          绿色
 *  @param BLUE           蓝色
 *  @param AlPHA          透明度
 *
 *  @return color
 */
#define WFZRGBColorImplement(RGB_COLOR_NAME,RED,GREEN,BLUE,AlPHA)  \
+ (UIColor *)RGB_COLOR_NAME{                               \
static UIColor* RGB_COLOR_NAME##_rgbColor;             \
static dispatch_once_t RGB_COLOR_NAME##_rgbOnceToken;  \
\
dispatch_once(&RGB_COLOR_NAME##_rgbOnceToken, ^{       \
RGB_COLOR_NAME##_rgbColor = [UIColor colorWithRed:RED/ 255.0f green:GREEN/ 255.0f blue:BLUE/ 255.0f alpha:AlPHA];  \
});                                                    \
\
return RGB_COLOR_NAME##_rgbColor;                      \
}


/**
 *  HexColor 创建颜色 【宏定义】
 *
 *  @param HEX_COLOR_NAME 方法名
 *  @param HexStr         十六进制字符串
 *  @param Alpha          透明度
 *
 *  @return color
 */
#define WFZRGBHexColorImplement(HEX_COLOR_NAME,HexStr,Alpha)                    \
+ (UIColor *)HEX_COLOR_NAME{                                                \
static UIColor* HEX_COLOR_NAME##_hexColor;                              \
static dispatch_once_t HEX_COLOR_NAME##_hexOnceToken;                   \
\
dispatch_once(&HEX_COLOR_NAME##_hexOnceToken, ^{                        \
HEX_COLOR_NAME##_hexColor = [UIColor colorWithRGBHex:HexStr andAlpha:Alpha];\
});                                                                     \
\
return HEX_COLOR_NAME##_hexColor;                                       \
}



/**
 *  黑色 0	0	0	#000000
 */
WFZRGBHexColorImplement(heiColor, @"0x000000", 1.0)
/**
 *  象牙黑 41	 36	33	#292421
 */
WFZRGBHexColorImplement(xiangYaHeiColor, @"0x292421", 1.0)
/**
 *  灰色	192	192	192	#C0C0C0
 */
WFZRGBHexColorImplement(huiColor, @"0xC0C0C0", 1.0)
/**
 *  冷灰色 128 138 135	#808A87
 */
WFZRGBHexColorImplement(lengHuiColor, @"0x808A87", 1.0)
/**
 *  石板灰 112 128 105	#708069
 */
WFZRGBHexColorImplement(shiBanHuiColor, @"0x708069", 1.0)
/**
 *  暖灰色	128	128	105	#808069
 */
WFZRGBHexColorImplement(nuanHuiColor, @"0x808069", 1.0)
/**
 *  白色	225	225	225	#FFFFFF
 */
WFZRGBHexColorImplement(baiColor, @"0xFFFFFF", 1.0)
/**
 *  古董白	250	235	215	#FAEBD7
 */
WFZRGBHexColorImplement(guDongBaiColor, @"0xFAEBD7", 1.0)
/**
 *  蓝白 【天蓝色 偏白】	240	255	255	#F0FFFF
 */
WFZRGBHexColorImplement(lanBaiColor, @"0xF0FFFF", 1.0)
/**
 *  白烟	245	245	245	#F5F5F5
 */
WFZRGBHexColorImplement(baiYanColor, @"0xF5F5F5", 1.0)
/**
 *  白杏仁	255	235	205	#FFFFCD
 */
WFZRGBHexColorImplement(baiXingRenColor, @"0xFFFFCD", 1.0)
/**
 *  cornsilk	255	248	220	#FFF8DC
 */
WFZRGBHexColorImplement(cornsilkColor, @"0xFFF8DC", 1.0)
/**
 *  蛋壳色	252	230	201	#FCE6C9
 */
WFZRGBHexColorImplement(danKeColor, @"0xFCE6C9", 1.0)
/**
 *  花白	255	250	240	#FFFAF0
 */
WFZRGBHexColorImplement(huaBaiColor, @"0xFFFAF0", 1.0)
/**
 *  gainsboro	220	220	220	#DCDCDC
 */
WFZRGBHexColorImplement(gainsboroColor, @"0xDCDCDC", 1.0)
/**
 *  ghostWhite	248	248	255	#F8F8FF
 */
WFZRGBHexColorImplement(ghostWhiteColor, @"0xF8F8FF", 1.0)
/**
 *  蜜露橙	240	255	240	#F0FFF0
 */
WFZRGBHexColorImplement(miLuChengColor, @"0xF0FFF0", 1.0)
/**
 *  象牙白	250	255	240	#FAFFF0
 */
WFZRGBHexColorImplement(xiangYaBaiColor, @"0xFAFFF0", 1.0)
/**
 *  亚麻色	250	240	230	#FAF0E6
 */
WFZRGBHexColorImplement(yaMaColor, @"0xFAF0E6", 1.0)
/**
 *  navajoWhite	255	222	173	#FFDEAD
 */
WFZRGBHexColorImplement(navajoWhiteColor, @"0xFFDEAD", 1.0)
/**
 *  old lace	253	245	230	#FDF5E6
 */
WFZRGBHexColorImplement(oldLaceColor, @"0xFDF5E6", 1.0)
/**
 *  海贝壳色	255	245	238	#FFF5EE
 */
WFZRGBHexColorImplement(haiBeKeColor, @"0xFFF5EE", 1.0)
/**
 *  雪白	255	250	250	#FFFAFA
 */
WFZRGBHexColorImplement(xueBaiColor, @"0xFFFAFA", 1.0)
/**
 *  红色	255	0	0	#FF0000
 */
WFZRGBHexColorImplement(hongColor, @"0xFF0000", 1.0)
/**
 *  砖红	156	102	31	#9C661F
 */
WFZRGBHexColorImplement(zhuanHongColor, @"0x9C661F", 1.0)
/**
 *  镉红	227	23	13	#E3170D
 */
WFZRGBHexColorImplement(geHongColor, @"0xE3170D", 1.0)
/**
 *  珊瑚色	255	127	80	#FF7F50
 */
WFZRGBHexColorImplement(shanHuColor, @"0xFF7F50", 1.0)
/**
 *  耐火砖红	178	34	34	#B22222
 */
WFZRGBHexColorImplement(naiHuoZhuanHongColor, @"0xB22222", 1.0)
/**
 *  印度红	176	23	31	#B0171F
 */
WFZRGBHexColorImplement(yinDuHongColor, @"0xB0171F", 1.0)
/**
 *  栗色	176	48	96	#B03060
 */
WFZRGBHexColorImplement(liColor, @"0xB03060", 1.0)
/**
 *  粉红	255	192	203	#FFC0CB
 */
WFZRGBHexColorImplement(fenHongColor, @"0xFFC0CB", 1.0)
/**
 *  草莓色	135	38	87	#872657
 */
WFZRGBHexColorImplement(caoMeiColor, @"0x872657", 1.0)
/**
 *  橙红色	250	128	114	#FA8072
 */
WFZRGBHexColorImplement(chengHongColor, @"0xFA8072", 1.0)
/**
 *  蕃茄红	255	99	71	#FF6347
 */
WFZRGBHexColorImplement(fanQieColor, @"0xFF6347", 1.0)
/**
 *  桔红	255	69	0	#FF4500
 */
WFZRGBHexColorImplement(juHongColor, @"0xFF4500", 1.0)
/**
 *  深红色	255	0	255	#FF00FF
 */
WFZRGBHexColorImplement(shengHongColor, @"0xFF00FF", 1.0)
/**
 *  浅灰蓝色	176	224	230	#B0E0E6
 */
WFZRGBHexColorImplement(yanLanColor, @"0xB0E0E6", 1.0)
/**
 *  品蓝	65	105	225	#4169E1
 */
WFZRGBHexColorImplement(pinLanColor, @"0x4169E1", 1.0)
/**
 *  石板蓝	106	90	205	#6A5ACD
 */
WFZRGBHexColorImplement(shiBanLanColor, @"0x6A5ACD", 1.0)
/**
 *  天蓝	135	206	235	#87CEEB
 */
WFZRGBHexColorImplement(tianLanColor, @"0x87CEEB", 1.0)
/**
 *  青色	0	255	255	#00FFFF
 */
WFZRGBHexColorImplement(qingColor, @"0x00FFFF", 1.0)
/**
 *  绿土	56	94	15	#385E0F
 */
WFZRGBHexColorImplement(lvTuColor, @"0x385E0F", 1.0)
/**
 *  靛青	8	46	84	#082E54
 */
WFZRGBHexColorImplement(dianQingColor, @"0x082E54", 1.0)
/**
 *  碧绿色	127	255	212	#7FFFD4
 */
WFZRGBHexColorImplement(biLvColor, @"7FFFD4", 1.0)
/**
 *  青绿色	64	224	208	#40E0D0
 */
WFZRGBHexColorImplement(qingLvColor, @"0x40E0D0", 1.0)
/**
 *  绿色	0	255	0	#00FF00
 */
WFZRGBHexColorImplement(lvColor, @"0x00FF00", 1.0)
/**
 *  黄绿色	127	255	0	#7FFF00
 */
WFZRGBHexColorImplement(huangLvColor, @"0x7FFF00", 1.0)
/**
 *  钴绿色	61	145	64	#3D9140
 */
WFZRGBHexColorImplement(gulvColor, @"0x3D9140", 1.0)
/**
 *  翠绿色	0	201	87	#00C957
 */
WFZRGBHexColorImplement(cuiLvColor, @"0x00C957", 1.0)
/**
 *  土耳其玉色	0	199	140	#00C78C
 */
WFZRGBHexColorImplement(tuErQiYuColor, @"0x00C78C", 1.0)
/**
 *  森林绿	34	139	34	#228B22
 */
WFZRGBHexColorImplement(senLinLvColor, @"0x228B22", 1.0)
/**
 *  草地绿	124	252	0	#7CFC00
 */
WFZRGBHexColorImplement(caoDiLvColor, @"0x7CFC00", 1.0)
/**
 *  酸橙绿	50	205	50	#32CD32
 */
WFZRGBHexColorImplement(suanChengColor, @"0x32CD32", 1.0)
/**
 *  薄荷色	189	252	201	#BDFCC9
 */
WFZRGBHexColorImplement(boHeColor, @"0xBDFCC9", 1.0)
/**
 *  草绿色	107	142	35	#6B8E23
 */
WFZRGBHexColorImplement(caoLvColor, @"0x6B8E23", 1.0)
/**
 *  暗绿色	48	128	20	#308014
 */
WFZRGBHexColorImplement(anLvColor, @"0x308014", 1.0)
/**
 *  海绿色	46	139	87	#2E8B57
 */
WFZRGBHexColorImplement(haiLvColor, @"0x2E8B57", 1.0)
/**
 *  嫩绿色	0	255	127	#00FF7F
 */
WFZRGBHexColorImplement(nenLvColor, @"0x00FF7F", 1.0)
/**
 *  紫色	160	32	240	#A020F0
 */
WFZRGBHexColorImplement(ziColor, @"0xA020F0", 1.0)
/**
 *  紫罗蓝色	138	43	226	#8A2BE2
 */
WFZRGBHexColorImplement(ziLuoLanColor, @"0x8A2BE2", 1.0)
/**
 *  jasoa	160	102	211	#A066D3
 */
WFZRGBHexColorImplement(jasoaColor, @"0xA066D3", 1.0)
/**
 *  湖紫色	153	51	250	#9933FA
 */
WFZRGBHexColorImplement(huZiColor, @"0x9933FA", 1.0)
/**
 *  淡紫色	218	112	214	#DA70D6
 */
WFZRGBHexColorImplement(tanZiColor, @"0xDA70D6", 1.0)
/**
 *  梅红色	221	160	221	#DDA0DD
 */
WFZRGBHexColorImplement(meiHongColor, @"0xDDA0DD", 1.0)
/**
 *  黄色	255	255	0	#FFFF00
 */
WFZRGBHexColorImplement(huangColor, @"0xFFFF00", 1.0)
/**
 *  香蕉色	227	207	87	#E3CF57
 */
WFZRGBHexColorImplement(xiangJiaoColor, @"0xE3CF57", 1.0)
/**
 *  镉黄	255	153	18	#FF9912
 */
WFZRGBHexColorImplement(geHuangColor, @"0xFF9912", 1.0)
/**
 *  dougello	235	142	85	#EB8E55
 */
WFZRGBHexColorImplement(dougelloColor, @"0xEB8E55", 1.0)
/**
 *  forum gold	255	227	132	#FFE384
 */
WFZRGBHexColorImplement(forumGoldColor, @"0xFFE384", 1.0)
/**
 *  金黄色	255	215	0	#FFD700
 */
WFZRGBHexColorImplement(jinHuangColor, @"0xFFD700", 1.0)
/**
 *  黄花色	218	165	105	#DAA569
 */
WFZRGBHexColorImplement(huangHuaColor, @"0xDAA569", 1.0)
/**
 *  瓜色	227	168	105	#E3A869
 */
WFZRGBHexColorImplement(guaColor, @"0xE3A869", 1.0)
/**
 *  橙色	255	97	0	#FF6100
 */
WFZRGBHexColorImplement(chengColor, @"0xFF6100", 1.0)
/**
 *  镉橙	255	97	3	#FF6103
 */
WFZRGBHexColorImplement(geChengColor, @"0xFF6103", 1.0)
/**
 *  胡萝卜色	237	145	33	#ED9121
 */
WFZRGBHexColorImplement(huLuoBoColor, @"0xED9121", 1.0)
/**
 *  桔黄	255	128	0	#FF8000
 */
WFZRGBHexColorImplement(juHuangColor, @"0xFF8000", 1.0)
/**
 *  淡黄色	245	222	179	#F5DEB3
 */
WFZRGBHexColorImplement(tanHuangColor, @"0xF5DEB3", 1.0)
/**
 *  棕色	128	42	42	#802A2A
 */
WFZRGBHexColorImplement(zongColor, @"0x802A2A", 1.0)
/**
 *  米色	163	148	128	#A39480
 */
WFZRGBHexColorImplement(miColor, @"0xA39480", 1.0)
/**
 *  锻浓黄土色	138	54	15	#8A360F
 */
WFZRGBHexColorImplement(duanNongHuangTuColor, @"0x8A360F", 1.0)
/**
 *  锻棕土色	135	51	36	#873324
 */
WFZRGBHexColorImplement(duanZongTuColor, @"0x873324", 1.0)
/**
 *  巧克力色	210	105	30	#D2691E
 */
WFZRGBHexColorImplement(qiaoKeLiColor, @"0xD2691E", 1.0)
/**
 *  肉色	255	125	64	#FF7D40
 */
WFZRGBHexColorImplement(rouColor, @"0xFF7D40", 1.0)
/**
 *  黄褐色	240	230	140	#F0E68C
 */
WFZRGBHexColorImplement(huangJeColor, @"0xF0E68C", 1.0)
/**
 *  玫瑰红	188	143	143	#BC8F8F
 */
WFZRGBHexColorImplement(meiGuiColor, @"0xBC8F8F", 1.0)
/**
 *  肖贡土色	199	97	20	#C76114
 */
WFZRGBHexColorImplement(xiaoGongTuColor, @"0xC76114", 1.0)

/**
 *  标土棕	115	74	18	#734A12
 */
WFZRGBHexColorImplement(biaoTuColor, @"0x734A12", 1.0)
/**
 *  乌贼墨棕	94	38	18	#5E2612
 */
WFZRGBHexColorImplement(wuZuiMoZongColor, @"0x5E2612", 1.0)
/**
 *  赫色	160	82	45	#A0522D
 */
WFZRGBHexColorImplement(heColor, @"0xA0522D", 1.0)
/**
 *  马棕色	139	69	19	#8B4513
 */
WFZRGBHexColorImplement(maZongColor, @"0x8B4513", 1.0)
/**
 *  沙棕色	244	164	96	#F4A460
 */
WFZRGBHexColorImplement(shaZongColor, @"0xF4A460", 1.0)
/**
 *  棕褐色	210	180	140	#D2B48C
 */
WFZRGBHexColorImplement(zongHeColor, @"0xD2B48C", 1.0)
/**
 *  蓝色	0	0	255	#0000FF
 */
WFZRGBHexColorImplement(lanColor, @"0x0000FF", 1.0)
/**
 *  钴色	61	89	171	#3D59AB
 */
WFZRGBHexColorImplement(guColor, @"0x3D59AB", 1.0)
/**
 *  dodger blue	30	144	255	#1E90FF
 */
WFZRGBHexColorImplement(dodgerBlueColor, @"0x1E90FF", 1.0)
/**
 *  jackie blue	11	23	70	#0B1746
 */
WFZRGBHexColorImplement(jackieBlueColor, @"0x0B1746", 1.0)
/**
 *  锰蓝	3	168	158	#03A89E
 */
WFZRGBHexColorImplement(mengLanColor, @"0x03A89E", 1.0)
/**
 *  深蓝色	25	25	112	#191970
 */
WFZRGBHexColorImplement(shenLanColor, @"0x191970", 1.0)
/**
 *  孔雀蓝	51	161	201	#33A1C9
 */
WFZRGBHexColorImplement(kongQueLanColor, @"0x33A1C9", 1.0)


@end
