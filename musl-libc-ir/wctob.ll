; ModuleID = 'src/multibyte/wctob.c'
source_filename = "src/multibyte/wctob.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type { i8*, i64, [24 x i8], %struct.__locale_map* }

; Function Attrs: nofree nounwind optsize readonly strictfp
define i32 @wctob(i32 noundef %0) local_unnamed_addr #0 {
  %2 = icmp ult i32 %0, 128
  br i1 %2, label %16, label %3

3:                                                ; preds = %1
  %4 = tail call i64 asm "mov %fs:0,$0", "=r,~{dirflag},~{fpsr},~{flags}"() #1, !srcloc !3
  %5 = inttoptr i64 %4 to %struct.__pthread*
  %6 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %5, i64 0, i32 24
  %7 = load %struct.__locale_struct*, %struct.__locale_struct** %6, align 8, !tbaa !4
  %8 = getelementptr inbounds %struct.__locale_struct, %struct.__locale_struct* %7, i64 0, i32 0, i64 0
  %9 = load %struct.__locale_map*, %struct.__locale_map** %8, align 8, !tbaa !12
  %10 = icmp eq %struct.__locale_map* %9, null
  %11 = and i32 %0, -128
  %12 = icmp eq i32 %11, 57216
  %13 = and i1 %12, %10
  %14 = and i32 %0, 255
  %15 = select i1 %13, i32 %14, i32 -1
  br label %16

16:                                               ; preds = %3, %1
  %17 = phi i32 [ %0, %1 ], [ %15, %3 ]
  ret i32 %17
}

attributes #0 = { nofree nounwind optsize readonly strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind readnone strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{i64 268699}
!4 = !{!5, !6, i64 168}
!5 = !{!"__pthread", !6, i64 0, !6, i64 8, !6, i64 16, !6, i64 24, !9, i64 32, !9, i64 40, !10, i64 48, !10, i64 52, !10, i64 56, !10, i64 60, !7, i64 64, !7, i64 65, !7, i64 66, !7, i64 66, !6, i64 72, !9, i64 80, !6, i64 88, !9, i64 96, !9, i64 104, !6, i64 112, !6, i64 120, !6, i64 128, !11, i64 136, !10, i64 160, !10, i64 164, !6, i64 168, !7, i64 176, !6, i64 184, !6, i64 192}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"long", !7, i64 0}
!10 = !{!"int", !7, i64 0}
!11 = !{!"", !6, i64 0, !9, i64 8, !6, i64 16}
!12 = !{!6, !6, i64 0}
