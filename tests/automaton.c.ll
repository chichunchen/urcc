; ModuleID = 'automaton.c.bc'
target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-pc-linux-gnu"

@.str = private unnamed_addr constant [32 x i8] c"Give me a number (-1 to quit): \00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str2 = private unnamed_addr constant [39 x i8] c"I need a number that's either 0 or 1.\0A\00", align 1
@.str3 = private unnamed_addr constant [36 x i8] c"You gave me an even number of 0's.\0A\00", align 1
@.str4 = private unnamed_addr constant [36 x i8] c"You gave me an even number of 1's.\0A\00", align 1
@.str5 = private unnamed_addr constant [32 x i8] c"I therefore accept this input.\0A\00", align 1
@.str6 = private unnamed_addr constant [35 x i8] c"You gave me an odd number of 1's.\0A\00", align 1
@.str7 = private unnamed_addr constant [32 x i8] c"I therefore reject this input.\0A\00", align 1
@.str8 = private unnamed_addr constant [35 x i8] c"You gave me an odd number of 0's.\0A\00", align 1

define i32 @getnextdigit() nounwind {
entry:
  %n = alloca i32, align 4
  br label %while.body

while.body:                                       ; preds = %if.end, %entry
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str, i32 0, i32 0))
  %call1 = call i32 (i8*, ...)* @__isoc99_scanf(i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i32* %n)
  %0 = load i32* %n, align 4
  %cmp = icmp sle i32 -1, %0
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %1 = load i32* %n, align 4
  %cmp2 = icmp sge i32 1, %1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %while.end

if.end:                                           ; preds = %land.lhs.true, %while.body
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([39 x i8]* @.str2, i32 0, i32 0))
  br label %while.body

while.end:                                        ; preds = %if.then
  %2 = load i32* %n, align 4
  ret i32 %2
}

declare i32 @printf(i8*, ...)

declare i32 @__isoc99_scanf(i8*, ...)

define void @state_0() nounwind {
entry:
  %a = alloca i32, align 4
  %call = call i32 @getnextdigit()
  store i32 %call, i32* %a, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp eq i32 -1, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str5, i32 0, i32 0))
  br label %if.end9

if.end:                                           ; preds = %entry
  %1 = load i32* %a, align 4
  %cmp4 = icmp eq i32 0, %1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @state_2()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %2 = load i32* %a, align 4
  %cmp7 = icmp eq i32 1, %2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @state_1()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6, %if.then
  ret void
}

define void @state_2() nounwind {
entry:
  %a = alloca i32, align 4
  %call = call i32 @getnextdigit()
  store i32 %call, i32* %a, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp eq i32 -1, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str8, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str4, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %if.end9

if.end:                                           ; preds = %entry
  %1 = load i32* %a, align 4
  %cmp4 = icmp eq i32 0, %1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @state_0()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %2 = load i32* %a, align 4
  %cmp7 = icmp eq i32 1, %2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @state_3()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6, %if.then
  ret void
}

define void @state_1() nounwind {
entry:
  %a = alloca i32, align 4
  %call = call i32 @getnextdigit()
  store i32 %call, i32* %a, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp eq i32 -1, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str3, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %if.end9

if.end:                                           ; preds = %entry
  %1 = load i32* %a, align 4
  %cmp4 = icmp eq i32 0, %1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @state_3()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %2 = load i32* %a, align 4
  %cmp7 = icmp eq i32 1, %2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @state_0()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6, %if.then
  ret void
}

define void @state_3() nounwind {
entry:
  %a = alloca i32, align 4
  %call = call i32 @getnextdigit()
  store i32 %call, i32* %a, align 4
  %0 = load i32* %a, align 4
  %cmp = icmp eq i32 -1, %0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %call1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str8, i32 0, i32 0))
  %call2 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([35 x i8]* @.str6, i32 0, i32 0))
  %call3 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str7, i32 0, i32 0))
  br label %if.end9

if.end:                                           ; preds = %entry
  %1 = load i32* %a, align 4
  %cmp4 = icmp eq i32 0, %1
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @state_1()
  br label %if.end6

if.end6:                                          ; preds = %if.then5, %if.end
  %2 = load i32* %a, align 4
  %cmp7 = icmp eq i32 1, %2
  br i1 %cmp7, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end6
  call void @state_2()
  br label %if.end9

if.end9:                                          ; preds = %if.then8, %if.end6, %if.then
  ret void
}

define i32 @main() nounwind {
entry:
  call void @state_0()
  ret i32 0
}
