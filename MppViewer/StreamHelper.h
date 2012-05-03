//
//  StreamHelper.h
//  MppViewer
//
//  Created by Julián! on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#ifndef MppViewer_StreamHelper_h
#define MppViewer_StreamHelper_h

#include "pole.h"

class StreamHelper
{
    public:
        static POLE::Stream* getStream(POLE::Storage* storage, char* stream_name);
};

#endif
