/** 
	@file Unnamed C or C++ program.c
	@brief 尚未命名的 C 或 C++ 程式
	
	請見本檔案的標頭(header)檔案（如果有的話）以得到更多關於本程式的說明
	
	本來源程式碼的架構基於「通用程式來源程式碼範本」專案
	This source code's structure is based on "Generic Program Source Code Templates" project
		https://github.com/Vdragon/Generic_Program_Source_Code_Templates
		
	建議的文字編輯器設定
	Recommended text editor settings
		Indentation by tab character
		Tab character width = 2 space characters
	
	@author 〈作者稱謂〉
	@copyright 〈授權條款段落〉
*/
/* 程式所引入(include)之函式庫的標頭(header)檔案
 * Included library headers */
	/* 引入自己的定義內容
		#include "SELF_NAME.h" */
		
	/* 引入標準Ｃ函式庫的定義
	 * Include Standard C Library definitions
	 *   C library - C++ Reference
	 *   http://www.cplusplus.com/reference/clibrary/ */
		/* Definitions of functions to perform data input/output(I/O) operations
			#include <stdio.h>
			#include <cstdio> */
		/* Definitions of functions/constants that provides general utilities(that are otherwise homeless)
			#include <stdlib.h>
			#include <cstdlib> */
		/* C error number 
			#include <errno.h>
			#include <cerrno> */
		/* C Diagnostics Library
			#include <assert.h>
			#include <cassert> */
		/* C Character handling functions
			#include <ctype.h>
			#include <cctype> */
		/* Characteristics of floating-point types
			#include <float.h>
			#include <cfloat> */		
		/* ISO 646 Alternative operator spellings
			#include <iso646.h>
			#include <ciso646> */
		/* Sizes of integral types
			#include <limits.h>
			#include <climits> */
		/* C localization library
			#include <locale.h>
			#include <clocale> */
		/* C numerics library
			#include <math.h>
			#include <cmath> */
		/* Non local jumps
			#include <setjmp.h>
			#include <csetjmp> */
		/* C library to handle signals
			#include <signal.h>
			#include <csignal> */
		/* Variable arguments handling
			#include <stdarg.h>
			#include <cstdarg> */
		/* Boolean type(C99 or later)
			#include <stdbool.h>
			#include <cstdbool> */
		/* C Standard definitions
			#include <stddef.h>
			#include <cstddef> */
		/* Integer types(C++11 later)
			#include <stdint.h>
			#include <cstdint> */
		/* C Strings
			#include <string.h>
			#include <cstring> */
		/* C Time Library
			#include <time.h>
			#include <ctime> */
		/* Unicode characters handling library(C++11 later)
			#include <uchar.h>
			#include <cuchar> */
		/* Wide characters handling library
			#include <wchar.h>
			#include <cwchar> */
		/* Wide character type
			#include <wctype.h>
			#include <cwctype> */
		/* Type-generic math(non C89)
			#include <tgmath.h>
			#include <ctgmath> */
		/* <title>
			#include <<name>.h>
			#include <c<name>> */
		
	/* 引入標準 C++ 函式庫的定義 */
		/* Input/Output related */
			/* Standard Input / Output Streams Library
				#include <iostream> */
			/* Input/output file stream class
				#include <fstream> */
		/* Container */
			/* list
				#include <list> */
		/* Unclassified */
			/* Strings
				#include <string> */
			/* Standard Template Library: Algorithms
				#include <algorithm> */
			/* 
				#include <> */
	
	/* 引入 GNU gettext library 的定義
		#include <libintl.h> */
		
	/* 引入「Ｖ字龍的 C/C++ 函式庫蒐集」的定義內容
	 * Include "Vdragons C CPP Libraries Collection" definitions
	 *   https://github.com/Vdragon/Vdragons_C_CPP_Libraries_Collection */
		
	
/* 常數與巨集的定義
 * Definition of constants & macros */
	/* GNU gettext library
		#define _(Untranslated_C_string) gettext(Untranslated_C_string) */

/* 資料類型、列舉(enumeration)、資料結構與物件類別的定義
 * Definition of data type, enumeration, data structure and class */

/* 函式的宣告（函式雛型）
 * Function declarations (function prototypes)
     用途
     Usage 
       預先告訴編譯器(compiler)子程式的存在 */

/* 全域變數宣告
 * Global variable declarations */

/* 函式的實作
 * Function implementations */
	/** @brief 主程式（C/C++ 程式的進入點）
	    @param argc 呼叫此程式的命令列參數數量
	    @param argv 存放呼叫此程式的命令列參數陣列 
	    @returns 此程式要傳回作業系統的結束狀態碼
			@retval EXIT_SUCCESS 代表程式執行成功（此常數的定義位於 stdlib.h）
	    @retval EXIT_FAILURE 代表程式執行失敗（此常數的定義位於 stdlib.h）
	    @retval 其他數值 由開發者自行定義 */
	int main(int argc, char* argv[]){
		
		return EXIT_SUCCESS;
	}