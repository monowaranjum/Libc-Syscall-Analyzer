; ModuleID = 'src/string/wmemchr.c'
source_filename = "src/string/wmemchr.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind readonly strictfp
define i32* @wmemchr(i32* noundef readonly %0, i32 noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = icmp eq i64 %2, 0
  br i1 %4, label %14, label %5

5:                                                ; preds = %3, %10
  %6 = phi i64 [ %11, %10 ], [ %2, %3 ]
  %7 = phi i32* [ %12, %10 ], [ %0, %3 ]
  %8 = load i32, i32* %7, align 4, !tbaa !3
  %9 = icmp eq i32 %8, %1
  br i1 %9, label %14, label %10

10:                                               ; preds = %5
  %11 = add i64 %6, -1
  %12 = getelementptr inbounds i32, i32* %7, i64 1
  %13 = icmp eq i64 %11, 0
  br i1 %13, label %14, label %5

14:                                               ; preds = %5, %10, %3
  %15 = phi i32* [ null, %3 ], [ null, %10 ], [ %7, %5 ]
  ret i32* %15
}

attributes #0 = { nofree norecurse nosync nounwind readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
