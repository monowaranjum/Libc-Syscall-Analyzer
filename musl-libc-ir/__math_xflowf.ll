; ModuleID = 'src/math/__math_xflowf.c'
source_filename = "src/math/__math_xflowf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nounwind optsize strictfp
define hidden float @__math_xflowf(i32 noundef %0, float noundef %1) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = icmp eq i32 %0, 0
  %5 = fneg float %1
  %6 = select i1 %4, float %1, float %5
  %7 = bitcast float* %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %7)
  store volatile float %6, float* %3, align 4, !tbaa !3
  %8 = load volatile float, float* %3, align 4, !tbaa !3
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %7)
  %9 = tail call float @llvm.experimental.constrained.fmul.f32(float %8, float %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #3
  ret float %9
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare float @llvm.experimental.constrained.fmul.f32(float, float, metadata, metadata) #1

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nofree nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #3 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"float", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
