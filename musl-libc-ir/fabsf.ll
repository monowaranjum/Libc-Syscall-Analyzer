; ModuleID = 'src/math/x86_64/fabsf.c'
source_filename = "src/math/x86_64/fabsf.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize readnone strictfp
define float @fabsf(float noundef %0) local_unnamed_addr #0 {
  %2 = tail call float asm "pcmpeqd $0, $0", "=x,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  %3 = tail call float asm "psrld   $$1, $0", "=x,0,~{dirflag},~{fpsr},~{flags}"(float %2) #1, !srcloc !4
  %4 = tail call float asm "andps   $1, $0", "=x,x,0,~{dirflag},~{fpsr},~{flags}"(float %3, float %0) #1, !srcloc !5
  ret float %4
}

attributes #0 = { nofree nosync nounwind optsize readnone strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 64}
!4 = !{i64 122}
!5 = !{i64 181}
