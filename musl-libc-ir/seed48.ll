; ModuleID = 'src/prng/seed48.c'
source_filename = "src/prng/seed48.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@seed48.p = internal global [3 x i16] zeroinitializer, align 2
@__seed48 = external hidden global [7 x i16], align 2

; Function Attrs: nounwind optsize strictfp
define i16* @seed48(i16* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i8* @memcpy(i8* noundef bitcast ([3 x i16]* @seed48.p to i8*), i8* noundef bitcast ([7 x i16]* @__seed48 to i8*), i64 noundef 6) #2
  %3 = bitcast i16* %0 to i8*
  %4 = tail call i8* @memcpy(i8* noundef bitcast ([7 x i16]* @__seed48 to i8*), i8* noundef %3, i64 noundef 6) #2
  ret i16* getelementptr inbounds ([3 x i16], [3 x i16]* @seed48.p, i64 0, i64 0)
}

; Function Attrs: optsize
declare i8* @memcpy(i8* noundef, i8* noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
