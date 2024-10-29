#include "config.h"
//CORES
float cor[12][3] = {{1,0,0},{0,1,0},{0,0,1},{1,1,0},{1,0,1},{0,1,1},
{0.5,0.5,0.5},{0.5,1,0},{0.8,0.9,1},{1,0.6,1},{6.9,1,1},{1,1,0.9}};
#define a  1
#define b  2

double x = 0.5, y = 0.8;
                    //     0      1       2       3
double pontos[4][3] = {{x,x,1},{y,y,1},{y,x,1},{x,y,1}};
int verteces[a][b] = {{0,2}};

void multiplica(int l, int c,double mat[][3],float mult[][3]){
    double resposta[l][c];
    for(int i=0; i < l;i++){
        for(int j=0; j < c;j++){
            resposta[i][j] = 0;
        }
    }
    for(int i=0; i < l;i++){
        for(int f=0; f < l;f++){
            for(int j=0;j < c;j++){
                resposta[i][f] += mat[i][j] * mult[j][f]; 
            }
        }
    }
    for(int i=0; i < l;i++){
        for(int j=0;j < c;j++){
            mat[i][j] = resposta[i][j]; 
        }
    }
}

//Imprime
void imprime(int l, int c,double mat[][3]){
    for(int i=0;i < l;i++){
        for(int j=0;j < c;j++){
            printf("%6.3f ",mat[i][j]);
        }
        puts("");
    }
}

void translaçao(float tx, float ty, double pontos[][3]){
    float transla[3][3] = {{1,0,0},{0,1,0},{tx,ty,1}};
    multiplica(4,3,pontos,transla);
}

void scala(float sx, float sy, double pontos[][3]){
    float ux = (x+y)/2, uy = (x+y)/2;
    float origem[3][3] = {{1,0,0},{0,1,0},{-ux,-uy,1}};
    float retorno[3][3] = {{1,0,0},{0,1,0},{ux,uy,1}};
    float sca[3][3] = {{sx,0,0},{0,sy,0},{0,0,1}};
    multiplica(4,3,pontos,origem);
    multiplica(4,3,pontos,sca);
    multiplica(4,3,pontos,retorno);
}



void quadrado_2D(){
    glBegin(GL_LINES);
    for(int i=0;i < a;i++){
        glColor3fv(cor[i]);
        for(int j=0;j < b;j++){
            glVertex2dv(pontos[verteces[i][j]]);
        }
    }
    glEnd();
}

int main(){
    int tx,ty;
    system("clear");
    GLFWwindow *window = NULL;
    
    if(!glfwInit()){
        std::cout << "GLfW colud't start" << std::endl;
        return -1;
    }

    window = glfwCreateWindow(2000,2000,"Minha Tela",NULL,NULL);
    

    if(window == NULL){
        std:: cout << "Window nao inicializada" << std::endl;
    }

    glViewport(0,0,2000,2000);

    glClearColor(0,0,1,1);

    int cout = 0;

    glfwMakeContextCurrent(window);

    translaçao(-0.9,-0.9,pontos);
    scala(2,2,pontos);

    while(!glfwWindowShouldClose(window))
    {
        glfwPollEvents();

        glClear(GL_COLOR_BUFFER_BIT);

        quadrado_2D();
        glfwSwapBuffers(window);
    }

    glfwTerminate();
    return 0;
}