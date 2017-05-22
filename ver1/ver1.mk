##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=ver1
ConfigurationName      :=Debug
WorkspacePath          :=C:/github/pongTest
ProjectPath            :=C:/github/pongTest/ver1
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Elev
Date                   :=22/05/2017
CodeLitePath           :=C:/cseapp/CodeLite
LinkerName             :=$(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
SharedObjectLinkerName :=$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi-g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName).elf
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="ver1.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=
LinkOptions            :=  -nostartfiles -T$(ProjectPath)/md407-ram.x
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)gcc $(LibrarySwitch)c_nano 
ArLibs                 :=  "gcc" "c_nano" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)$(CodeLiteDir)/tools/gcc-arm/arm-none-eabi/lib/armv6-m $(LibraryPathSwitch)$(CodeLiteDir)/tools/gcc-arm/lib/gcc/arm-none-eabi/5.4.1/armv6-m 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-ar.exe rcu
CXX      := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-g++.exe
CC       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -mthumb -Wall -march=armv6-m -msoft-float -Wa,-adhln=test.s $(Preprocessors)
ASFLAGS  := 
AS       := $(CodeLiteDir)/tools/gcc-arm/bin/arm-none-eabi-as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\cseapp\CodeLite
Objects0=$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IntermediateDirectory)/ascii_logic.c$(ObjectSuffix) $(IntermediateDirectory)/delay.c$(ObjectSuffix) $(IntermediateDirectory)/display_logic.c$(ObjectSuffix) $(IntermediateDirectory)/game_logic.c$(ObjectSuffix) $(IntermediateDirectory)/geometry.c$(ObjectSuffix) $(IntermediateDirectory)/keyboard_logic.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	arm-none-eabi-objcopy -S -O srec  ./Debug/ver1.elf ./Debug/ver1.s19
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/startup.c$(ObjectSuffix): startup.c $(IntermediateDirectory)/startup.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/startup.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/startup.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/startup.c$(DependSuffix): startup.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/startup.c$(ObjectSuffix) -MF$(IntermediateDirectory)/startup.c$(DependSuffix) -MM startup.c

$(IntermediateDirectory)/startup.c$(PreprocessSuffix): startup.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/startup.c$(PreprocessSuffix)startup.c

$(IntermediateDirectory)/ascii_logic.c$(ObjectSuffix): ascii_logic.c $(IntermediateDirectory)/ascii_logic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/ascii_logic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ascii_logic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ascii_logic.c$(DependSuffix): ascii_logic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ascii_logic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/ascii_logic.c$(DependSuffix) -MM ascii_logic.c

$(IntermediateDirectory)/ascii_logic.c$(PreprocessSuffix): ascii_logic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ascii_logic.c$(PreprocessSuffix)ascii_logic.c

$(IntermediateDirectory)/delay.c$(ObjectSuffix): delay.c $(IntermediateDirectory)/delay.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/delay.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/delay.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/delay.c$(DependSuffix): delay.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/delay.c$(ObjectSuffix) -MF$(IntermediateDirectory)/delay.c$(DependSuffix) -MM delay.c

$(IntermediateDirectory)/delay.c$(PreprocessSuffix): delay.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/delay.c$(PreprocessSuffix)delay.c

$(IntermediateDirectory)/display_logic.c$(ObjectSuffix): display_logic.c $(IntermediateDirectory)/display_logic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/display_logic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/display_logic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/display_logic.c$(DependSuffix): display_logic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/display_logic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/display_logic.c$(DependSuffix) -MM display_logic.c

$(IntermediateDirectory)/display_logic.c$(PreprocessSuffix): display_logic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/display_logic.c$(PreprocessSuffix)display_logic.c

$(IntermediateDirectory)/game_logic.c$(ObjectSuffix): game_logic.c $(IntermediateDirectory)/game_logic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/game_logic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/game_logic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/game_logic.c$(DependSuffix): game_logic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/game_logic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/game_logic.c$(DependSuffix) -MM game_logic.c

$(IntermediateDirectory)/game_logic.c$(PreprocessSuffix): game_logic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/game_logic.c$(PreprocessSuffix)game_logic.c

$(IntermediateDirectory)/geometry.c$(ObjectSuffix): geometry.c $(IntermediateDirectory)/geometry.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/geometry.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/geometry.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/geometry.c$(DependSuffix): geometry.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/geometry.c$(ObjectSuffix) -MF$(IntermediateDirectory)/geometry.c$(DependSuffix) -MM geometry.c

$(IntermediateDirectory)/geometry.c$(PreprocessSuffix): geometry.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/geometry.c$(PreprocessSuffix)geometry.c

$(IntermediateDirectory)/keyboard_logic.c$(ObjectSuffix): keyboard_logic.c $(IntermediateDirectory)/keyboard_logic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/github/pongTest/ver1/keyboard_logic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/keyboard_logic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/keyboard_logic.c$(DependSuffix): keyboard_logic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/keyboard_logic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/keyboard_logic.c$(DependSuffix) -MM keyboard_logic.c

$(IntermediateDirectory)/keyboard_logic.c$(PreprocessSuffix): keyboard_logic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/keyboard_logic.c$(PreprocessSuffix)keyboard_logic.c


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


