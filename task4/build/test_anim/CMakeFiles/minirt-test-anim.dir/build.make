# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hpc2022/bda2001/AlexandrGavrilko/task2/build

# Include any dependencies generated for this target.
include test_anim/CMakeFiles/minirt-test-anim.dir/depend.make

# Include the progress variables for this target.
include test_anim/CMakeFiles/minirt-test-anim.dir/progress.make

# Include the compile flags for this target's objects.
include test_anim/CMakeFiles/minirt-test-anim.dir/flags.make

test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o: test_anim/CMakeFiles/minirt-test-anim.dir/flags.make
test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o: /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src/test_anim/minirt_test_anim.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hpc2022/bda2001/AlexandrGavrilko/task2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o"
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o -c /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src/test_anim/minirt_test_anim.cpp

test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.i"
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src/test_anim/minirt_test_anim.cpp > CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.i

test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.s"
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src/test_anim/minirt_test_anim.cpp -o CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.s

# Object files for target minirt-test-anim
minirt__test__anim_OBJECTS = \
"CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o"

# External object files for target minirt-test-anim
minirt__test__anim_EXTERNAL_OBJECTS =

test_anim/minirt-test-anim: test_anim/CMakeFiles/minirt-test-anim.dir/minirt_test_anim.cpp.o
test_anim/minirt-test-anim: test_anim/CMakeFiles/minirt-test-anim.dir/build.make
test_anim/minirt-test-anim: minirt/libminirt.a
test_anim/minirt-test-anim: test_anim/CMakeFiles/minirt-test-anim.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hpc2022/bda2001/AlexandrGavrilko/task2/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable minirt-test-anim"
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/minirt-test-anim.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test_anim/CMakeFiles/minirt-test-anim.dir/build: test_anim/minirt-test-anim

.PHONY : test_anim/CMakeFiles/minirt-test-anim.dir/build

test_anim/CMakeFiles/minirt-test-anim.dir/clean:
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim && $(CMAKE_COMMAND) -P CMakeFiles/minirt-test-anim.dir/cmake_clean.cmake
.PHONY : test_anim/CMakeFiles/minirt-test-anim.dir/clean

test_anim/CMakeFiles/minirt-test-anim.dir/depend:
	cd /home/hpc2022/bda2001/AlexandrGavrilko/task2/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src /home/hpc2022/bda2001/AlexandrGavrilko/task2/mini-rt/src/test_anim /home/hpc2022/bda2001/AlexandrGavrilko/task2/build /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim /home/hpc2022/bda2001/AlexandrGavrilko/task2/build/test_anim/CMakeFiles/minirt-test-anim.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test_anim/CMakeFiles/minirt-test-anim.dir/depend

