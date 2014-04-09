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

CG_INLINE CGRect
CGRectSetOriginY(CGRect rect, CGFloat y)
{
    return CGRectMake(rect.origin.x, y, rect.size.width, rect.size.height);
}

CG_INLINE CGRect
CGRectSetSizeHeight(CGRect rect, CGFloat height)
{
    return CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, height);
}

CG_INLINE CGRect
CGRectSetSizeWidth(CGRect rect, CGFloat width)
{
    return CGRectMake(rect.origin.x, rect.origin.y, width, rect.size.height);
}



#endif
