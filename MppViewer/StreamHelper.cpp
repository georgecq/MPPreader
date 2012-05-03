//
//  StreamHelper.cpp
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <iostream>
#include "StreamHelper.h"

POLE::Stream* StreamHelper::getStream(POLE::Storage* storage, char* stream_name)
{
    POLE::Stream* stream = new POLE::Stream( storage, stream_name );
    if( !stream ) return NULL;
    if( stream->fail() ) return NULL;
    
    return stream;
}