//
//  ViewController.m
//  MppViewer
//
//  Created by George on 4/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "RecurrenceType.h"
#import "CoreFoundation/CoreFoundation.h"

#import <fstream>
#import <iostream>
#import <list>
#import <string>
#import <vector>
#import "pole.h"

#import "CompObj.h"
#import "Props14.h"
#import "VarMeta12.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //NSString *guid = [self stringWithUUID];
    /*
    NSString *guid1 = [[NSProcessInfo alloc] globallyUniqueString];
    
    NSMutableArray *values = [RecurrenceType TYPE_VALUES];
    for (NSObject *rec in values) 
    {
        if([rec isKindOfClass:[RecurrenceType class]])
        {
            ////RecurrenceType *type = (RecurrenceType *)rec;
            NSLog(@"%d", (int)[rec performSelector:@selector(getValue)]);
        }
        else
        {
            NSLog(@"NULL");
        }
    }
     */
    

    NSString *file = [[NSBundle mainBundle] pathForResource:@"Project" ofType:@"mpp"];
    const char* filename = [file UTF8String];   
    POLE::Storage* storage = new POLE::Storage(filename);
    storage->open();
    if( storage->result() != POLE::Storage::Ok )
    {
        std::cout << "Error on file " << filename << std::endl;
        return;
    }
    
    visit( 0, storage, "/" );
    POLE::Stream *stream = dump(storage, "/   114/TBkndOutlCode/VarMeta");
    if(stream)
    {
        VarMeta12 *var = [[VarMeta12 alloc]init:stream];
    }
    
    //POLE::Stream *stream = dump(storage, "CompObj");
    //CompObj * compObj = [[CompObj alloc]init:stream];
    
    
    //POLE::Stream *streamProps = dump( storage, "Props14" );
    //if(streamProps)
    //{
    //    Props14 *p = [[Props14 alloc]init:streamProps];
    //}
}

void extract( POLE::Storage* storage, char* stream_name, char* outfile )
{
    POLE::Stream* stream = new POLE::Stream(storage, stream_name);
    if( !stream ) return;
    if( stream->fail() ) return;
    
    std::ofstream file;
    file.open( outfile, std::ios::binary|std::ios::out );
    
    unsigned char buffer[16];
    for( ;; )
    {
        unsigned read = stream->read( buffer, sizeof( buffer ) );
        file.write( (const char*)buffer, read  );
        if( read < sizeof( buffer ) ) break;
    }
    file.close();
    
    delete stream;
}

void visit( int indent, POLE::Storage* storage, std::string path )
{
    std::list<std::string> entries;
    entries = storage->entries( path );
    
    std::list<std::string>::iterator it;
    for( it = entries.begin(); it != entries.end(); ++it )
    {
        std::string name = *it;
        std::string fullname = path + name;
        for( int j = 0; j < indent; j++ ) std::cout << "    ";
        POLE::Stream* ss = new POLE::Stream( storage, fullname );
        std::cout << name;
        if( ss ) if( !ss->fail() )std::cout << "  (" << ss->size() << ")";
        std::cout << std::endl;
        delete ss;
        
        if( storage->isDirectory( fullname ) )
            visit( indent+1, storage, fullname + "/" );
    }
}

POLE::Stream* dump( POLE::Storage* storage, char* stream_name )
{
    POLE::Stream* stream = new POLE::Stream( storage, stream_name );
    if( !stream ) return NULL;
    if( stream->fail() ) return NULL;
    
    // std::cout << "Size: " << stream->size() << " bytes" << std::endl;
    /*unsigned char buffer[28];
    for( ;; )
    {
        unsigned read = stream->read( buffer, sizeof( buffer ) );
        //for( unsigned i = 0; i < read; i++ )
        //    printf( "%02x ", buffer[i] );
        std::cout << "    ";
        for( unsigned i = 0; i < read; i++ )
            printf( "%c", ((buffer[i]>=32)&&(buffer[i]<128)) ? buffer[i] : '.' );
        std::cout << std::endl;      
        if( read < sizeof( buffer ) ) break;
    }*/
    
    //delete stream;
    return stream;
}

/*
 -(NSString*) stringWithUUID {
 CFUUIDRef uuidObj = CFUUIDCreate(kCFAllocatorDefault);//create a new UUID
 //get the string representation of the UUID
 
 NSString *uuidString = (__bridge_transfer NSString *)CFUUIDCreateString(kCFAllocatorDefault, uuidObj);
 CFRelease(uuidObj);
 return uuidString;
 }
 */

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
