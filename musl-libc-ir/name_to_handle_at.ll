; ModuleID = 'src/linux/name_to_handle_at.c'
source_filename = "src/linux/name_to_handle_at.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.file_handle = type { i32, i32, [0 x i8] }

; Function Attrs: nounwind optsize strictfp
define i32 @name_to_handle_at(i32 noundef %0, i8* noundef %1, %struct.file_handle* noundef %2, i32* noundef %3, i32 noundef %4) local_unnamed_addr #0 {
  %6 = sext i32 %0 to i64
  %7 = ptrtoint i8* %1 to i64
  %8 = ptrtoint %struct.file_handle* %2 to i64
  %9 = ptrtoint i32* %3 to i64
  %10 = sext i32 %4 to i64
  %11 = tail call i64 asm sideeffect "syscall", "={ax},{ax},{di},{si},{dx},{r10},{r8},~{rcx},~{r11},~{memory},~{dirflag},~{fpsr},~{flags}"(i64 303, i64 %6, i64 %7, i64 %8, i64 %9, i64 %10) #2, !srcloc !3
  %12 = tail call i64 @__syscall_ret(i64 noundef %11) #3
  %13 = trunc i64 %12 to i32
  ret i32 %13
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind strictfp }
attributes #3 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 67160}