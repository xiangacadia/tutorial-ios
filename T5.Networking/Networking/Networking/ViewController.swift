
boolean
search( treenode **root, int data )
{
    boolean found = false;
    treenode *child;
    treenode *grandparent;
    treenode *node = *root;
    
    while (!found && (node != NULL) {
    if (node->data == data) { found = true; }
    else if (node->data > data) { node = node->left; }
    else { node = node->right; }
    }
    
    /* Try to make future searches for this same value faster. */
    
    if (found) {
    node->searchcount++;
    
    while ((node->parent != NULL) &&
    (node->searchcount > node->parent->searchcount)) {
    
    /* Do a tree rotation to make node the parent now */
    if (node == node->parent->left) {
    
    child = node->right;
    node->right = node->parent;
    node->parent->left = child;
    
    } else {
    child = node->left;
    node->left = node->parent;
    node->parent->right = child;
    }
    
    /* Make the grandparent of "node" now think that "node"
    is its child.  */
    
    grandparent = node->parent->parent;
    node->parent->parent = node;
    
    if (grandparent != NULL) {
    if (grandparent->left == node->parent) {
    grandparent->left = node;
    } else {
    grandparent->right = node;
    }
    } else {
    /* We rotated to become the root. */
    
    *root = node;
    }
    node->parent = grandparent;
    }
    }
    
    return found;
}
