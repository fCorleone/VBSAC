; ModuleID = './415_15.c'
source_filename = "./415_15.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@GLOBAL_CONST_TRUE = constant i32 1, align 4
@GLOBAL_CONST_FALSE = constant i32 0, align 4
@GLOBAL_CONST_FIVE = constant i32 5, align 4
@globalTrue = global i32 1, align 4
@globalFalse = global i32 0, align 4
@globalFive = global i32 5, align 4
@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"%ld\0A\00", align 1
@staticTrue = internal global i32 1, align 4
@staticFalse = internal global i32 0, align 4
@.str.3 = private unnamed_addr constant [21 x i8] c"Benign, fixed string\00", align 1

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrue() #0 !dbg !24 {
entry:
  ret i32 1, !dbg !27
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsFalse() #0 !dbg !28 {
entry:
  ret i32 0, !dbg !29
}

; Function Attrs: nounwind uwtable
define i32 @globalReturnsTrueOrFalse() #0 !dbg !30 {
entry:
  %call = call i32 @rand() #4, !dbg !31
  %rem = srem i32 %call, 2, !dbg !32
  ret i32 %rem, !dbg !33
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: nounwind uwtable
define void @printHexCharLine(i8 signext %charHex) #0 !dbg !34 {
entry:
  %charHex.addr = alloca i8, align 1
  store i8 %charHex, i8* %charHex.addr, align 1
  call void @llvm.dbg.declare(metadata i8* %charHex.addr, metadata !38, metadata !39), !dbg !40
  %0 = load i8, i8* %charHex.addr, align 1, !dbg !41
  %conv = sext i8 %0 to i32, !dbg !42
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %conv), !dbg !43
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

declare i32 @printf(i8*, ...) #3

; Function Attrs: nounwind uwtable
define void @printLine(i8* %line) #0 !dbg !45 {
entry:
  %line.addr = alloca i8*, align 8
  store i8* %line, i8** %line.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %line.addr, metadata !50, metadata !39), !dbg !51
  %0 = load i8*, i8** %line.addr, align 8, !dbg !52
  %cmp = icmp ne i8* %0, null, !dbg !54
  br i1 %cmp, label %if.then, label %if.end, !dbg !55

if.then:                                          ; preds = %entry
  %1 = load i8*, i8** %line.addr, align 8, !dbg !56
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.1, i32 0, i32 0), i8* %1), !dbg !58
  br label %if.end, !dbg !59

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !60
}

; Function Attrs: nounwind uwtable
define void @printIntLine(i32 %intNumber) #0 !dbg !61 {
entry:
  %intNumber.addr = alloca i32, align 4
  store i32 %intNumber, i32* %intNumber.addr, align 4
  call void @llvm.dbg.declare(metadata i32* %intNumber.addr, metadata !64, metadata !39), !dbg !65
  %0 = load i32, i32* %intNumber.addr, align 4, !dbg !66
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %0), !dbg !67
  ret void, !dbg !68
}

; Function Attrs: nounwind uwtable
define void @printLongLine(i64 %longIntNumber) #0 !dbg !69 {
entry:
  %longIntNumber.addr = alloca i64, align 8
  store i64 %longIntNumber, i64* %longIntNumber.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %longIntNumber.addr, metadata !72, metadata !39), !dbg !73
  %0 = load i64, i64* %longIntNumber.addr, align 8, !dbg !74
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i64 %0), !dbg !75
  ret void, !dbg !76
}

; Function Attrs: nounwind uwtable
define void @bad15() #0 !dbg !77 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !80, metadata !39), !dbg !81
  store i64* null, i64** %data, align 8, !dbg !82
  %0 = load i32, i32* @staticTrue, align 4, !dbg !83
  %tobool = icmp ne i32 %0, 0, !dbg !83
  br i1 %tobool, label %if.then, label %if.end2, !dbg !85

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !86
  %1 = bitcast i8* %call to i64*, !dbg !88
  store i64* %1, i64** %data, align 8, !dbg !89
  %2 = load i64*, i64** %data, align 8, !dbg !90
  %cmp = icmp eq i64* %2, null, !dbg !92
  br i1 %cmp, label %if.then1, label %if.end, !dbg !93

if.then1:                                         ; preds = %if.then
  br label %if.end5, !dbg !94

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !96
  %4 = bitcast i64* %3 to i8*, !dbg !96
  call void @free(i8* %4) #4, !dbg !97
  br label %if.end2, !dbg !98

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticTrue, align 4, !dbg !99
  %tobool3 = icmp ne i32 %5, 0, !dbg !99
  br i1 %tobool3, label %if.then4, label %if.end5, !dbg !101

if.then4:                                         ; preds = %if.end2
  %6 = load i64*, i64** %data, align 8, !dbg !102
  %7 = bitcast i64* %6 to i8*, !dbg !102
  call void @free(i8* %7) #4, !dbg !104
  br label %if.end5, !dbg !105

if.end5:                                          ; preds = %if.then1, %if.then4, %if.end2
  ret void, !dbg !106
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define void @good15() #0 !dbg !107 {
entry:
  %data = alloca i64*, align 8
  call void @llvm.dbg.declare(metadata i64** %data, metadata !108, metadata !39), !dbg !109
  store i64* null, i64** %data, align 8, !dbg !110
  %0 = load i32, i32* @staticTrue, align 4, !dbg !111
  %tobool = icmp ne i32 %0, 0, !dbg !111
  br i1 %tobool, label %if.then, label %if.end2, !dbg !113

if.then:                                          ; preds = %entry
  %call = call noalias i8* @malloc(i64 800) #4, !dbg !114
  %1 = bitcast i8* %call to i64*, !dbg !116
  store i64* %1, i64** %data, align 8, !dbg !117
  %2 = load i64*, i64** %data, align 8, !dbg !118
  %cmp = icmp eq i64* %2, null, !dbg !120
  br i1 %cmp, label %if.then1, label %if.end, !dbg !121

if.then1:                                         ; preds = %if.then
  br label %if.end5, !dbg !122

if.end:                                           ; preds = %if.then
  %3 = load i64*, i64** %data, align 8, !dbg !124
  %4 = bitcast i64* %3 to i8*, !dbg !124
  call void @free(i8* %4) #4, !dbg !125
  br label %if.end2, !dbg !126

if.end2:                                          ; preds = %if.end, %entry
  %5 = load i32, i32* @staticFalse, align 4, !dbg !127
  %tobool3 = icmp ne i32 %5, 0, !dbg !127
  br i1 %tobool3, label %if.then4, label %if.else, !dbg !129

if.then4:                                         ; preds = %if.end2
  call void @printLine(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.3, i32 0, i32 0)), !dbg !130
  br label %if.end5, !dbg !132

if.else:                                          ; preds = %if.end2
  br label %if.end5

if.end5:                                          ; preds = %if.then1, %if.else, %if.then4
  ret void, !dbg !133
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 !dbg !134 {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @good15(), !dbg !135
  call void @bad15(), !dbg !136
  ret i32 1, !dbg !137
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!21, !22}
!llvm.ident = !{!23}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 3.9.0 (tags/RELEASE_390/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, globals: !10)
!1 = !DIFile(filename: "415_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!2 = !{}
!3 = !{!4, !5, !6}
!4 = !DIBasicType(name: "int", size: 32, align: 32, encoding: DW_ATE_signed)
!5 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64, align: 64)
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64, align: 64)
!7 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !8, line: 197, baseType: !9)
!8 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/sys/types.h", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!9 = !DIBasicType(name: "long int", size: 64, align: 64, encoding: DW_ATE_signed)
!10 = !{!11, !14, !15, !16, !17, !18, !19, !20}
!11 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_TRUE", scope: !0, file: !12, line: 10, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_TRUE)
!12 = !DIFile(filename: "./415_15.c", directory: "/home/guzuxing/Documents/VBSAC/benchmark/Juliet_Test_Suite/415")
!13 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!14 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FALSE", scope: !0, file: !12, line: 11, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FALSE)
!15 = distinct !DIGlobalVariable(name: "GLOBAL_CONST_FIVE", scope: !0, file: !12, line: 12, type: !13, isLocal: false, isDefinition: true, variable: i32* @GLOBAL_CONST_FIVE)
!16 = distinct !DIGlobalVariable(name: "globalTrue", scope: !0, file: !12, line: 14, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalTrue)
!17 = distinct !DIGlobalVariable(name: "globalFalse", scope: !0, file: !12, line: 15, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFalse)
!18 = distinct !DIGlobalVariable(name: "globalFive", scope: !0, file: !12, line: 16, type: !4, isLocal: false, isDefinition: true, variable: i32* @globalFive)
!19 = distinct !DIGlobalVariable(name: "staticTrue", scope: !0, file: !12, line: 57, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticTrue)
!20 = distinct !DIGlobalVariable(name: "staticFalse", scope: !0, file: !12, line: 58, type: !4, isLocal: true, isDefinition: true, variable: i32* @staticFalse)
!21 = !{i32 2, !"Dwarf Version", i32 4}
!22 = !{i32 2, !"Debug Info Version", i32 3}
!23 = !{!"clang version 3.9.0 (tags/RELEASE_390/final)"}
!24 = distinct !DISubprogram(name: "globalReturnsTrue", scope: !12, file: !12, line: 18, type: !25, isLocal: false, isDefinition: true, scopeLine: 19, isOptimized: false, unit: !0, variables: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!4}
!27 = !DILocation(line: 20, column: 5, scope: !24)
!28 = distinct !DISubprogram(name: "globalReturnsFalse", scope: !12, file: !12, line: 23, type: !25, isLocal: false, isDefinition: true, scopeLine: 24, isOptimized: false, unit: !0, variables: !2)
!29 = !DILocation(line: 25, column: 5, scope: !28)
!30 = distinct !DISubprogram(name: "globalReturnsTrueOrFalse", scope: !12, file: !12, line: 28, type: !25, isLocal: false, isDefinition: true, scopeLine: 29, isOptimized: false, unit: !0, variables: !2)
!31 = !DILocation(line: 30, column: 13, scope: !30)
!32 = !DILocation(line: 30, column: 20, scope: !30)
!33 = !DILocation(line: 30, column: 5, scope: !30)
!34 = distinct !DISubprogram(name: "printHexCharLine", scope: !12, file: !12, line: 33, type: !35, isLocal: false, isDefinition: true, scopeLine: 34, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{null, !37}
!37 = !DIBasicType(name: "char", size: 8, align: 8, encoding: DW_ATE_signed_char)
!38 = !DILocalVariable(name: "charHex", arg: 1, scope: !34, file: !12, line: 33, type: !37)
!39 = !DIExpression()
!40 = !DILocation(line: 33, column: 29, scope: !34)
!41 = !DILocation(line: 35, column: 25, scope: !34)
!42 = !DILocation(line: 35, column: 20, scope: !34)
!43 = !DILocation(line: 35, column: 5, scope: !34)
!44 = !DILocation(line: 36, column: 1, scope: !34)
!45 = distinct !DISubprogram(name: "printLine", scope: !12, file: !12, line: 38, type: !46, isLocal: false, isDefinition: true, scopeLine: 39, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!46 = !DISubroutineType(types: !47)
!47 = !{null, !48}
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64, align: 64)
!49 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !37)
!50 = !DILocalVariable(name: "line", arg: 1, scope: !45, file: !12, line: 38, type: !48)
!51 = !DILocation(line: 38, column: 30, scope: !45)
!52 = !DILocation(line: 40, column: 8, scope: !53)
!53 = distinct !DILexicalBlock(scope: !45, file: !12, line: 40, column: 8)
!54 = !DILocation(line: 40, column: 13, scope: !53)
!55 = !DILocation(line: 40, column: 8, scope: !45)
!56 = !DILocation(line: 42, column: 24, scope: !57)
!57 = distinct !DILexicalBlock(scope: !53, file: !12, line: 41, column: 5)
!58 = !DILocation(line: 42, column: 9, scope: !57)
!59 = !DILocation(line: 43, column: 5, scope: !57)
!60 = !DILocation(line: 44, column: 1, scope: !45)
!61 = distinct !DISubprogram(name: "printIntLine", scope: !12, file: !12, line: 46, type: !62, isLocal: false, isDefinition: true, scopeLine: 47, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!62 = !DISubroutineType(types: !63)
!63 = !{null, !4}
!64 = !DILocalVariable(name: "intNumber", arg: 1, scope: !61, file: !12, line: 46, type: !4)
!65 = !DILocation(line: 46, column: 24, scope: !61)
!66 = !DILocation(line: 48, column: 20, scope: !61)
!67 = !DILocation(line: 48, column: 5, scope: !61)
!68 = !DILocation(line: 49, column: 1, scope: !61)
!69 = distinct !DISubprogram(name: "printLongLine", scope: !12, file: !12, line: 51, type: !70, isLocal: false, isDefinition: true, scopeLine: 52, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!70 = !DISubroutineType(types: !71)
!71 = !{null, !7}
!72 = !DILocalVariable(name: "longIntNumber", arg: 1, scope: !69, file: !12, line: 51, type: !7)
!73 = !DILocation(line: 51, column: 29, scope: !69)
!74 = !DILocation(line: 53, column: 21, scope: !69)
!75 = !DILocation(line: 53, column: 5, scope: !69)
!76 = !DILocation(line: 54, column: 1, scope: !69)
!77 = distinct !DISubprogram(name: "bad15", scope: !12, file: !12, line: 62, type: !78, isLocal: false, isDefinition: true, scopeLine: 63, isOptimized: false, unit: !0, variables: !2)
!78 = !DISubroutineType(types: !79)
!79 = !{null}
!80 = !DILocalVariable(name: "data", scope: !77, file: !12, line: 64, type: !6)
!81 = !DILocation(line: 64, column: 15, scope: !77)
!82 = !DILocation(line: 66, column: 10, scope: !77)
!83 = !DILocation(line: 67, column: 8, scope: !84)
!84 = distinct !DILexicalBlock(scope: !77, file: !12, line: 67, column: 8)
!85 = !DILocation(line: 67, column: 8, scope: !77)
!86 = !DILocation(line: 69, column: 27, scope: !87)
!87 = distinct !DILexicalBlock(scope: !84, file: !12, line: 68, column: 5)
!88 = !DILocation(line: 69, column: 16, scope: !87)
!89 = !DILocation(line: 69, column: 14, scope: !87)
!90 = !DILocation(line: 70, column: 13, scope: !91)
!91 = distinct !DILexicalBlock(scope: !87, file: !12, line: 70, column: 13)
!92 = !DILocation(line: 70, column: 18, scope: !91)
!93 = !DILocation(line: 70, column: 13, scope: !87)
!94 = !DILocation(line: 70, column: 27, scope: !95)
!95 = !DILexicalBlockFile(scope: !91, file: !12, discriminator: 1)
!96 = !DILocation(line: 72, column: 14, scope: !87)
!97 = !DILocation(line: 72, column: 9, scope: !87)
!98 = !DILocation(line: 73, column: 5, scope: !87)
!99 = !DILocation(line: 74, column: 8, scope: !100)
!100 = distinct !DILexicalBlock(scope: !77, file: !12, line: 74, column: 8)
!101 = !DILocation(line: 74, column: 8, scope: !77)
!102 = !DILocation(line: 77, column: 14, scope: !103)
!103 = distinct !DILexicalBlock(scope: !100, file: !12, line: 75, column: 5)
!104 = !DILocation(line: 77, column: 9, scope: !103)
!105 = !DILocation(line: 78, column: 5, scope: !103)
!106 = !DILocation(line: 79, column: 1, scope: !77)
!107 = distinct !DISubprogram(name: "good15", scope: !12, file: !12, line: 85, type: !78, isLocal: false, isDefinition: true, scopeLine: 86, isOptimized: false, unit: !0, variables: !2)
!108 = !DILocalVariable(name: "data", scope: !107, file: !12, line: 87, type: !6)
!109 = !DILocation(line: 87, column: 15, scope: !107)
!110 = !DILocation(line: 89, column: 10, scope: !107)
!111 = !DILocation(line: 90, column: 8, scope: !112)
!112 = distinct !DILexicalBlock(scope: !107, file: !12, line: 90, column: 8)
!113 = !DILocation(line: 90, column: 8, scope: !107)
!114 = !DILocation(line: 92, column: 27, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !12, line: 91, column: 5)
!116 = !DILocation(line: 92, column: 16, scope: !115)
!117 = !DILocation(line: 92, column: 14, scope: !115)
!118 = !DILocation(line: 93, column: 13, scope: !119)
!119 = distinct !DILexicalBlock(scope: !115, file: !12, line: 93, column: 13)
!120 = !DILocation(line: 93, column: 18, scope: !119)
!121 = !DILocation(line: 93, column: 13, scope: !115)
!122 = !DILocation(line: 93, column: 27, scope: !123)
!123 = !DILexicalBlockFile(scope: !119, file: !12, discriminator: 1)
!124 = !DILocation(line: 95, column: 14, scope: !115)
!125 = !DILocation(line: 95, column: 9, scope: !115)
!126 = !DILocation(line: 96, column: 5, scope: !115)
!127 = !DILocation(line: 97, column: 8, scope: !128)
!128 = distinct !DILexicalBlock(scope: !107, file: !12, line: 97, column: 8)
!129 = !DILocation(line: 97, column: 8, scope: !107)
!130 = !DILocation(line: 100, column: 9, scope: !131)
!131 = distinct !DILexicalBlock(scope: !128, file: !12, line: 98, column: 5)
!132 = !DILocation(line: 101, column: 5, scope: !131)
!133 = !DILocation(line: 108, column: 1, scope: !107)
!134 = distinct !DISubprogram(name: "main", scope: !12, file: !12, line: 112, type: !25, isLocal: false, isDefinition: true, scopeLine: 112, isOptimized: false, unit: !0, variables: !2)
!135 = !DILocation(line: 113, column: 2, scope: !134)
!136 = !DILocation(line: 114, column: 5, scope: !134)
!137 = !DILocation(line: 115, column: 5, scope: !134)
