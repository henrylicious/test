<!DOCTYPE html>
<HTML LANG="en">
<HEAD>
<META http-equiv="content-type" content="text/html; charset=utf-8">
<META name="viewport" content="width=device-width, initial-scale=0.8">
<META name="robots" content="nofollow">
<LINK rel="stylesheet" type="text/css" href="/style/fresh.css" />
<link rel="stylesheet" type="text/css" href="/fresh/standard.css" />
<TITLE>libpst: m4/ax_boost_python.m4 | Fossies</TITLE>
<META http-equiv="Content-Script-Type" content="text/javascript">
<script type="text/javascript" src="/scripts/highlight_styles.js"></script>
</HEAD>
<BODY>
<script type="text/javascript" src="/scripts/wz_tooltip.js"></script>
<script type="text/javascript" src="/scripts/tip_balloon.js"></script>
<H2><IMG SRC="/warix/forest1.gif" WIDTH="45" HEIGHT="29" ALT=""> "<A HREF="/">Fossies</A>" - the Fresh Open Source Software Archive <IMG SRC="/warix/forest2.gif" WIDTH="48" HEIGHT="30" ALT=""></H2>
<H3>Member "libpst-0.6.72/m4/ax_boost_python.m4" (1 Aug 2018, 5241 Bytes) of package <A HREF="/" TITLE="Fossies homepage">/</A><A HREF="/linux/" TITLE="Listing of all main folders within the Fossies basic folder /linux/">linux</A>/<A HREF="/linux/privat/" TITLE="Listing of all packages within the Fossies folder /linux/privat/">privat</A>/<A HREF="/linux/privat/libpst-0.6.72.tar.gz/" TITLE="Contents listing, member browsing, download with different compression formats, Doxygen generated source code documentation &amp; more ...">libpst-0.6.72.tar.gz</A>:</H3>
<HR>
<DIV class="fresh_info">
As a special service "Fossies" has tried to format the requested text file into HTML format (style: <A HREF="/select_hl_style_text" style="text-decoration:underline;" onmouseover="Tip(hl_styles, ABOVE, false, OFFSETX, 0, OFFSETY, 5, BALLOON, true, FOLLOWMOUSE, false, WIDTH, 0, DELAY, 0, FADEIN, 0, FADEOUT, 1000, DURATION, 20000, STICKY, 1, CLICKCLOSE, true)" onmouseout="UnTip()" TITLE="About highlight style types">standard</A>) with prefixed line numbers.
Alternatively you can here <A HREF="/linux/privat/libpst-0.6.72.tar.gz/libpst-0.6.72/m4/ax_boost_python.m4?m=t">view</A> or <A HREF="/linux/privat/libpst-0.6.72.tar.gz/libpst-0.6.72/m4/ax_boost_python.m4?m=b" onmouseover="Tip(hl_dl_tip, ABOVE, false, OFFSETX, 0, OFFSETY, -5, BALLOON, true, FOLLOWMOUSE, false, WIDTH, 400, DELAY, 0, FADEIN, 0, FADEOUT, 300, DURATION, 10000, STICKY, 1, CLICKCLOSE, true)" onmouseout="UnTip()" TITLE="By the way: A member file download can also be achieved by clicking within a package contents listing on the according byte size field">download</A> the uninterpreted source code file.
 See also the latest <span class="fresh_info_amo"><A HREF="/diffs/" TITLE="Fossies source code differences reports (main page)" REL="nofollow">Fossies "Diffs"</A></span> side-by-side code changes report for "ax_boost_python.m4": <A HREF="/diffs/libpst/0.6.71_vs_0.6.72/m4/ax_boost_python.m4-diff.html" TITLE="&quot;ax_boost_python.m4&quot; file has changes in the current release!" STYLE="white-space: nowrap;"><IMG SRC="/delta_answer_10.png" WIDTH="13" HEIGHT="13"> 0.6.71_vs_0.6.72</A>.
</DIV>
<HR>
<pre class="hl"><span class="hl lin" id="l_1">    1 </span># ===========================================================================
<span class="hl lin" id="l_2">    2 </span>#     https://www.gnu.org/software/autoconf-archive/ax_boost_python.html
<span class="hl lin" id="l_3">    3 </span># ===========================================================================
<span class="hl lin" id="l_4">    4 </span>#
<span class="hl lin" id="l_5">    5 </span># SYNOPSIS
<span class="hl lin" id="l_6">    6 </span>#
<span class="hl lin" id="l_7">    7 </span>#   AX_BOOST_PYTHON
<span class="hl lin" id="l_8">    8 </span>#
<span class="hl lin" id="l_9">    9 </span># DESCRIPTION
<span class="hl lin" id="l_10">   10 </span>#
<span class="hl lin" id="l_11">   11 </span>#   This macro checks to see if the Boost.Python library is installed. It
<span class="hl lin" id="l_12">   12 </span>#   also attempts to guess the correct library name using several attempts.
<span class="hl lin" id="l_13">   13 </span>#   It tries to build the library name using a user supplied name or suffix
<span class="hl lin" id="l_14">   14 </span>#   and then just the raw library.
<span class="hl lin" id="l_15">   15 </span>#
<span class="hl lin" id="l_16">   16 </span>#   If the library is found, HAVE_BOOST_PYTHON is defined and
<span class="hl lin" id="l_17">   17 </span>#   BOOST_PYTHON_LIB is set to the name of the library.
<span class="hl lin" id="l_18">   18 </span>#
<span class="hl lin" id="l_19">   19 </span>#   This macro calls AC_SUBST(BOOST_PYTHON_LIB).
<span class="hl lin" id="l_20">   20 </span>#
<span class="hl lin" id="l_21">   21 </span>#   In order to ensure that the Python headers and the Boost libraries are
<span class="hl lin" id="l_22">   22 </span>#   specified on the include path, this macro requires AX_PYTHON_DEVEL and
<span class="hl lin" id="l_23">   23 </span>#   AX_BOOST_BASE to be called.
<span class="hl lin" id="l_24">   24 </span>#
<span class="hl lin" id="l_25">   25 </span># LICENSE
<span class="hl lin" id="l_26">   26 </span>#
<span class="hl lin" id="l_27">   27 </span>#   Copyright (c) 2008 Michael Tindal
<span class="hl lin" id="l_28">   28 </span>#   Copyright (c) 2013 Daniel M&quot;ullner &lt;daniel&#64;danifold.net&gt;
<span class="hl lin" id="l_29">   29 </span>#
<span class="hl lin" id="l_30">   30 </span>#   This program is free software; you can redistribute it and/or modify it
<span class="hl lin" id="l_31">   31 </span>#   under the terms of the GNU General Public License as published by the
<span class="hl lin" id="l_32">   32 </span>#   Free Software Foundation; either version 2 of the License, or (at your
<span class="hl lin" id="l_33">   33 </span>#   option) any later version.
<span class="hl lin" id="l_34">   34 </span>#
<span class="hl lin" id="l_35">   35 </span>#   This program is distributed in the hope that it will be useful, but
<span class="hl lin" id="l_36">   36 </span>#   WITHOUT ANY WARRANTY; without even the implied warranty of
<span class="hl lin" id="l_37">   37 </span>#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General
<span class="hl lin" id="l_38">   38 </span>#   Public License for more details.
<span class="hl lin" id="l_39">   39 </span>#
<span class="hl lin" id="l_40">   40 </span>#   You should have received a copy of the GNU General Public License along
<span class="hl lin" id="l_41">   41 </span>#   with this program. If not, see &lt;https://www.gnu.org/licenses/&gt;.
<span class="hl lin" id="l_42">   42 </span>#
<span class="hl lin" id="l_43">   43 </span>#   As a special exception, the respective Autoconf Macro&apos;s copyright owner
<span class="hl lin" id="l_44">   44 </span>#   gives unlimited permission to copy, distribute and modify the configure
<span class="hl lin" id="l_45">   45 </span>#   scripts that are the output of Autoconf when processing the Macro. You
<span class="hl lin" id="l_46">   46 </span>#   need not follow the terms of the GNU General Public License when using
<span class="hl lin" id="l_47">   47 </span>#   or distributing such scripts, even though portions of the text of the
<span class="hl lin" id="l_48">   48 </span>#   Macro appear in them. The GNU General Public License (GPL) does govern
<span class="hl lin" id="l_49">   49 </span>#   all other use of the material that constitutes the Autoconf Macro.
<span class="hl lin" id="l_50">   50 </span>#
<span class="hl lin" id="l_51">   51 </span>#   This special exception to the GPL applies to versions of the Autoconf
<span class="hl lin" id="l_52">   52 </span>#   Macro released by the Autoconf Archive. When you make and distribute a
<span class="hl lin" id="l_53">   53 </span>#   modified version of the Autoconf Macro, you may extend this special
<span class="hl lin" id="l_54">   54 </span>#   exception to the GPL to apply to your modified version as well.
<span class="hl lin" id="l_55">   55 </span>
<span class="hl lin" id="l_56">   56 </span>#serial 22
<span class="hl lin" id="l_57">   57 </span>
<span class="hl lin" id="l_58">   58 </span>AC_DEFUN([AX_BOOST_PYTHON],
<span class="hl lin" id="l_59">   59 </span>[AC_REQUIRE([AX_PYTHON_DEVEL])dnl
<span class="hl lin" id="l_60">   60 </span>AC_REQUIRE([AX_BOOST_BASE])dnl
<span class="hl lin" id="l_61">   61 </span>AC_LANG_PUSH([C++])
<span class="hl lin" id="l_62">   62 </span>ax_boost_python_save_CPPFLAGS=&quot;$CPPFLAGS&quot;
<span class="hl lin" id="l_63">   63 </span>ax_boost_python_save_LDFLAGS=&quot;$LDFLAGS&quot;
<span class="hl lin" id="l_64">   64 </span>ax_boost_python_save_LIBS=&quot;$LIBS&quot;
<span class="hl lin" id="l_65">   65 </span>if test &quot;x$PYTHON_CPPFLAGS&quot; != &quot;x&quot;; then
<span class="hl lin" id="l_66">   66 </span>  CPPFLAGS=&quot;$PYTHON_CPPFLAGS $CPPFLAGS&quot;
<span class="hl lin" id="l_67">   67 </span>fi
<span class="hl lin" id="l_68">   68 </span>
<span class="hl lin" id="l_69">   69 </span># Versions of AX_PYTHON_DEVEL() before serial 18 provided PYTHON_LDFLAGS
<span class="hl lin" id="l_70">   70 </span># instead of PYTHON_LIBS, so this is just here for compatibility.
<span class="hl lin" id="l_71">   71 </span>if test &quot;x$PYTHON_LDFLAGS&quot; != &quot;x&quot;; then
<span class="hl lin" id="l_72">   72 </span>  LDFLAGS=&quot;$PYTHON_LDFLAGS $LDFLAGS&quot;
<span class="hl lin" id="l_73">   73 </span>fi
<span class="hl lin" id="l_74">   74 </span>
<span class="hl lin" id="l_75">   75 </span># Note: Only versions of AX_PYTHON_DEVEL() since serial 18 provide PYTHON_LIBS
<span class="hl lin" id="l_76">   76 </span># instead of PYTHON_LDFLAGS.
<span class="hl lin" id="l_77">   77 </span>if test &quot;x$PYTHON_LIBS&quot; != &quot;x&quot;; then
<span class="hl lin" id="l_78">   78 </span>  LIBS=&quot;$PYTHON_LIBS $LIBS&quot;
<span class="hl lin" id="l_79">   79 </span>fi
<span class="hl lin" id="l_80">   80 </span>
<span class="hl lin" id="l_81">   81 </span>if test &quot;x$BOOST_CPPFLAGS&quot; != &quot;x&quot;; then
<span class="hl lin" id="l_82">   82 </span>  CPPFLAGS=&quot;$BOOST_CPPFLAGS $CPPFLAGS&quot;
<span class="hl lin" id="l_83">   83 </span>fi
<span class="hl lin" id="l_84">   84 </span>if test &quot;x$BOOST_LDFLAGS&quot; != &quot;x&quot;; then
<span class="hl lin" id="l_85">   85 </span>  LDFLAGS=&quot;$BOOST_LDFLAGS $LDFLAGS&quot;
<span class="hl lin" id="l_86">   86 </span>fi
<span class="hl lin" id="l_87">   87 </span>AC_CACHE_CHECK(whether the Boost::Python library is available,
<span class="hl lin" id="l_88">   88 </span>ac_cv_boost_python,
<span class="hl lin" id="l_89">   89 </span>[AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
<span class="hl lin" id="l_90">   90 </span>#include &lt;boost/python/module.hpp&gt;
<span class="hl lin" id="l_91">   91 </span>BOOST_PYTHON_MODULE(test) { throw &quot;Boost::Python test.&quot;; }]], [])],
<span class="hl lin" id="l_92">   92 </span>    ac_cv_boost_python=yes, ac_cv_boost_python=no)
<span class="hl lin" id="l_93">   93 </span>])
<span class="hl lin" id="l_94">   94 </span>if test &quot;$ac_cv_boost_python&quot; = &quot;yes&quot;; then
<span class="hl lin" id="l_95">   95 </span>  AC_DEFINE(HAVE_BOOST_PYTHON,,[define if the Boost::Python library is available])
<span class="hl lin" id="l_96">   96 </span>  ax_python_lib=boost_python
<span class="hl lin" id="l_97">   97 </span>  AC_ARG_WITH([boost-python],AS_HELP_STRING([--with-boost-python],[specify yes/no or the boost python library or suffix to use]),
<span class="hl lin" id="l_98">   98 </span>  [if test &quot;x$with_boost_python&quot; != &quot;xno&quot; -a &quot;x$with_boost_python&quot; != &quot;xyes&quot;; then
<span class="hl lin" id="l_99">   99 </span>     ax_python_lib=$with_boost_python
<span class="hl lin" id="l_100">  100 </span>     ax_boost_python_lib=boost_python-$with_boost_python
<span class="hl lin" id="l_101">  101 </span>   fi])
<span class="hl lin" id="l_102">  102 </span>  BOOSTLIBDIR=`echo $BOOST_LDFLAGS | sed -e &apos;s/&#64;&lt;:&#64;^\/&#64;:&gt;&#64;*//&apos;`
<span class="hl lin" id="l_103">  103 </span>  for ax_lib in $ax_python_lib $ax_boost_python_lib `ls $BOOSTLIBDIR/libboost_python*.so* $BOOSTLIBDIR/libboost_python*.dylib* $BOOSTLIBDIR/libboost_python*.a* 2&gt;/dev/null | sed &apos;s,.*/,,&apos; | sed -e &apos;s;^lib\(boost_python.*\)\.so.*$;\1;&apos; -e &apos;s;^lib\(boost_python.*\)\.dylib.*$;\1;&apos; -e &apos;s;^lib\(boost_python.*\)\.a.*$;\1;&apos; ` boost_python boost_python3; do
<span class="hl lin" id="l_104">  104 </span>    AS_VAR_PUSHDEF([ax_Lib], [ax_cv_lib_$ax_lib&apos;&apos;_BOOST_PYTHON_MODULE])dnl
<span class="hl lin" id="l_105">  105 </span>    AC_CACHE_CHECK([whether $ax_lib is the correct library], [ax_Lib],
<span class="hl lin" id="l_106">  106 </span>    [LIBS=&quot;-l$ax_lib $ax_boost_python_save_LIBS $PYTHON_LIBS&quot;
<span class="hl lin" id="l_107">  107 </span>    AC_LINK_IFELSE([AC_LANG_PROGRAM([[
<span class="hl lin" id="l_108">  108 </span>#include &lt;boost/python/module.hpp&gt;
<span class="hl lin" id="l_109">  109 </span>BOOST_PYTHON_MODULE(test) { throw &quot;Boost::Python test.&quot;; }]], [])],
<span class="hl lin" id="l_110">  110 </span>        [AS_VAR_SET([ax_Lib], [yes])],
<span class="hl lin" id="l_111">  111 </span>        [AS_VAR_SET([ax_Lib], [no])])])
<span class="hl lin" id="l_112">  112 </span>    AS_VAR_IF([ax_Lib], [yes], [BOOST_PYTHON_LIB=$ax_lib break], [])
<span class="hl lin" id="l_113">  113 </span>    AS_VAR_POPDEF([ax_Lib])dnl
<span class="hl lin" id="l_114">  114 </span>  done
<span class="hl lin" id="l_115">  115 </span>  AC_SUBST(BOOST_PYTHON_LIB)
<span class="hl lin" id="l_116">  116 </span>fi
<span class="hl lin" id="l_117">  117 </span>CPPFLAGS=&quot;$ax_boost_python_save_CPPFLAGS&quot;
<span class="hl lin" id="l_118">  118 </span>LDFLAGS=&quot;$ax_boost_python_save_LDFLAGS&quot;
<span class="hl lin" id="l_119">  119 </span>LIBS=&quot;$ax_boost_python_save_LIBS&quot;
<span class="hl lin" id="l_120">  120 </span>AC_LANG_POP([C++])
<span class="hl lin" id="l_121">  121 </span>])dnl
</pre></BODY></HTML><!--HTML generated by highlight, http://www.andre-simon.de/-->
