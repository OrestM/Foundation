//
//  ViewController.m
//  CreatePdfFile
//
//  Created by Orest Mykha on 4/22/17.
//  Copyright © 2017 Orest Mykha. All rights reserved.
//

#import "ViewController.h"
#import <CoreText/CoreText.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)drawPageNbr:(NSInteger)pageNumber {
    NSString *setPageNum = [NSString stringWithFormat:@"Page %li", pageNumber];
    UIFont *pageNbrFont = [UIFont systemFontOfSize:14];
    CGSize maxSize = CGSizeMake(612, 72);
    CGRect pageStringSize = [setPageNum boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:pageNbrFont} context:nil];
    CGRect stringRect = CGRectMake(((612.0 - pageStringSize.size.width) / 2.0),
                                   720.0 + ((72.0 - pageStringSize.size.height) / 2.0),
                                   pageStringSize.size.width,
                                   pageStringSize.size.height);
    [setPageNum drawInRect:stringRect withAttributes:@{NSFontAttributeName:pageNbrFont}];
}

- (CFRange *)updatePDFPage:(NSInteger)pageNumber setTextRange:(CFRange *)pageRange setFramesetter:(CTFramesetterRef *)framesetter {
    // Get the graphics context.
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    // Create a path object to enclose the text. Use 72 point
    // margins all around the text.
    CGRect frameRect = CGRectMake(72, 72, 468, 648);
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    // Get the frame that will do the rendering.
    // The currentRange variable specifies only the starting point. The framesetter
    // lays out as much text as will fit into the frame.
    CTFrameRef frameRef = CTFramesetterCreateFrame(*framesetter, *pageRange, framePath, NULL);
    CGPathRelease(framePath);
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, 792);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    // Update the current range based on what was drawn.
    *pageRange = CTFrameGetVisibleStringRange(frameRef);
    pageRange->location += pageRange->length;
    pageRange->length = 0;
    CFRelease(frameRef);
    return pageRange;
}

- (IBAction)createPdf:(UIButton *)sender {
    NSString *textToDraw = @"International Women's Day - A reading comprehension test on the topic of International Women's Day    Night Study in Korea - A reading comprehension test on the topic of night studying in Korea.    History of Halloween - A reading comprehension test on the topic of Halloween.    Catching a Cold - A reading comprehension test on the topic of catching a cold    Levi's Blue Jeans - A reading comprehension test on the topic of Levi's Blue Jeans    Take a Bath! - A reading comprehension test on the topic of taking a bath.    Summer Solstice - A reading comprehension quiz on the topic of the summer solstice    Test Taking Skills - A reading comprehension quiz on the topic of 'test taking skills'    Improving Your English - A reading comprehension quiz on the topic of Improving your English    Friendship - A reading comprehension quiz on the topic of friendship    April Fool's Day - A reading comprehension quiz on the topic of April Fool's Day    The Travel Bug - A reading comprehension quiz on the topic of The Travel Bug.    English Around the World - A reading comprehension quiz on the topic of English Around the World.    Saint Patrick's Day - A reading comprehension quiz on the topic of Saint Patrick's Day.    The Alchemist - A reading comprehension quiz on the topic of The Alchemist.    Using an English/English Dictionary - A reading comprehension quiz on the topic of 'Using an English/English Dictionary'.    English as an International Language - A reading comprehension quiz on the topic of 'English as an International Language'.    Presidents' Day - A reading comprehension quiz on the topic of Presidents' Day.    St. Valentine's Day - A reading comprehension quiz on the topic of St. Valentine's Day.    Ground Hog Day - A reading comprehension quiz on the topic of Ground Hog Day    Television Shows - A reading comprehension quiz on the topic of Television Shows    Martin Luther King, Jr. - A reading comprehension quiz on the topic of Martin Luther King, Jr.";
    //Get Document Directory path
    NSArray *dirPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //Define path for PDF file
    NSString *documentPath = [[dirPath objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"Pdf.pdf"]];
    [textToDraw writeToFile:documentPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    // Prepare the text using a Core Text Framesetter.
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, (__bridge CFStringRef)textToDraw, NULL);
    if (currentText) {
        CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
        if (framesetter) {
            // Create the PDF context using the default page size of 612 x 792.
            UIGraphicsBeginPDFContextToFile(documentPath, CGRectZero, nil);
            CFRange currentRange = CFRangeMake(0, 0);
            NSInteger currentPage = 0;
            BOOL done = NO;
            do {
                // Mark the beginning of a new page.
                UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
                // Draw a page number at the bottom of each page.
                currentPage++;
                [self drawPageNbr:currentPage];
                // Render the current page and update the current range to
                // point to the beginning of the next page.
                currentRange = *[self updatePDFPage:currentPage setTextRange:&currentRange setFramesetter:&framesetter];
                // If we're at the end of the text, exit the loop.
                if (currentRange.location == CFAttributedStringGetLength((CFAttributedStringRef)currentText))
                    done = YES;
            } while (!done);
            // Close the PDF context and write the contents out.
            UIGraphicsEndPDFContext();
            // Release the framewetter.
            CFRelease(framesetter);
        } else {
            NSLog(@"Could not create the framesetter..");
        }
        // Release the attributed string.
        CFRelease(currentText);
    } else {
        NSLog(@"currentText could not be created");
    }
}

@end
