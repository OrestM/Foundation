//
//  OMVIPAbonement.m
//  AbonementApp
//
//  Created by Admin on 4/23/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import "OMVIPAbonement.h"

@implementation OMVIPAbonement

- (NSArray *)benefits {
    
    OMAbonement *abonement1  = [[OMAbonement alloc] init];
    OMAbonement *abonement2  = [[OMAbonement alloc] init];
    OMAbonement *abonement3  = [[OMAbonement alloc] init];
    OMAbonement *abonement4  = [[OMAbonement alloc] init];
    OMAbonement *abonement5  = [[OMAbonement alloc] init];
    OMAbonement *abonement6  = [[OMAbonement alloc] init];
    OMAbonement *abonement7  = [[OMAbonement alloc] init];
    OMAbonement *abonement8  = [[OMAbonement alloc] init];
    OMAbonement *abonement9  = [[OMAbonement alloc] init];
    OMAbonement *abonement10 = [[OMAbonement alloc] init];
    OMAbonement *abonement11 = [[OMAbonement alloc] init];
    OMAbonement *abonement12 = [[OMAbonement alloc] init];
    OMAbonement *abonement13 = [[OMAbonement alloc] init];
    OMAbonement *abonement14 = [[OMAbonement alloc] init];
    OMAbonement *abonement15 = [[OMAbonement alloc] init];
    
    OMVIPAbonement *vipabonement1 = [[OMVIPAbonement alloc] init];
    OMVIPAbonement *vipabonement2 = [[OMVIPAbonement alloc] init];
    OMVIPAbonement *vipabonement3 = [[OMVIPAbonement alloc] init];
    OMVIPAbonement *vipabonement4 = [[OMVIPAbonement alloc] init];
    OMVIPAbonement *vipabonement5 = [[OMVIPAbonement alloc] init];
    
    abonement1.name = @"Anna";
    abonement1.surname = @"Colch";
    abonement1.photo = [UIImage imageNamed:@"image1"];
    abonement1.phoneNumber = 80938745333;
    abonement1.age = 19;
    abonement1.address = @"Grinchenka 12";
    abonement1.dateOfBirth = 1990;
    
    abonement2.name = @"Stefan";
    abonement2.surname = @"Granch";
    abonement2.photo = [UIImage imageNamed:@"image2"];
    abonement2.phoneNumber = 80936735333;
    abonement2.age = 17;
    abonement2.address = @"Zelena 123";
    abonement2.dateOfBirth = 1994;
    
    abonement3.name = @"Kilo";
    abonement3.surname = @"Keln";
    abonement3.photo = [UIImage imageNamed:@"image3"];
    abonement3.phoneNumber = 80988745333;
    abonement3.age = 39;
    abonement3.address = @"Suhivska 2";
    abonement3.dateOfBirth = 1996;
    
    abonement4.name = @"Poli";
    abonement4.surname = @"Moli";
    abonement4.photo = [UIImage imageNamed:@"image4"];
    abonement4.phoneNumber = 80676739333;
    abonement4.age = 34;
    abonement4.address = @"Grinchenka 8";
    abonement4.dateOfBirth = 1987;
    
    abonement5.name = @"Henry";
    abonement5.surname = @"Jordan";
    abonement5.photo = [UIImage imageNamed:@"image5"];
    abonement5.phoneNumber = 80938725343;
    abonement5.age = 40;
    abonement5.address = @"Antonovicha 13";
    abonement5.dateOfBirth = 1970;
    
    abonement6.name = @"Katia";
    abonement6.surname = @"Flik";
    abonement6.photo = [UIImage imageNamed:@"image6"];
    abonement6.phoneNumber = 80506735333;
    abonement6.age = 17;
    abonement6.address = @"Zelena 255";
    abonement6.dateOfBirth = 1994;
    
    abonement7.name = @"Kate";
    abonement7.surname = @"Posner";
    abonement7.photo = [UIImage imageNamed:@"image7"];
    abonement7.phoneNumber = 80978045303;
    abonement7.age = 30;
    abonement7.address = @"Suhivska 5";
    abonement7.dateOfBirth = 1984;
    
    abonement8.name = @"Gania";
    abonement8.surname = @"Kimberlin";
    abonement8.photo = [UIImage imageNamed:@"image8"];
    abonement8.phoneNumber = 80676349333;
    abonement8.age = 26;
    abonement8.address = @"Grinchenka 4";
    abonement8.dateOfBirth = 1982;
    
    abonement9.name = @"Stacy";
    abonement9.surname = @"Pink";
    abonement9.photo = [UIImage imageNamed:@"image9"];
    abonement9.phoneNumber = 80936733113;
    abonement9.age = 21;
    abonement9.address = @"Zelena 17";
    abonement9.dateOfBirth = 1993;
    
    abonement10.name = @"Olia";
    abonement10.surname = @"Haluchak";
    abonement10.photo = [UIImage imageNamed:@"image10"];
    abonement10.phoneNumber = 80988795373;
    abonement10.age = 40;
    abonement10.address = @"Suhivska 23";
    abonement10.dateOfBirth = 1971;
    
    abonement11.name = @"Pavlo";
    abonement11.surname = @"Hrihorenko";
    abonement11.photo = [UIImage imageNamed:@"image11"];
    abonement11.phoneNumber = 80676939533;
    abonement11.age = 27;
    abonement11.address = @"Grinchenka 7";
    abonement11.dateOfBirth = 1988;
    
    abonement12.name = @"Lil";
    abonement12.surname = @"Wayne";
    abonement12.photo = [UIImage imageNamed:@"image12"];
    abonement12.phoneNumber = 80938775323;
    abonement12.age = 41;
    abonement12.address = @"Antonovicha 10";
    abonement12.dateOfBirth = 1973;
    
    abonement13.name = @"Nimkenia";
    abonement13.surname = @"Flow";
    abonement13.photo = [UIImage imageNamed:@"image13"];
    abonement13.phoneNumber = 80506335433;
    abonement13.age = 18;
    abonement13.address = @"Zelena 25";
    abonement13.dateOfBirth = 1998;
    
    abonement14.name = @"Harry";
    abonement14.surname = @"Klarkson";
    abonement14.photo = [UIImage imageNamed:@"image14"];
    abonement14.phoneNumber = 80978045343;
    abonement14.age = 25;
    abonement14.address = @"Suhivska 5";
    abonement14.dateOfBirth = 1990;
    
    abonement15.name = @"Kelly";
    abonement15.surname = @"Potter";
    abonement15.photo = [UIImage imageNamed:@"image15"];
    abonement15.phoneNumber = 80676249573;
    abonement15.age = 26;
    abonement15.address = @"Grinchenka 1";
    abonement15.dateOfBirth = 1983;
    
    vipabonement1.name = @"Alexander";
    vipabonement1.photo = [UIImage imageNamed:@"image16"];
    vipabonement1.info = @"VIP";
    
    vipabonement2.name = @"Luis";
    vipabonement2.photo = [UIImage imageNamed:@"image17"];
    vipabonement2.info = @"VIP";
    
    vipabonement3.name = @"Nelly";
    vipabonement3.photo = [UIImage imageNamed:@"image18"];
    vipabonement3.info = @"VIP";
    
    vipabonement4.name = @"Kristina";
    vipabonement4.photo = [UIImage imageNamed:@"image19"];
    vipabonement4.info = @"VIP";
    
    vipabonement5.name = @"Leo";
    vipabonement5.photo = [UIImage imageNamed:@"image20"];
    vipabonement5.info = @"VIP";
    
    return @[abonement1, abonement2, abonement3, abonement4, abonement5, abonement6, abonement7, abonement8, abonement9,
             abonement10, abonement11, abonement12, abonement13, abonement14, abonement15, vipabonement1, vipabonement2,
             vipabonement3, vipabonement4, vipabonement5];
    
}

@end
