; ModuleID = 'src/signal/sigorset.c'
source_filename = "src/signal/sigorset.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__sigset_t = type { [16 x i64] }

; Function Attrs: mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn
define i32 @sigorset(%struct.__sigset_t* nocapture noundef writeonly %0, %struct.__sigset_t* nocapture noundef readonly %1, %struct.__sigset_t* nocapture noundef readonly %2) local_unnamed_addr #0 {
  %4 = getelementptr %struct.__sigset_t, %struct.__sigset_t* %0, i64 0, i32 0, i64 0
  %5 = getelementptr %struct.__sigset_t, %struct.__sigset_t* %1, i64 0, i32 0, i64 0
  %6 = getelementptr %struct.__sigset_t, %struct.__sigset_t* %2, i64 0, i32 0, i64 0
  %7 = load i64, i64* %5, align 8, !tbaa !3
  %8 = load i64, i64* %6, align 8, !tbaa !3
  %9 = or i64 %8, %7
  store i64 %9, i64* %4, align 8, !tbaa !3
  ret i32 0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind optsize strictfp willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"long", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}