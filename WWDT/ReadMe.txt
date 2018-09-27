This project describes the design of a Window Watch Dog Timer as an APB Peripheral.
Watch Dog Timer: It is a basic downcounter/upcounter which can be used to handle fault conditions in any microcontroller.
This Timer will reset the CPU which lead to system reset, if it is hanging unnecessarily with one job.

In any Soc there could be two types of watch dog timers 
a. IWDT (Independant Watch Dog Timer), which can work independantly with own RC oscillator 
b. WWDT ( Window Watch Dog Timer), which is dependant on the Peripheral clock through APB.

Functionality:
A watch dog timer will be resetted if the system got reset. And by default it will be disabled.
Whenever the watch dog is enabled, it will start down counting the value in it's register. 
And when the counter register values reach the window register value then a reset interrupt will be given to the CPU.
The counter need to be continuously reset from the application.
