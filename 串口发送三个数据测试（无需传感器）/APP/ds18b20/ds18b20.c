#include "DS18B20.h"  
#include "SysTick.h"
#include "stdio.h" // printf?  
  
#define DS18B20_GPIO_NUM                 GPIO_Pin_11  
#define DS18B20_GPIO_X                  GPIOG  
#define RCC_APB2Periph_DS18B20_GPIO_X   RCC_APB2Periph_GPIOG  
  
#define DS18B20_DQ_OUT_Low          GPIO_ResetBits(DS18B20_GPIO_X,DS18B20_GPIO_NUM)   
#define DS18B20_DQ_OUT_High         GPIO_SetBits(DS18B20_GPIO_X,DS18B20_GPIO_NUM)   
#define DS18B20_DQ_IN               GPIO_ReadInputDataBit(DS18B20_GPIO_X,DS18B20_GPIO_NUM)   
  
#define MaxSensorNum 8  
unsigned char DS18B20_ID[MaxSensorNum][8];  // ????????DS18B20_ID???,?????????????????  
unsigned char DS18B20_SensorNum;            // ?????????(?1??,????1??1?,8??8?)  
  
// ??DS18B20???I/O?  
void DS18B20_GPIO_Config(void)  
{  
    GPIO_InitTypeDef GPIO_InitStructure;  
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_DS18B20_GPIO_X, ENABLE);  
    GPIO_InitStructure.GPIO_Pin = DS18B20_GPIO_NUM;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_Init(DS18B20_GPIO_X, &GPIO_InitStructure);  
    GPIO_SetBits(DS18B20_GPIO_X, DS18B20_GPIO_NUM);  
}  
  
// ????  
void DS18B20_Mode_IPU(void)  
{  
    GPIO_InitTypeDef GPIO_InitStructure;  
    GPIO_InitStructure.GPIO_Pin = DS18B20_GPIO_NUM;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IPU;  
    GPIO_Init(DS18B20_GPIO_X, &GPIO_InitStructure);  
}  
  
// ????  
void DS18B20_Mode_Out(void)  
{  
    GPIO_InitTypeDef GPIO_InitStructure;  
    GPIO_InitStructure.GPIO_Pin = DS18B20_GPIO_NUM;  
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;  
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;  
    GPIO_Init(DS18B20_GPIO_X, &GPIO_InitStructure);  
  
}  
  
// ??,???????????  
void DS18B20_Rst(void)  
{  
    DS18B20_Mode_Out();  
    DS18B20_DQ_OUT_Low;     // ????480us????????  
    delay_us(480);  
    DS18B20_DQ_OUT_High;    // ????????,??????  
    delay_us(15);  
}  
  
// ????????????????????????????,??15~60us???????????  
u8 DS18B20_Answer_Check(void)  
{  
    u8 delay = 0;  
    DS18B20_Mode_IPU(); // ?????????  
    // ??????(??60~240us?????? )???  
    // ??100us?,??????,????,??:?????????????,??15~60us???????????  
    while (DS18B20_DQ_IN&&delay < 100)  
    {  
        delay++;  
        delay_us(1);  
    }  
    // ??100us?,????????,????  
    if (delay >= 100)//Hu200  
        return 1;  
    else  
        delay = 0;  
    // ?????,????????240us  
    while (!DS18B20_DQ_IN&&delay < 240)  
    {  
        delay++;  
        delay_us(1);  
    }  
    if (delay >= 240)  
        return 1;  
    return 0;  
}  
  
// ?DS18B20??1??  
u8 DS18B20_Read_Bit(void)  
{  
    u8 data;  
    DS18B20_Mode_Out();  
    DS18B20_DQ_OUT_Low; // ??????:??????? >1us <15us ??????  
    delay_us(2);  
    DS18B20_DQ_OUT_High;  
    delay_us(12);  
    DS18B20_Mode_IPU();// ?????,????,????????????  
    if (DS18B20_DQ_IN)  
        data = 1;  
    else  
        data = 0;  
    delay_us(50);  
    return data;  
}  
  
// ?DS18B20??2??  
u8 DS18B20_Read_2Bit(void)//??? ???  
{  
    u8 i;  
    u8 dat = 0;  
    for (i = 2; i > 0; i--)  
    {  
        dat = dat << 1;  
        DS18B20_Mode_Out();  
        DS18B20_DQ_OUT_Low;  
        delay_us(2);  
        DS18B20_DQ_OUT_High;  
        DS18B20_Mode_IPU();  
        delay_us(12);  
        if (DS18B20_DQ_IN)  dat |= 0x01;  
        delay_us(50);  
    }  
    return dat;  
}  
  
// ?DS18B20??1???  
u8 DS18B20_Read_Byte(void)  // read one byte  
{  
    u8 i, j, dat;  
    dat = 0;  
    for (i = 0; i < 8; i++)  
    {  
        j = DS18B20_Read_Bit();  
        dat = (dat) | (j << i);  
    }  
    return dat;  
}  
  
// ?1??DS18B20  
void DS18B20_Write_Bit(u8 dat)  
{  
    DS18B20_Mode_Out();  
    if (dat)  
    {  
        DS18B20_DQ_OUT_Low;// Write 1  
        delay_us(2);  
        DS18B20_DQ_OUT_High;  
        delay_us(60);  
    }  
    else  
    {  
        DS18B20_DQ_OUT_Low;// Write 0  
        delay_us(60);  
        DS18B20_DQ_OUT_High;  
        delay_us(2);  
    }  
}  
  
// ?1???DS18B20  
void DS18B20_Write_Byte(u8 dat)  
{  
    u8 j;  
    u8 testb;  
    DS18B20_Mode_Out();  
    for (j = 1; j <= 8; j++)  
    {  
        testb = dat & 0x01;  
        dat = dat >> 1;  
        if (testb)  
        {  
            DS18B20_DQ_OUT_Low;// ?1  
            delay_us(10);  
            DS18B20_DQ_OUT_High;  
            delay_us(50);  
        }  
        else  
        {  
            DS18B20_DQ_OUT_Low;// ?0  
            delay_us(60);  
            DS18B20_DQ_OUT_High;// ????  
            delay_us(2);  
        }  
    }  
}  
  
//???DS18B20?IO?,????DS???  
u8 DS18B20_Init(void)  
{  
    DS18B20_GPIO_Config();  
    DS18B20_Rst();  
    return DS18B20_Answer_Check();  
}  
  
// ?ds18b20?????,??:0.1C,?????(-550~1250),Temperature1????????  
float DS18B20_Get_Temp(u8 i)  
{  
    //u8 flag;  
    u8 j;//?????  
    u8 TL, TH;  
    short Temperature;  
    float Temperature1;  
    DS18B20_Rst();  
    DS18B20_Answer_Check();  
    DS18B20_Write_Byte(0xcc);// skip rom  
    DS18B20_Write_Byte(0x44);// convert  
    DS18B20_Rst();  
    DS18B20_Answer_Check();  
  
    // DS18B20_Write_Byte(0xcc);// skip rom  
    //??ID,i???  
    DS18B20_Write_Byte(0x55);  
    for (j = 0; j < 8; j++)  
    {  
        DS18B20_Write_Byte(DS18B20_ID[i][j]);  
    }  
  
    DS18B20_Write_Byte(0xbe);// convert  
    TL = DS18B20_Read_Byte(); // LSB     
    TH = DS18B20_Read_Byte(); // MSB    
    if (TH & 0xfc)  
    {  
        //flag=1;  
        Temperature = (TH << 8) | TL;  
        Temperature1 = (~Temperature) + 1;  
        Temperature1 *= 0.0625;  
    }  
    else  
    {  
        //flag=0;  
        Temperature1 = ((TH << 8) | TL)*0.0625;  
    }  
    return Temperature1;  
}  
  
// ????ROM  
void DS18B20_Search_Rom(void)  
{  
    u8 k, l, chongtuwei, m, n, num;  
    u8 zhan[5];  
    u8 ss[64];  
    u8 tempp;  
    l = 0;  
    num = 0;  
    do  
    {  
        DS18B20_Rst(); //??:???????  
        delay_us(480); //480?720  
        DS18B20_Write_Byte(0xf0);  
        for (m = 0; m < 8; m++)  
        {  
            u8 s = 0;  
            for (n = 0; n < 8; n++)  
            {  
                k = DS18B20_Read_2Bit();//?????  
  
                k = k & 0x03;  
                s >>= 1;  
                if (k == 0x01)//01??????0 ?0 ???0?????  
                {  
                    DS18B20_Write_Bit(0);  
                    ss[(m * 8 + n)] = 0;  
                }  
                else if (k == 0x02)//??????1 ?1 ???1?????  
                {  
                    s = s | 0x80;  
                    DS18B20_Write_Bit(1);  
                    ss[(m * 8 + n)] = 1;  
                }  
                else if (k == 0x00)//??????00 ???? ?????  
                {  
                    //??????????0 ????????? ?????1  
                    chongtuwei = m * 8 + n + 1;  
                    if (chongtuwei > zhan[l])  
                    {  
                        DS18B20_Write_Bit(0);  
                        ss[(m * 8 + n)] = 0;  
                        zhan[++l] = chongtuwei;  
                    }  
                    else if (chongtuwei < zhan[l])  
                    {  
                        s = s | ((ss[(m * 8 + n)] & 0x01) << 7);  
                        DS18B20_Write_Bit(ss[(m * 8 + n)]);  
                    }  
                    else if (chongtuwei == zhan[l])  
                    {  
                        s = s | 0x80;  
                        DS18B20_Write_Bit(1);  
                        ss[(m * 8 + n)] = 1;  
                        l = l - 1;  
                    }  
                }  
                else  
                {  
                    //?????  
                }  
            }  
            tempp = s;  
            DS18B20_ID[num][m] = tempp; // ??????ID  
        }  
        num = num + 1;// ????????  
    } while (zhan[l] != 0 && (num < MaxSensorNum));  
    DS18B20_SensorNum = num;  
    //printf("DS18B20_SensorNum=%d\r\n",DS18B20_SensorNum);  
}  