#include <glm/gtx/transform.hpp>
#include <stdlib.h>
#include <stdio.h>

int main(){
    int mat_1[4][2] = {{1,3},{3,3},{3,1},{1,1}};
    glm:: mat4x2 mat = glm::mat4x2(0);
    for(int i = 0;i < 4;i++){
        for(int j = 0;j < 2;j++){
            mat[i][j] = mat_1[i][j];
        }
    }
    for(int i = 0;i < 4;i++){
        for(int j = 0;j < 2;j++){
            printf("%.1f ",mat[i][j]);
        }
        puts("");
    }
    return 0;
}