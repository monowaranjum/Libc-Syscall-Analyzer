; ModuleID = 'src/complex/cacosf.c'
source_filename = "src/complex/cacosf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define <2 x float> @cacosf(<2 x float> noundef %0) local_unnamed_addr #0 {
  %2 = tail call <2 x float> @casinf(<2 x float> noundef %0) #3
  %3 = extractelement <2 x float> %2, i64 0
  %4 = extractelement <2 x float> %2, i64 1
  %5 = tail call float @llvm.experimental.constrained.fsub.f32(float 0x3FF921FB60000000, float %3, metadata !"round.dynamic", metadata !"fpexcept.ignore") #4
  %6 = fneg float %4
  %7 = insertelement <2 x float> undef, float %5, i64 0
  %8 = insertelement <2 x float> %7, float %6, i64 1
  ret <2 x float> %8
}

; Function Attrs: optsize
declare <2 x float> @casinf(<2 x float> noundef) local_unnamed_addr #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fsub.f32(float, float, metadata, metadata) #2

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="64" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }
attributes #4 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}