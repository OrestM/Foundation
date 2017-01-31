//
//  Global.h
//  TableView
//
//  Created by Admin on 12/25/15.
//  Copyright © 2015 Admin. All rights reserved.
//

#ifndef Global_h
#define Global_h

static NSString *const kBaseUrl = @"https://pixabay.com/";
static NSString *const kApiKey = @"1810648-a9eedd2c880402f438c7ce725";
static NSString *const kStringForSearch = @"music";
static NSString *const kImagePreviewUrl = @"previewURL";
static NSString *const kImageFullSizeUrl = @"webformatURL";
static NSString *const kResponseKey = @"hits";
static NSString *const kFullSizeSeque = @"FullSizeSeque";

#define DOCUMENTS_FOLDER [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]

#endif /* Global_h */