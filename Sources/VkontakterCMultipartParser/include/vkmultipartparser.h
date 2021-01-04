// MIT License

// Copyright (c) 2019 François Colas

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#ifndef VKMULTIPARTPARSER_H
#define VKMULTIPARTPARSER_H
#ifdef __cplusplus
extern "C" {
#endif

#include <stddef.h>
#include <stdint.h>
#include <sys/types.h>

typedef struct vkmultipartparser vkmultipartparser;
typedef struct vkmultipartparser_callbacks vkmultipartparser_callbacks;

typedef int (*multipart_cb) (vkmultipartparser*);
typedef int (*multipart_data_cb) (vkmultipartparser*, const char* data, size_t size);

struct vkmultipartparser {
    /** PRIVATE **/
    char        boundary[70];
    int         boundary_length;
    int         index;
    uint16_t    state;

    /** PUBLIC **/
    void* data;
};

struct vkmultipartparser_callbacks {
    multipart_cb      on_body_begin;
    multipart_cb      on_part_begin;
    multipart_data_cb on_header_field;
    multipart_data_cb on_header_value;
    multipart_cb      on_headers_complete;
    multipart_data_cb on_data;
    multipart_cb      on_part_end;
    multipart_cb      on_body_end;
};

void t_vkmultipartparser_init(vkmultipartparser* parser, const char* boundary);

void t_vkmultipartparser_callbacks_init(vkmultipartparser_callbacks* callbacks);

size_t t_vkmultipartparser_execute(vkmultipartparser* parser,
                               vkmultipartparser_callbacks* callbacks,
                               const char* data,
                               size_t size);

#ifdef __cplusplus
}
#endif
#endif // VKMULTIPARTPARSER_H
