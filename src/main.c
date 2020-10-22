#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <math.h>

#define PARAMETER_FROM_LENGTH 7
#define PARAMETER_TO_LENGTH 5
#define ARRAY_MAX_SIZE 100

extern void sort(long long *array, const unsigned int array_size);

int is_number(const char *str)
{
	const unsigned int str_length = strlen(str);
	
	unsigned int i = 0;
	
	if (str[0] == '-' || str[0] == '+')
		i++;
	
	if (i == str_length)
		return 0;
	
	for (; i < str_length; i++)
		if (str[i] < '0' || str[i] > '9')
			return 0;
	
	return 1;
}

int read_parameters(const int argc, char **argv, int *from, int *to, int *is_from_set, int *is_to_set)
{
	if (argc >= 4)
		return -2;

	for (int i = 0; i < argc; i++)
	{	
		unsigned int parameter_size = strlen(argv[i]);
	
		if (parameter_size >= PARAMETER_FROM_LENGTH && !strncmp("--from=", argv[i], PARAMETER_FROM_LENGTH))
		{
			if (*is_from_set)
				return -3;
			
			*is_from_set = 1;
			
			if (!is_number(argv[i] + PARAMETER_FROM_LENGTH))
				*from = 0;
			else
				*from = atoi(argv[i] + PARAMETER_FROM_LENGTH);
		}
		
		if (parameter_size >= PARAMETER_TO_LENGTH && !strncmp("--to=", argv[i], PARAMETER_TO_LENGTH))
		{
			if (*is_to_set)
				return -3;
			
			*is_to_set = 1;
			
			if (!is_number(argv[i] + PARAMETER_TO_LENGTH))
				*to = 0;
			else
				*to = atoi(argv[i] + PARAMETER_TO_LENGTH);
		}
	}

	if (argc > 1 && !*is_from_set && !*is_to_set)
		return -4;
	else
		if (!*is_from_set && !*is_to_set)
			return -1;
		
	return 0;
}

unsigned int read_array(long long *array, const int from, const int to, const int is_from_set, const int is_to_set)
{
	unsigned int array_size = 0;
	long long input_element;
	
	while (scanf("%lld", &input_element) == 1)
	{
		if (input_element >= to && is_to_set)
			fprintf(stderr, "%lld ", input_element);
			
		if (input_element <= from && is_from_set)
			fprintf(stdout, "%lld ", input_element);
		
		if (!(input_element >= to && is_to_set) && !(input_element <= from && is_from_set))
		{
			array[array_size] = input_element;
			array_size++;
		}
	}
	
	return array_size;
}

unsigned int compare_arrays(const long long *first_array, const long long *second_array, const unsigned int compare_to)
{
	unsigned int number_of_unequal_elements = 0;
	
	for (unsigned int i = 0; i < compare_to; i++)
		if (first_array[i] != second_array[i])
			number_of_unequal_elements++;
	
	return number_of_unequal_elements;
}

int main(int argc, char **argv)
{
	long long array[ARRAY_MAX_SIZE];
	int to = 0, from = 0, is_from_set = 0, is_to_set = 0, read_parameters_return_code = read_parameters(argc, argv, &from, &to, &is_from_set, &is_to_set);
	
	if (read_parameters_return_code)
		return read_parameters_return_code;
	
	unsigned int array_size = read_array(array, from, to, is_from_set, is_to_set);
	
	long long array_copy[ARRAY_MAX_SIZE];
	memcpy(array_copy, array, ARRAY_MAX_SIZE * sizeof(long long));
	sort(array, array_size);
	
	unsigned int return_code = compare_arrays(array, array_copy, array_size);
	
	return return_code;
}
