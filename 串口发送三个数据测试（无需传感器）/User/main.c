#include "stm32f10x.h"  
#include "stdio.h"  
#include "string.h"//strlen?memset??  
#include "USART.h"  
#include "SysTick.h"
#include "DS18B20.h"  
  
extern unsigned char DS18B20_ID[8][8];//???????ID???  
extern unsigned char DS18B20_SensorNum;  
  
int main(void)  
{   
	  u32 times;
	  double ii;
    char buff[24];
	  u8 num=0;
    float t=0.002;	
	  float temp[]={0};
		SysTick_Init(72);   
    USART1_Init(9600); 
    while(1)  
   {      
				printf("%8f %8f %8f\r\n",t,t+10,t+15);        

        delay_ms(500);			
   }
		 
}	

		
		
		
		
		
		
		
	