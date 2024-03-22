#include "lists.h"

/**
 * dlistint_len - Returns the number of elements in a dlistint_t list.
 * @h: The head of the dlistint_t list.
 * Return: The number of elements in the list.
 * Description: This function returns the number of elements in a dlistint_t
*/

size_t dlistint_len(const dlistint_t *h)
{
size_t i = 0; /*no of elements*/
const dlistint_t *tmp = h; /*pointer to list*/

while (tmp != NULL)
{
tmp = tmp->next; /*pointer to next node*/
i++; /*no of elements + 1*/
}
return (i);

}
