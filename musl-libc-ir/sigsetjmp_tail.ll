; ModuleID = 'src/signal/sigsetjmp_tail.c'
source_filename = "src/signal/sigsetjmp_tail.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__jmp_buf_tag = type { [8 x i64], i64, [16 x i64] }

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__sigsetjmp_tail(%struct.__jmp_buf_tag* noundef %0, i32 noundef returned %1) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.__jmp_buf_tag, %struct.__jmp_buf_tag* %0, i64 0, i32 2, i64 0
  %4 = icmp eq i32 %1, 0
  %5 = ptrtoint i64* %3 to i64
  %6 = select i1 %4, i64 0, i64 %5
  %7 = select i1 %4, i64 %5, i64 0
  %8 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 14, i64 2, i64 %6, i64 %7, i64 8) #1, !srcloc !3
  ret i32 %1
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 74029}
