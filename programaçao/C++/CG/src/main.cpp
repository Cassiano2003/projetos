#include "config.h"
#define m 400


void quad(){
    //Quadrado
    glBegin(GL_QUADS);
    //Cor
    glColor3f(0.0f,0.0f,1.0f);
    //Frente
    glVertex3f(-0.5f,0.5f,0.0f);
    glVertex3f(0.5f,0.5f,0.0f);
    glVertex3f(0.5f,-0.5f,0.0f);
    glVertex3f(-0.5f,-0.5f,0.0f);

    //Tras
    glColor3f(0.0f,1.0f,0.0f);
    glVertex3f(-0.5f,0.5f,1.0f);
    glVertex3f(0.5f,0.5f,1.0f);
    glVertex3f(0.5f,-0.5f,1.0f);
    glVertex3f(-0.5f,-0.5f,1.0f);

    
    glEnd();
}

void tri(){
    //Triangulo
    glBegin(GL_TRIANGLES);
    //Cria o objeto apartir da cor que quiser
    glColor3f(1.0f,0.0f,0.0f);
    glVertex3f(-0.5f,-0.5f,0.0f);
    glVertex3f(0.5f,-0.5f,0.0f);
    glVertex3f(0.0f,0.5f,0.0f);
    glEnd();
}//*/



int main(){
    GLFWwindow *window;
    
    if(!glfwInit()){
        std::cout << "GLfW colud't start" << std::endl;
        return -1;
    }

    window = glfwCreateWindow(640,640,"Minha Tela",NULL,NULL);
    

    if(window == NULL) puts("erro");
    
    /*if(!gladLoadGLLoader(GLADloadproc(glfwGetProcAddress))){
        glfwTerminate();
        puts("testes");
        return -1;
    }*/
    //glViewport(0,0,640,640);

    glfwMakeContextCurrent(window);

    glClearColor(0.0f,0.0f,0.0f,1.0f);
    
    while(!glfwWindowShouldClose(window))
    {
        glfwSwapBuffers(window);
        glRotatef(2.0f,1.0f,0.0f,0.0f);
        glfwPollEvents();
        quad();
        tri();
    }

    glfwTerminate();
    return 0;
}