; ModuleID = 'src/network/recvfrom.c'
source_filename = "src/network/recvfrom.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sockaddr = type { i16, [14 x i8] }

; Function Attrs: nounwind optsize strictfp
define i64 @recvfrom(i32 noundef %0, i8* noalias noundef %1, i64 noundef %2, i32 noundef %3, %struct.sockaddr* noalias noundef %4, i32* noalias noundef %5) local_unnamed_addr #0 {
  %7 = sext i32 %0 to i64
  %8 = ptrtoint i8* %1 to i64
  %9 = sext i32 %3 to i64
  %10 = ptrtoint %struct.sockaddr* %4 to i64
  %11 = ptrtoint i32* %5 to i64
  %12 = tail call i64 @__syscall_cp(i64 noundef 45, i64 noundef %7, i64 noundef %8, i64 noundef %2, i64 noundef %9, i64 noundef %10, i64 noundef %11) #2
  %13 = tail call i64 @__syscall_ret(i64 noundef %12) #2
  ret i64 %13
}

; Function Attrs: optsize
declare hidden i64 @__syscall_ret(i64 noundef) local_unnamed_addr #1

; Function Attrs: optsize
declare hidden i64 @__syscall_cp(i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}