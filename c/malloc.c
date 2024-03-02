void mallocLeak() {
    int *p = malloc(100000* sizeof(int)); 
    p[999999] = 2;
}
