This PWM works on two registers
1. Timer Count and
2. Timer Compare Registers
and an output PWM_OUT.

- Both the counters are 16 bit registers.
- The timer count and the Timer Compare values will be written through APB to the PWM module
- After reset, the PWM_OUT will be high. 
- If the timer count value reach timer compare value then the PWM_OUT will be driven low.


Duty Cycle:

-The duty cycle is controlled through timer compare value. The width of the PWM_OUT signal is equal to the timer count clock cycles.

Example,

TIMx_CNT = 1000; // Timer count and the width of the PWM_OUT pulse.

TIMx_CMPR = 500;

Duty cycle = TIMx_CMPR/TIMx_CNT * 100.
i.e., 50% duty cycle.
