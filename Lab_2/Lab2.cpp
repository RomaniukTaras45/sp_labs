#include <stdio.h>
#include <windows.h>
#include <iostream>


extern "C" int calc(int j, char l, int h);

//extern "C" 
//{
//	int K = 1556;
//}

void main(void)
{
	int a = 0, B; // 4
	char b = 0; // 1
	short int d = 0; // 2

	int res = 0;

	std::cout << "Enter A:" << std::endl;
	std::cin >> a;

	std::cout << "Enter B:" << std::endl;
	std::cin >> B;

	std::cout << "Enter D:" << std::endl;
	std::cin >> d;
	
	b = B;
	
	res = calc(a, b, d);

	printf("Result is: %d\n", res);
}