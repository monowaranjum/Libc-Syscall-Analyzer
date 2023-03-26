; ModuleID = 'src/thread/pthread_getname_np.c'
source_filename = "src/thread/pthread_getname_np.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__pthread = type { %struct.__pthread*, i64*, %struct.__pthread*, %struct.__pthread*, i64, i64, i32, i32, i32, i32, i8, i8, i8, i8*, i64, i8*, i64, i64, i8*, %struct.__ptcb*, i8**, %struct.anon, i32, i32, %struct.__locale_struct*, [1 x i32], i8*, i8* }
%struct.__ptcb = type { void (i8*)*, i8*, %struct.__ptcb* }
%struct.anon = type { i8*, i64, i8* }
%struct.__locale_struct = type { [6 x %struct.__locale_map*] }
%struct.__locale_map = type opaque

@.str = private unnamed_addr constant [24 x i8] c"/proc/self/task/%d/comm\00", align 1

; Function Attrs: nounwind optsize strictfp
define i32 @pthread_getname_np(%struct.__pthread* noundef readonly %0, i8* noundef %1, i64 noundef %2) local_unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca [34 x i8], align 16
  %6 = bitcast i32* %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* nonnull %6) #4
  %7 = getelementptr inbounds [34 x i8], [34 x i8]* %5, i64 0, i64 0
  call void @llvm.lifetime.start.p0i8(i64 34, i8* nonnull %7) #4
  %8 = icmp ult i64 %2, 16
  br i1 %8, label %45, label %9

9:                                                ; preds = %3
  %10 = tail call %struct.__pthread* @pthread_self() #5
  %11 = icmp eq %struct.__pthread* %10, %0
  br i1 %11, label %12, label %19

12:                                               ; preds = %9
  %13 = ptrtoint i8* %1 to i64
  %14 = tail call i32 (i32, ...) @prctl(i32 noundef 16, i64 noundef %13, i64 noundef 0, i64 noundef 0, i64 noundef 0) #6
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %45, label %16

16:                                               ; preds = %12
  %17 = tail call i32* @___errno_location() #5
  %18 = load i32, i32* %17, align 4, !tbaa !3
  br label %45

19:                                               ; preds = %9
  %20 = getelementptr inbounds %struct.__pthread, %struct.__pthread* %0, i64 0, i32 6
  %21 = load i32, i32* %20, align 8, !tbaa !7
  %22 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* noundef nonnull %7, i64 noundef 34, i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str, i64 0, i64 0), i32 noundef %21) #6
  %23 = call i32 @pthread_setcancelstate(i32 noundef 1, i32* noundef nonnull %4) #6
  %24 = call i32 (i8*, i32, ...) @open(i8* noundef nonnull %7, i32 noundef 524288) #6
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %35, label %26

26:                                               ; preds = %19
  %27 = call i64 @read(i32 noundef %24, i8* noundef %1, i64 noundef %2) #6
  %28 = icmp eq i64 %27, -1
  br i1 %28, label %29, label %32

29:                                               ; preds = %26
  %30 = tail call i32* @___errno_location() #5
  %31 = load i32, i32* %30, align 4, !tbaa !3
  br label %38

32:                                               ; preds = %26
  %33 = add i64 %27, -1
  %34 = getelementptr inbounds i8, i8* %1, i64 %33
  store i8 0, i8* %34, align 1, !tbaa !12
  br label %38

35:                                               ; preds = %19
  %36 = tail call i32* @___errno_location() #5
  %37 = load i32, i32* %36, align 4, !tbaa !3
  br label %41

38:                                               ; preds = %29, %32
  %39 = phi i32 [ 0, %32 ], [ %31, %29 ]
  %40 = call i32 @close(i32 noundef %24) #6
  br label %41

41:                                               ; preds = %35, %38
  %42 = phi i32 [ %39, %38 ], [ %37, %35 ]
  %43 = load i32, i32* %4, align 4, !tbaa !3
  %44 = call i32 @pthread_setcancelstate(i32 noundef %43, i32* noundef null) #6
  br label %45

45:                                               ; preds = %16, %12, %3, %41
  %46 = phi i32 [ %42, %41 ], [ 34, %3 ], [ %18, %16 ], [ 0, %12 ]
  call void @llvm.lifetime.end.p0i8(i64 34, i8* nonnull %7) #4
  call void @llvm.lifetime.end.p0i8(i64 4, i8* nonnull %6) #4
  ret i32 %46
}

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare %struct.__pthread* @pthread_self() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @prctl(i32 noundef, ...) local_unnamed_addr #3

; Function Attrs: mustprogress nofree nosync nounwind optsize readnone willreturn
declare hidden i32* @___errno_location() local_unnamed_addr #2

; Function Attrs: optsize
declare i32 @snprintf(i8* noundef, i64 noundef, i8* noundef, ...) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @pthread_setcancelstate(i32 noundef, i32* noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @open(i8* noundef, i32 noundef, ...) local_unnamed_addr #3

; Function Attrs: optsize
declare i64 @read(i32 noundef, i8* noundef, i64 noundef) local_unnamed_addr #3

; Function Attrs: optsize
declare i32 @close(i32 noundef) local_unnamed_addr #3

; Function Attrs: argmemonly mustprogress nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind optsize readnone willreturn "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { optsize "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind strictfp }
attributes #5 = { nobuiltin nounwind optsize readnone strictfp willreturn "no-builtins" }
attributes #6 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !4, i64 48}
!8 = !{!"__pthread", !9, i64 0, !9, i64 8, !9, i64 16, !9, i64 24, !10, i64 32, !10, i64 40, !4, i64 48, !4, i64 52, !4, i64 56, !4, i64 60, !5, i64 64, !5, i64 65, !5, i64 66, !5, i64 66, !9, i64 72, !10, i64 80, !9, i64 88, !10, i64 96, !10, i64 104, !9, i64 112, !9, i64 120, !9, i64 128, !11, i64 136, !4, i64 160, !4, i64 164, !9, i64 168, !5, i64 176, !9, i64 184, !9, i64 192}
!9 = !{!"any pointer", !5, i64 0}
!10 = !{!"long", !5, i64 0}
!11 = !{!"", !9, i64 0, !10, i64 8, !9, i64 16}
!12 = !{!5, !5, i64 0}