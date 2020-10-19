#include <stdio.h>
#include <windows.h>
#include <iostream>


extern "C" int calc(int j, char l, int h);

extern "C" void print(int arg1)
{
	printf("Result is: %d\n", arg1);
}

//extern "C"
//{
//	int K;
//};

void main(void)
{
	int a = 0, B;     // 4 байти
	char b = 0;       // 1 байт
	short int d = 0;  // 2 байти

	//K = 1556;

	int res = 0;

	std::cout << "Enter A:" << std::endl;
	std::cin >> a;

	std::cout << "Enter B:" << std::endl;
	std::cin >> B;

	std::cout << "Enter D:" << std::endl;
	std::cin >> d;

	b = B;

	res = calc(a, b, d);

}