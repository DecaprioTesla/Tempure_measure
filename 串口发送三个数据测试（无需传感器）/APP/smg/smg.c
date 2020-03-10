#include "smg.h"




void SMG_Init()
{
	GPIO_InitTypeDef GPIO_InitStructure;  //����һ���ṹ�������������ʼ��GPIO
	/* ����GPIOʱ�� */
	RCC_APB2PeriphClockCmd(SMG_PORT_RCC,ENABLE);

	
	/*  ����GPIO��ģʽ��IO�� */
	GPIO_InitStructure.GPIO_Pin=SMG_PIN;	  //ѡ����Ҫ���õ�IO��
	GPIO_InitStructure.GPIO_Mode=GPIO_Mode_Out_PP;
	GPIO_InitStructure.GPIO_Speed=GPIO_Speed_50MHz;
	GPIO_Init(SMG_PORT,&GPIO_InitStructure);		/* ��ʼ��GPIO */
}

