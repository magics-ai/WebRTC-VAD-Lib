# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

# Default target executed when no arguments are given to make.
default_target: all
.PHONY : default_target

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/gkx/magics_vad

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/gkx/magics_vad

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/bin/ccmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache
.PHONY : edit_cache/fast

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache
.PHONY : rebuild_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /home/gkx/magics_vad/CMakeFiles /home/gkx/magics_vad/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /home/gkx/magics_vad/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean
.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named vad

# Build rule for target.
vad: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 vad
.PHONY : vad

# fast build rule for target.
vad/fast:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/build
.PHONY : vad/fast

vad.o: vad.c.o
.PHONY : vad.o

# target to build an object file
vad.c.o:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad.c.o
.PHONY : vad.c.o

vad.i: vad.c.i
.PHONY : vad.i

# target to preprocess a source file
vad.c.i:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad.c.i
.PHONY : vad.c.i

vad.s: vad.c.s
.PHONY : vad.s

# target to generate assembly for a file
vad.c.s:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad.c.s
.PHONY : vad.c.s

vad_process.o: vad_process.c.o
.PHONY : vad_process.o

# target to build an object file
vad_process.c.o:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad_process.c.o
.PHONY : vad_process.c.o

vad_process.i: vad_process.c.i
.PHONY : vad_process.i

# target to preprocess a source file
vad_process.c.i:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad_process.c.i
.PHONY : vad_process.c.i

vad_process.s: vad_process.c.s
.PHONY : vad_process.s

# target to generate assembly for a file
vad_process.c.s:
	$(MAKE) -f CMakeFiles/vad.dir/build.make CMakeFiles/vad.dir/vad_process.c.s
.PHONY : vad_process.c.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... vad"
	@echo "... vad.o"
	@echo "... vad.i"
	@echo "... vad.s"
	@echo "... vad_process.o"
	@echo "... vad_process.i"
	@echo "... vad_process.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -H$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

