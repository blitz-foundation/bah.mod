#include <brl.mod/blitz.mod/blitz.h>

#include <stdio.h>
#include <dirent.h>
#include <sys/stat.h>

#if _WIN32

extern int _bbusew;

int fopen64_( BBString *file,BBString *mode ){
	if( _bbusew ) return (int)_wfopen( bbTmpWString(file),bbTmpWString(mode) );
	return (int)fopen( bbTmpCString(file),bbTmpCString(mode) );
}

void ftell64_( FILE *stream, BBInt64 * pos) {
	*pos = _ftelli64(stream);
}
#else

int fopen64_( BBString *file,BBString *mode ){
	return fopen64( bbTmpUTF8String(file),bbTmpUTF8String(mode) );
}

void ftell64_( FILE *stream, BBInt64 * pos) {
	*pos = ftello64(stream);
}

#endif

