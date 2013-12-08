//
//  CGGeometryExt.h
//  ipPort.New
//
//  Created by Dmitriy Zadoroghniy on 06.12.13.
//  Copyright (c) 2013 ipPort. All rights reserved.
//

#ifndef CGGeometryExt_h
#define CGGeometryExt_h

#include <CoreGraphics/CGBase.h>

CG_INLINE CGFloat
CGRectGetBottom(CGRect rect)
{
    return rect.origin.y + rect.size.height;
}


#endif
