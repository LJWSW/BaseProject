//
//  UIColor+WFZ_Extension.h
//  BaseProject
//
//  Created by 吴福增 on 2017/1/20.
//  Copyright © 2017年 wufuzeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WFZ_Extension)
/**
 *  三原色 宏定义
 */
#define UIColorFromRGB(r,g,b)      [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define UIColorFromRGBA(r,g,b,a)   [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]


/**
 *  三原色 十六进制 宏定义
 *
 *  @param h 0xFFFFFF
 *  @param a 0~1
 *
 *  @return color
 */
#define UIColorFromHEX(h) [UIColor colorWithRed:((float)((h & 0xFF0000) >> 16))/255.0 \
green:((float)((h & 0xFF00) >> 8   ))/255.0 \
blue:((float)( h & 0xFF)           )/255.0 \
alpha:1.0]

#define UIColorFromHEXA(h,a) [UIColor colorWithRed:((float)((h & 0xFF0000) >> 16))/255.0 \
green:((float)((h & 0xFF00) >> 8   ))/255.0 \
blue:((float)( h & 0xFF)           )/255.0 \
alpha:a]

/**
 *  三原色 十六进制【字符串】 宏定义
 *
 *  @param hStr @"0xFFFFFF"
 *  @param a    0~1
 *
 *  @return color
 */
#define UIColorFromHEXStr(hStr)          [UIColor colorWithRGBHex:hStr andAlpha:1.0]
#define UIColorFromHEXStrA(hStr,a)       [UIColor colorWithRGBHex:hStr andAlpha:a]

/**
 *  随机色
 */
#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 \
green:arc4random_uniform(255)/255.0 \
blue:arc4random_uniform(255)/255.0 \
alpha:1.0]





/**
 *  十六进制 颜色
 *
 *  @param hexStr 十六进制的字符串
 *  @param alpha  透明头
 *
 *  @return color
 */
+(UIColor*)colorWithRGBHex:(NSString*)hexStr andAlpha:(CGFloat)alpha;

/**
 *  黑色 0	0	0	#000000
 */
+(UIColor*)heiColor;
/**
 *  象牙黑 41	 36	33	#292421
 */
+(UIColor*)xiangYaHeiColor;
/**
 *  灰色	192	192	192	#C0C0C0
 */
+(UIColor*)huiColor;

/**
 *  冷灰色 128 138 135	#808A87
 */
+(UIColor*)lengHuiColor;
/**
 *  石板灰 112 128 105	#708069
 */
+(UIColor*)shiBanHuiColor;
/**
 *  暖灰色	128	128	105	#808069
 */
+(UIColor*)nuanHuiColor;
/**
 *  白色	225	225	225	#FFFFFF
 */
+(UIColor*)baiColor;
/**
 *  古董白	250	235	215	#FAEBD7
 */
+(UIColor*)guDongBaiColor;
/**
 *  蓝白 【天蓝色 偏白】	240	255	255	#F0FFFF
 */
+(UIColor*)lanBaiColor;
/**
 *  白烟	245	245	245	#F5F5F5
 */
+(UIColor*)baiYanColor;
/**
 *  白杏仁	255	235	205	#FFFFCD
 */
+(UIColor*)baiXingRenColor;
/**
 *  cornsilk	255	248	220	#FFF8DC
 */
+(UIColor*)cornsilkColor;
/**
 *  蛋壳色	252	230	201	#FCE6C9
 */
+(UIColor*)danKeColor;
/**
 *  花白	255	250	240	#FFFAF0
 */
+(UIColor*)huaBaiColor;
/**
 *  gainsboro	220	220	220	#DCDCDC
 */
+(UIColor*)gainsboroColor;
/**
 *  ghostWhite	248	248	255	#F8F8FF
 */
+(UIColor*)ghostWhiteColor;
/**
 *  蜜露橙	240	255	240	#F0FFF0
 */
+(UIColor*)miLuChengColor;
/**
 *  象牙白	250	255	240	#FAFFF0
 */
+(UIColor*)xiangYaBaiColor;
/**
 *  亚麻色	250	240	230	#FAF0E6
 */
+(UIColor*)yaMaColor;
/**
 *  navajoWhite	255	222	173	#FFDEAD
 */
+(UIColor*)navajoWhiteColor;
/**
 *  old lace	253	245	230	#FDF5E6
 */
+(UIColor*)oldLaceColor;
/**
 *  海贝壳色	255	245	238	#FFF5EE
 */
+(UIColor*)haiBeKeColor;
/**
 *  雪白	255	250	250	#FFFAFA
 */
+(UIColor*)xueBaiColor;
/**
 *  红色	255	0	0	#FF0000
 */
+(UIColor*)hongColor;
/**
 *  砖红	156	102	31	#9C661F
 */
+(UIColor*)zhuanHongColor;
/**
 *  镉红	227	23	13	#E3170D
 */
+(UIColor*)geHongColor;
/**
 *  珊瑚色	255	127	80	#FF7F50
 */
+(UIColor*)shanHuColor;
/**
 *  耐火砖红	178	34	34	#B22222
 */
+(UIColor*)naiHuoZhuanHongColor;
/**
 *  印度红	176	23	31	#B0171F
 */
+(UIColor*)yinDuHongColor;
/**
 *  栗色	176	48	96	#B03060
 */
+(UIColor*)liColor;
/**
 *  粉红	255	192	203	#FFC0CB
 */
+(UIColor*)fenHongColor;
/**
 *  草莓色	135	38	87	#872657
 */
+(UIColor*)caoMeiColor;
/**
 *  橙红色	250	128	114	#FA8072
 */
+(UIColor*)chengHongColor;
/**
 *  蕃茄红	255	99	71	#FF6347
 */
+(UIColor*)fanQieColor;
/**
 *  桔红	255	69	0	#FF4500
 */
+(UIColor*)juHongColor;
/**
 *  深红色	255	0	255	#FF00FF
 */
+(UIColor*)shengHongColor;
/**
 *  浅灰蓝色	176	224	230	#B0E0E6
 */
+(UIColor*)yanLanColor;
/**
 *  品蓝	65	105	225	#4169E1
 */
+(UIColor*)pinLanColor;
/**
 *  石板蓝	106	90	205	#6A5ACD
 */
+(UIColor*)shiBanLanColor;
/**
 *  天蓝	135	206	235	#87CEEB
 */
+(UIColor*)tianLanColor;
/**
 *  青色	0	255	255	#00FFFF
 */
+(UIColor*)qingColor;
/**
 *  绿土	56	94	15	#385E0F
 */
+(UIColor*)lvTuColor;
/**
 *  靛青	8	46	84	#082E54
 */
+(UIColor*)dianQingColor;
/**
 *  碧绿色	127	255	212	#7FFFD4
 */
+(UIColor*)biLvColor;
/**
 *  青绿色	64	224	208	#40E0D0
 */
+(UIColor*)qingLvColor;
/**
 *  绿色	0	255	0	#00FF00
 */
+(UIColor*)lvColor;
/**
 *  黄绿色	127	255	0	#7FFF00
 */
+(UIColor*)huangLvColor;
/**
 *  钴绿色	61	145	64	#3D9140
 */
+(UIColor*)gulvColor;
/**
 *  翠绿色	0	201	87	#00C957
 */
+(UIColor*)cuiLvColor;
/**
 *  土耳其玉色	0	199	140	#00C78C
 */
+(UIColor*)tuErQiYuColor;

/**
 *  森林绿	34	139	34	#228B22
 */
+(UIColor*)senLinLvColor;
/**
 *  草地绿	124	252	0	#7CFC00
 */
+(UIColor*)caoDiLvColor;
/**
 *  酸橙绿	50	205	50	#32CD32
 */
+(UIColor*)suanChengColor;
/**
 *  薄荷色	189	252	201	#BDFCC9
 */
+(UIColor*)boHeColor;
/**
 *  草绿色	107	142	35	#6B8E23
 */
+(UIColor*)caoLvColor;
/**
 *  暗绿色	48	128	20	#308014
 */
+(UIColor*)anLvColor;
/**
 *  海绿色	46	139	87	#2E8B57
 */
+(UIColor*)haiLvColor;
/**
 *  嫩绿色	0	255	127	#00FF7F
 */
+(UIColor*)nenLvColor;
/**
 *  紫色	160	32	240	#A020F0
 */
+(UIColor*)ziColor;
/**
 *  紫罗蓝色	138	43	226	#8A2BE2
 */
+(UIColor*)ziLuoLanColor;
/**
 *  jasoa	160	102	211	#A066D3
 */
+(UIColor*)jasoaColor;
/**
 *  湖紫色	153	51	250	#9933FA
 */
+(UIColor*)huZiColor;
/**
 *  淡紫色	218	112	214	#DA70D6
 */
+(UIColor*)tanZiColor;
/**
 *  梅红色	221	160	221	#DDA0DD
 */
+(UIColor*)meiHongColor;
/**
 *  黄色	255	255	0	#FFFF00
 */
+(UIColor*)huangColor;
/**
 *  香蕉色	227	207	87	#E3CF57
 */
+(UIColor*)xiangJiaoColor;
/**
 *  镉黄	255	153	18	#FF9912
 */
+(UIColor*)geHuangColor;
/**
 *  dougello	235	142	85	#EB8E55
 */
+(UIColor*)dougelloColor;
/**
 *  forum gold	255	227	132	#FFE384
 */
+(UIColor*)forumGoldColor;
/**
 *  金黄色	255	215	0	#FFD700
 */
+(UIColor*)jinHuangColor;
/**
 *  黄花色	218	165	105	#DAA569
 */
+(UIColor*)huangHuaColor;
/**
 *  瓜色	227	168	105	#E3A869
 */
+(UIColor*)guaColor;
/**
 *  橙色	255	97	0	#FF6100
 */
+(UIColor*)chengColor;
/**
 *  镉橙	255	97	3	#FF6103
 */
+(UIColor*)geChengColor;
/**
 *  胡萝卜色	237	145	33	#ED9121
 */
+(UIColor*)huLuoBoColor;
/**
 *  桔黄	255	128	0	#FF8000
 */
+(UIColor*)juHuangColor;
/**
 *  淡黄色	245	222	179	#F5DEB3
 */
+(UIColor*)tanHuangColor;
/**
 *  棕色	128	42	42	#802A2A
 */
+(UIColor*)zongColor;
/**
 *  米色	163	148	128	#A39480
 */
+(UIColor*)miColor;
/**
 *  锻浓黄土色	138	54	15	#8A360F
 */
+(UIColor*)duanNongHuangTuColor;
/**
 *  锻棕土色	135	51	36	#873324
 */
+(UIColor*)duanZongTuColor;
/**
 *  巧克力色	210	105	30	#D2691E
 */
+(UIColor*)qiaoKeLiColor;
/**
 *  肉色	255	125	64	#FF7D40
 */
+(UIColor*)rouColor;

/**
 *  黄褐色	240	230	140	#F0E68C
 */
+(UIColor*)huangJeColor;

/**
 *  玫瑰红	188	143	143	#BC8F8F
 */
+(UIColor*)meiGuiColor;

/**
 *  肖贡土色	199	97	20	#C76114
 */
+(UIColor*)xiaoGongTuColor;

/**
 *  标土棕	115	74	18	#734A12
 */
+(UIColor*)biaoTuColor;

/**
 *  乌贼墨棕	94	38	18	#5E2612
 */
+(UIColor*)wuZuiMoZongColor;
/**
 *  赫色	160	82	45	#A0522D
 */
+(UIColor*)heColor;
/**
 *  马棕色	139	69	19	#8B4513
 */
+(UIColor*)maZongColor;
/**
 *  沙棕色	244	164	96	#F4A460
 */
+(UIColor*)shaZongColor;

/**
 *  棕褐色	210	180	140	#D2B48C
 */
+(UIColor*)zongHeColor;

/**
 *  蓝色	0	0	255	#0000FF
 */
+(UIColor*)lanColor;
/**
 *  钴色	61	89	171	#3D59AB
 */
+(UIColor*)guColor;
/**
 *  dodger blue	30	144	255	#1E90FF
 */
+(UIColor*)dodgerBlueColor;
/**
 *  jackie blue	11	23	70	#0B1746
 */
+(UIColor*)jackieBlueColor;
/**
 *  锰蓝	3	168	158	#03A89E
 */
+(UIColor*)mengLanColor;
/**
 *  深蓝色	25	25	112	#191970
 */
+(UIColor*)shenLanColor;
/**
 *  孔雀蓝	51	161	201	#33A1C9
 */
+(UIColor*)kongQueLanColor;

@end
