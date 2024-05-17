# DICE Labs GO1

## Description
This codebase houses all of Dicelab's custom code for the Unitree Go1 robot dog. 

## File Structure
`scpt` - See here for some scripts regarding codebase management
`src`  - Source code of project

### Programming Summary
The majority of this codebase is written in python and shouldn't require any compilation to be used. Some parts are written in C# for binding to the Unity code, but the dog simulation code can be found at another codebase [here](https://github.com/DiceLabs/dog_sim). For more information on code functionality please see the [src](src) directory.

### Running/Execution
To clone the source code use this command

    git clone https://github.com/DiceLabs/go1

I prefer to keep executable and source code separate so I have an [install.sh](scpt/install.sh) script that will place all python files into a ROBOT_LIB directory. Run that script in the root directory of this project so that it copies all files to be executed. This directory is (should be) included in the PATH environment variable from the ~/.bashrc so it can serve as a convenient single point of storage for executed code. To run any script, you can omit the interpreter and any other syntax, just write the file name directly into the terminal - ie. executable.py 
