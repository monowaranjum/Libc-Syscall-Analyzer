; ModuleID = 'src/string/wcsdup.c'
source_filename = "src/string/wcsdup.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind strictfp
define i32* @wcsdup(i32* noundef %0) local_unnamed_addr #0 {
  %2 = tail call i64 @wcslen(i32* noundef %0) #2
  %3 = add i64 %2, 1
  %4 = shl i64 %3, 2
  %5 = tail call i8* @malloc(i64 noundef %4) #2
  %6 = icmp eq i8* %5, null
  br i1 %6, label %10, label %7

7:                                                ; preds = %1
  %8 = bitcast i8* %5 to i32*
  %9 = tail call i32* @wmemcpy(i32* noundef nonnull %8, i32* noundef %0, i64 noundef %3) #2
  br label %10

10:                                               ; preds = %1, %7
  %11 = phi i32* [ %9, %7 ], [ null, %1 ]
  ret i32* %11
}

declare i64 @wcslen(i32* noundef) local_unnamed_addr #1

declare i8* @malloc(i64 noundef) local_unnamed_addr #1

declare i32* @wmemcpy(i32* noundef, i32* noundef, i64 noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}