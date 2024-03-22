#include "lists.h"

/**
 * add_dnodeint - Adds a new node at the beginning of a dlistint_t list.
 * @head: A pointer to the head of the dlistint_t list.
 * @n: The integer for the new node to contain.
 *
 * Return: If the function fails - NULL.
 *         Otherwise - the address of the new node.
 */

dlistint_t *add_dnodeint(dlistint_t **head, const int n)
{
dlistint_t *new; /*new node*/

new = malloc(sizeof(dlistint_t)); /*Allocate memo for new node*/
if (new == NULL)
{
return (NULL);/*NULL at failure*/
}
/*Assign node values at beginning of dll*/
new->n = n;
new->next = *head;
new->prev = NULL;
if (*head != NULL)/*if dll has at least 1 node already*/
{
(*head)->prev = new;
}
*head = new; /*assign head of dll to the new node*/
return (new);
}
