/* The MIT License
 *
 * Copyright (c) 2010 OTClient, https://github.com/edubart/otclient
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


#ifndef UTIL_H
#define UTIL_H

#include <util/logger.h>
#include <boost/lexical_cast.hpp>
#include <boost/format.hpp>
#include <constants.h>

// Easy/fast writing formater
#define fmt(a, b) (boost::format(a) % b).str()

/// Convert any data type through boost::lexical_cast
template<class R, class T>
R convert_cast(T t)
{
    R ret = R();
    try {
        ret = boost::lexical_cast<R>(t);
    } catch(boost::bad_lexical_cast bad) {
        flogError("Error converting type: %s", bad.what());
    }
    return ret;
}

AlignmentFlag parseAlignment(std::string aligment);


#endif // UTIL_H
