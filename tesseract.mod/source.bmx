' Copyright 2008 Bruce A Henderson
'
' Licensed under the Apache License, Version 2.0 (the "License");
' you may not use this file except in compliance with the License.
' You may obtain a copy of the License at
'
'     http://www.apache.org/licenses/LICENSE-2.0
'
' Unless required by applicable law or agreed to in writing, software
' distributed under the License is distributed on an "AS IS" BASIS,
' WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
' See the License for the specific language governing permissions and
' limitations under the License.
'
SuperStrict

Import BRL.Blitz

Import "src/*.h"
Import "src/ccstruct/*.h"
Import "src/ccutil/*.h"
Import "src/viewer/*.h"
Import "src/image/*.h"
Import "src/classify/*.h"
Import "src/dict/*.h"
Import "src/cutil/*.h"
Import "src/textord/*.h"
Import "src/pageseg/*.h"
Import "src/ccmain/*.h"
Import "src/wordrec/*.h"

Import "src/ccstruct/blobbox.cpp"
Import "src/ccstruct/werd.cpp"
Import "src/ccstruct/blobs.cpp"
Import "src/ccstruct/blread.cpp"
Import "src/ccstruct/callcpp.cpp"
Import "src/ccstruct/coutln.cpp"
Import "src/ccstruct/genblob.cpp"
Import "src/ccstruct/labls.cpp"
Import "src/ccstruct/linlsq.cpp"
Import "src/ccstruct/lmedsq.cpp"
Import "src/ccstruct/mod128.cpp"
Import "src/ccstruct/normalis.cpp"
Import "src/ccstruct/ocrblock.cpp"
Import "src/ccstruct/ocrrow.cpp"
Import "src/ccstruct/pageblk.cpp"
Import "src/ccstruct/pageres.cpp"
Import "src/ccstruct/pdblock.cpp"
Import "src/ccstruct/points.cpp"
Import "src/ccstruct/polyaprx.cpp"
Import "src/ccstruct/polyblk.cpp"
Import "src/ccstruct/polyblob.cpp"
Import "src/ccstruct/polyvert.cpp"
Import "src/ccstruct/poutline.cpp"
Import "src/ccstruct/quadlsq.cpp"
Import "src/ccstruct/quadratc.cpp"
Import "src/ccstruct/quspline.cpp"
Import "src/ccstruct/ratngs.cpp"
Import "src/ccstruct/rect.cpp"
Import "src/ccstruct/rejctmap.cpp"
Import "src/ccstruct/rwpoly.cpp"
Import "src/ccstruct/statistc.cpp"
Import "src/ccstruct/stepblob.cpp"
Import "src/ccstruct/txtregn.cpp"
Import "src/ccstruct/vecfuncs.cpp"


Import "src/ccutil/basedir.cpp"
Import "src/ccutil/varable.cpp"
Import "src/ccutil/bits16.cpp"
Import "src/ccutil/boxread.cpp"
Import "src/ccutil/clst.cpp"
Import "src/ccutil/debugwin.cpp"
Import "src/ccutil/elst.cpp"
Import "src/ccutil/elst2.cpp"
Import "src/ccutil/errcode.cpp"
Import "src/ccutil/globaloc.cpp"
Import "src/ccutil/hashfn.cpp"
Import "src/ccutil/mainblk.cpp"
Import "src/ccutil/memblk.cpp"
Import "src/ccutil/memry.cpp"
Import "src/ccutil/mfcpch.cpp"
Import "src/ccutil/ocrshell.cpp"
Import "src/ccutil/tprintf.cpp"

'Import "src/ccutil/scanutils.cpp"
Import "src/ccutil/serialis.cpp"
Import "src/ccutil/strngs.cpp"
Import "src/ccutil/tessopt.cpp"
Import "src/ccutil/unichar.cpp"
Import "src/ccutil/unicharmap.cpp"
Import "src/ccutil/unicharset.cpp"

Import "src/classify/adaptive.cpp"
Import "src/classify/xform2d.cpp"
Import "src/classify/adaptmatch.cpp"
Import "src/classify/baseline.cpp"
Import "src/classify/blobclass.cpp"
Import "src/classify/chartoname.cpp"
Import "src/classify/cluster.cpp"
Import "src/classify/clusttool.cpp"
Import "src/classify/cutoffs.cpp"
Import "src/classify/extract.cpp"
Import "src/classify/featdefs.cpp"
Import "src/classify/flexfx.cpp"
Import "src/classify/float2int.cpp"
Import "src/classify/fpoint.cpp"
Import "src/classify/fxdefs.cpp"
Import "src/classify/hideedge.cpp"
Import "src/classify/intfx.cpp"
Import "src/classify/intmatcher.cpp"
Import "src/classify/intproto.cpp"
Import "src/classify/kdtree.cpp"
Import "src/classify/mf.cpp"
Import "src/classify/mfdefs.cpp"
Import "src/classify/mfoutline.cpp"
Import "src/classify/mfx.cpp"
Import "src/classify/normfeat.cpp"
Import "src/classify/normmatch.cpp"
Import "src/classify/ocrfeatures.cpp"
Import "src/classify/outfeat.cpp"
Import "src/classify/picofeat.cpp"
Import "src/classify/protos.cpp"
Import "src/classify/sigmenu.cpp"
Import "src/classify/speckle.cpp"

Import "src/cutil/bitvec.cpp"
Import "src/cutil/variables.cpp"
Import "src/cutil/cutil.cpp"
Import "src/cutil/danerror.cpp"
Import "src/cutil/debug.cpp"
Import "src/cutil/efio.cpp"
Import "src/cutil/emalloc.cpp"
Import "src/cutil/freelist.cpp"
Import "src/cutil/globals.cpp"
Import "src/cutil/listio.cpp"
Import "src/cutil/oldheap.cpp"
Import "src/cutil/oldlist.cpp"
Import "src/cutil/structures.cpp"
Import "src/cutil/tessarray.cpp"
Import "src/cutil/tordvars.cpp"

Import "src/dict/choices.cpp"
Import "src/dict/trie.cpp"
Import "src/dict/context.cpp"
Import "src/dict/dawg.cpp"
Import "src/dict/hyphen.cpp"
Import "src/dict/lookdawg.cpp"
Import "src/dict/makedawg.cpp"
Import "src/dict/permdawg.cpp"
Import "src/dict/permngram.cpp"
Import "src/dict/permnum.cpp"
Import "src/dict/permute.cpp"
Import "src/dict/reduce.cpp"
Import "src/dict/states.cpp"
Import "src/dict/stopper.cpp"

Import "src/pageseg/leptonica_pageseg_interface.cpp"
Import "src/pageseg/leptonica_pageseg.cpp"
Import "src/pageseg/pageseg.cpp"

Import "src/image/bitstrm.cpp"
Import "src/image/svshowim.cpp"
Import "src/image/imgbmp.cpp"
Import "src/image/imgio.cpp"
Import "src/image/imgs.cpp"
Import "src/image/imgtiff.cpp"

Import "src/textord/blkocc.cpp"
Import "src/textord/wordseg.cpp"
Import "src/textord/drawedg.cpp"
Import "src/textord/drawtord.cpp"
Import "src/textord/edgblob.cpp"
Import "src/textord/edgloop.cpp"
Import "src/textord/fpchop.cpp"
Import "src/textord/gap_map.cpp"
Import "src/textord/makerow.cpp"
Import "src/textord/oldbasel.cpp"
Import "src/textord/pithsync.cpp"
Import "src/textord/pitsync1.cpp"
Import "src/textord/scanedg.cpp"
Import "src/textord/sortflts.cpp"
Import "src/textord/topitch.cpp"
Import "src/textord/tordmain.cpp"
Import "src/textord/tospace.cpp"
Import "src/textord/tovars.cpp"
Import "src/textord/underlin.cpp"

Import "src/wordrec/associate.cpp"
Import "src/wordrec/wordclass.cpp"
Import "src/wordrec/badwords.cpp"
Import "src/wordrec/bestfirst.cpp"
Import "src/wordrec/chop.cpp"
Import "src/wordrec/chopper.cpp"
Import "src/wordrec/closed.cpp"
Import "src/wordrec/djmenus.cpp"
Import "src/wordrec/drawfx.cpp"
Import "src/wordrec/findseam.cpp"
Import "src/wordrec/gradechop.cpp"
Import "src/wordrec/heuristic.cpp"
Import "src/wordrec/makechop.cpp"
Import "src/wordrec/matchtab.cpp"
Import "src/wordrec/matrix.cpp"
Import "src/wordrec/metrics.cpp"
Import "src/wordrec/mfvars.cpp"
Import "src/wordrec/msmenus.cpp"
Import "src/wordrec/olutil.cpp"
Import "src/wordrec/outlines.cpp"
Import "src/wordrec/pieces.cpp"
Import "src/wordrec/plotedges.cpp"
Import "src/wordrec/plotseg.cpp"
Import "src/wordrec/render.cpp"
Import "src/wordrec/seam.cpp"
Import "src/wordrec/split.cpp"
Import "src/wordrec/tally.cpp"
Import "src/wordrec/tessinit.cpp"
Import "src/wordrec/tface.cpp"

Import "src/ccmain/werdit.cpp"
Import "src/ccmain/adaptions.cpp"
Import "src/ccmain/applybox.cpp"
Import "src/ccmain/baseapi.cpp"
Import "src/ccmain/blobcmp.cpp"
Import "src/ccmain/callnet.cpp"
Import "src/ccmain/charcut.cpp"
Import "src/ccmain/charsample.cpp"
Import "src/ccmain/control.cpp"
Import "src/ccmain/docqual.cpp"
Import "src/ccmain/expandblob.cpp"
Import "src/ccmain/fixspace.cpp"
Import "src/ccmain/fixxht.cpp"
Import "src/ccmain/imgscale.cpp"
Import "src/ccmain/matmatch.cpp"
Import "src/ccmain/output.cpp"
Import "src/ccmain/pagewalk.cpp"
Import "src/ccmain/paircmp.cpp"
Import "src/ccmain/pgedit.cpp"
Import "src/ccmain/reject.cpp"
Import "src/ccmain/scaleimg.cpp"
Import "src/ccmain/tessbox.cpp"
Import "src/ccmain/tessedit.cpp"
Import "src/ccmain/tessembedded.cpp"
Import "src/ccmain/tesseractmain.cpp"
Import "src/ccmain/tessvars.cpp"
Import "src/ccmain/tfacepp.cpp"
Import "src/ccmain/tstruct.cpp"
Import "src/ccmain/varabled.cpp"

Import "src/viewer/scrollview.cpp"
Import "src/viewer/svutil.cpp"
Import "src/viewer/svmnode.cpp"
Import "src/viewer/svpaint.cpp"

Import "glue.cpp"
