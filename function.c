#include <stdio.h>
#include <limits.h>

#define M 3
#define N 5
int find_lesser(int rows, int cols, int matrix[M][N]){
    int sum;
    int lesser_sum = INT_MAX;
    int lesser_row = 0;

    for (int i = 0; i < rows; i++){
         sum = 0;
        for (int j = 0; j<cols; j++){
            sum += matrix[i][j];
        }
        if ( sum < lesser_sum){
            lesser_sum = sum;
            lesser_row = i;
        }
    }
    return lesser_row+1;
}


int matrix[M][N] = {
    {1,2,3,4,5},
    {3,1,2,4,5},
    {-5,4,-3,2,-1}
};


void main(){
    int res = find_lesser(M, N, matrix);
    printf("%d", res);
}