## File Structure

`api` - Glue code to allow communication between different services
`go` - Actual code of components for dog functionality
`serv` - Specific Client/Services instances to start and use components
`utility` - Miscallaneous useful code that doesn't pertain to one system.

## Code Architecture
Each functionality on the robot is abstracted into various 'services'. These services are simply processes that are waiting for requests to be made, when they receive the request, they will call the appropriate callback. This allows a main program to call any functionality it needs at any time by relaying the appropriate message to the appropriate port. Because of this design decision, the robot is basically split into components. This will include things like control, camera, speech, etc... The code that these services actually run specific to the component can be found in the go folder. There is an API or "glue code" that allows all these different services to talk which can be found in the api folder. Each service is then hosted using the API and can be called with the appropriate request which can be found in the serv folder. Finally, the utility folder simply has tools that aren't specific to any component but add to the functionality of the robot. 

## Go1 Mission Overview
There are five main parts to the dog

    - go_srv - Actual API that interacts with the Go1 hardware
    - ar_srv - Activity recognition code which continually runs
    - yolo_srv - Object recognition service for locating humans
    - speak_srv - Text to speech service using pyttsx3 to send audio to BT speaker
    - unity_srv - This is a group of bridge services that allow Unity to communicate with other systems

The unity_srv is made up of these services

    - linear_srv
    - angular_srv
    - vision_srv
    - speech_srv (note this is different than the speak_srv, this doesn't make the dog talk it just allows Unity to make the request)

To "start" the dog, all these services need to be turned on, and then the main Unity script needs to be played
All services can be started separately by name, but there are also scripts I made which fork many at the same time

Here is the most comprehensive way to turn on the dog 

    - Go to go/vision/yolov5 and run python3 yolo_srv_internal.py (this has to be run from here for yolo's dependencies)
    - Run dog.py which will fork unity bridge, activity recognition, and speech services
    - Go to Unity and press the start button

Note that for every run, you will have to ctrl+C and start dog.py