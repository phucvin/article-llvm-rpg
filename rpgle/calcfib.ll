; ModuleID = 'rpgle/CALCFIB.rpgle'
source_filename = "rpgle/CALCFIB.rpgle"
target triple = "x86_64-pc-linux-gnu"

@A = common global i64 0
@B = common global i64 0
@COUNT = common global i64 0
@NBR = common global i64 0
@RESULT = common global i64 0
@pstr = private unnamed_addr constant [5 x i8] c"%lld\0A"

define i32 @FIB(i32 %0) {
entry:
  store i64 0, i64* @COUNT, align 4
  %1 = load i64, i64* @NBR, align 4
  %2 = icmp eq i64 %1, 0
  br i1 %2, label %when_true, label %when_false

when_true:                                        ; preds = %entry
  store i64 0, i64* @RESULT, align 4
  br label %endselect

when_false:                                       ; preds = %entry
  %3 = load i64, i64* @NBR, align 4
  %4 = icmp eq i64 %3, 1
  br i1 %4, label %when_true1, label %other2

when_true1:                                       ; preds = %when_false
  store i64 1, i64* @RESULT, align 4
  br label %endselect

other2:                                           ; preds = %when_false
  store i64 2, i64* @COUNT, align 4
  br label %forLoop

forLoop:                                          ; preds = %forLoop, %other2
  %5 = load i64, i64* @A, align 4
  %6 = load i64, i64* @B, align 4
  %addtmp = add i64 %5, %6
  store i64 %addtmp, i64* @RESULT, align 4
  %7 = load i64, i64* @B, align 4
  store i64 %7, i64* @A, align 4
  %8 = load i64, i64* @RESULT, align 4
  store i64 %8, i64* @B, align 4
  %9 = load i64, i64* @RESULT, align 4
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @pstr, i32 0, i32 0), i64 %9)
  %11 = load i64, i64* @COUNT, align 4
  %addtmp3 = add i64 %11, 1
  store i64 %addtmp3, i64* @COUNT, align 4
  %12 = load i64, i64* @COUNT, align 4
  %13 = load i64, i64* @NBR, align 4
  %14 = icmp sle i64 %12, %13
  br i1 %14, label %forLoop, label %exitLoop

exitLoop:                                         ; preds = %forLoop
  br label %endselect

endselect:                                        ; preds = %exitLoop, %when_true1, %when_true
  ret i32 0
}

define i32 @main(i32 %0) {
entry:
  call void @INZ()
  store i64 55, i64* @NBR, align 4
  %1 = call i32 @FIB(i32 0)
  %2 = load i64, i64* @RESULT, align 4
  %3 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @pstr, i32 0, i32 0), i64 %2)
  ret i32 0
}

declare i32 @printf(i8*, ...)

define void @INZ() {
  store i64 0, i64* @A, align 4
  %1 = load i64, i64* @A, align 4
  %addtmp = add i64 %1, 1
  store i64 %addtmp, i64* @B, align 4
  store i64 0, i64* @RESULT, align 4
  ret void
}
