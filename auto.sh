#!/bin/bash
mkdir 0x17-doubly_linked_lists
git add .
git commit -m "Added the folders for more double linked list"
git push
cat << EOF > ./0x17-doubly_linked_lists/0-print_dlistint.c
#include "lists.h"
/**
 * print_dlistint - Prints all the elements of a dlistint_t list.
 * @h: The head of the dlistint_t list.
 *
 * Return: The number of nodes in the list.
 */

size_t print_dlistint(const dlistint_t *h)
{
        size_t i = 0;
        const dlistint_t *tmp = h;

        while (tmp != NULL) /*cycle through list until the last node*/
        {
                printf("%d\n", tmp->n); /*print element*/
                tmp = tmp->next; /*proceed to next node */
                i++; /*no of nodes + 1*/
        }
        return (i);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/1-dlistint_len.c
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
EOF
cat << EOF > ./0x17-doubly_linked_lists/2-add_dnodeint.c
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
EOF
cat << EOF > ./0x17-doubly_linked_lists/3-add_dnodeint_end.c
#include "lists.h"

/**
 * add_dnodeint_end - Adds a new node at the end of a dlistint_t list.
 * @head: A pointer to the head of the dlistint_t list.
 * @n: The integer for the new node to contain.
 *
 * Return: If the function fails - NULL.
 *         Otherwise - the address of the new node.
 */

dlistint_t *add_dnodeint_end(dlistint_t **head, const int n)
{
dlistint_t *new;
dlistint_t *tmp;

new = malloc(sizeof(dlistint_t));
if (new == NULL)
{
return (NULL);
}
new->n = n;
new->next = NULL;
new->prev = NULL;
if (*head == NULL)
{
*head = new;
return (new);
}
tmp = *head;
while (tmp->next != NULL)
{
tmp = tmp->next;
}
tmp->next = new;
new->prev = tmp;
return (new);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/4-free_dlistint.c
#include "lists.h"
/**
 * free_dlistint - frees a doubly linked list
 * @head: pointer to the list to free
 */

void free_dlistint(dlistint_t *head)
{
dlistint_t *tmp;

while (head != NULL)
{
tmp = head;
head = head->next;
free(tmp);
}
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/5-get_dnodeint.c
#include "lists.h"
/**
 * get_dnodeint_at_index - gets the nth node of a doubly linked list
 * @head: pointer to the list
 * @index: index of the node to return
 *
 * Return: address of the node, or if it does not exist, NULL
 */
dlistint_t *get_dnodeint_at_index(dlistint_t *head, unsigned int index)
{
dlistint_t *tmp;
unsigned int i;

tmp = head;
i = 0;
if (head == NULL)
return (NULL);
while (tmp != NULL)
{
if (i == index)
return (tmp);
tmp = tmp->next;
i++;
}
return (NULL);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/6-sum_dlistint.c
#include "lists.h"
/**
 * sum_dlistint - sums the values of all the nodes in a dlistint_t list
 * @head: pointer to the head of the list
 * Return: if the list is empty, return 0
 */

int sum_dlistint(dlistint_t *head)
{
dlistint_t *tmp;
int sum = 0;

tmp = head;
while (tmp != NULL)
{
sum += tmp->n;
tmp = tmp->next;
}
return (sum);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/7-insert_dnodeint.c
#include "lists.h"

/**
 * insert_dnodeint_at_index - inserts a new node at a given position
 * @h: pointer to the list
 * @idx: index of the new node
 * @n: value of the new node
 * Return: address of the new node, or NULL if it fails
 */

dlistint_t *insert_dnodeint_at_index(dlistint_t **h, unsigned int idx, int n)
{
dlistint_t *new;
dlistint_t *tmp;
unsigned int i;

if (h == NULL)
return (NULL);
tmp = *h;
i = 0;
if (idx == 0)
{
new = malloc(sizeof(dlistint_t));
if (new == NULL)
return (NULL);
new->n = n;
new->next = *h;
new->prev = NULL;
if (*h != NULL)
(*h)->prev = new;
*h = new;
return (new);
}
while (tmp != NULL)
{
if (i == idx - 1)
{
new = malloc(sizeof(dlistint_t));
if (new == NULL)
return (NULL);
new->n = n;
new->next = tmp->next;
new->prev = tmp;
tmp->next = new;
if (new->next != NULL)
new->next->prev = new;
return (new);
}
tmp = tmp->next;
i++;
}
return (NULL);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/8-delete_dnodeint.c
#include "lists.h"

/**
 * delete_dnodeint_at_index- deletes the node at a given index
 * @head: pointer to the list
 * @index: index of the node to delete
 * Return: 1 if it succeeded, -1 if it failed
*/
int delete_dnodeint_at_index(dlistint_t **head, unsigned int index)
{
dlistint_t *tmp;
dlistint_t *tmp2;
unsigned int i;

if (head == NULL)
return (-1);
if (*head == NULL)
return (-1);
if (index == 0)
{
tmp = *head;
*head = (*head)->next;
if (*head != NULL)
(*head)->prev = NULL;
free(tmp);
return (1);
}
tmp = *head;
i = 0;
while (tmp != NULL)
{
if (i == index - 1)
{
tmp2 = tmp->next;
tmp->next = tmp->next->next;
if (tmp->next != NULL)
tmp->next->prev = tmp;
free(tmp2);
return (1);
}
tmp = tmp->next;
i++;
}
return (-1);

return (1);
}
EOF
cat << EOF > ./0x17-doubly_linked_lists/lists.h
#ifndef LIST_H
#define LIST_H

#include <stdlib.h>
#include <stdio.h>
/**
* struct dlistint_s - doubly linked list
* @n: integer
* @prev: points to the previous node
* @next: points to the next node
*
* Description: doubly linked list node structure
*
*/
typedef struct dlistint_s
{
        int n;

        struct dlistint_s *prev;
        struct dlistint_s *next;
} dlistint_t;

size_t print_dlistint(const dlistint_t *h);
size_t dlistint_len(const dlistint_t *h);
dlistint_t *add_dnodeint(dlistint_t **head, const int n);

dlistint_t *add_dnodeint_end(dlistint_t **head, const int n);

void free_dlistint(dlistint_t *head);
dlistint_t *get_dnodeint_at_index(dlistint_t *head, unsigned int index);

int sum_dlistint(dlistint_t *head);
dlistint_t *insert_dnodeint_at_index(dlistint_t **h, unsigned int idx, int n);

int delete_dnodeint_at_index(dlistint_t **head, unsigned int index);

#endif
EOF
cat << EOF > ./0x17-doubly_linked_lists/README.md
This is a project on double linked list in C
And im enjoying it so much
EOF
chmod u+x *
chmod u-x README.md
git add .
git commit -m "Completed project"
git push
