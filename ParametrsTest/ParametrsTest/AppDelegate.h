//
//  AppDelegate.h
//  ParametrsTest
//
//  Created by Michael Sidoruk on 01.01.2020.
//  Copyright © 2020 Michael Sidoruk. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ASObject; //не импортируем сюда и говорим что вася я клянусь тебе, где то у меня есть этот класс

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (copy, nonatomic) ASObject *object;
@end

//strong - сильная ссылка.
//weak - слабая ссылка. Для объектов.
//assign - для примитивных типов данных. Для примитивов. Говорит сеттеру создавать данные напрямую.
//atomic = один поток.
//nonatomic = могут использовать свойство в разных потоках одновременно
//readwrite - можно сет и гет.
//readonly - только гет.
//copy - делает копию с сильной ссылкой.

