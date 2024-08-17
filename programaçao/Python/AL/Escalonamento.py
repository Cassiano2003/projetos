import os

def troca_linhas(mat,l1,l2):
    l_1 = mat[l1]
    mat[l1] = mat[l2]
    mat[l2] = l_1

def mult_soma(matriz,l1,l2,num_l1,num_l2,n,destino):
    lista_1 = []
    lista_2 = []
    for i in matriz[l1]:
        lista_1.append(i*num_l1)
    for i in matriz[l2]:
        lista_2.append(i*num_l2)
    lista_3 = []
    for i in range(n):
        lista_3.append(lista_1[i]+lista_2[i])
    matriz[destino] = lista_3

def imprime(matriz,n):
    t = '\t'
    print("Tamanho da matriz: ",n,"x",n)
    print("Sua matriz:")
    for i in matriz:
        for j in i:
            print(f'{j:.1f}',end=" ")
        print()
    print()

def divide(matriz,l,num):
    lista = []
    for i in matriz[l]:
        lista.append(i/num)
    matriz[l] = lista

def sinal(matriz,l,num):
    lista = []
    for i in matriz[l]:
        lista.append(i*num)
    matriz[l] = lista


def det(matriz,n):
    sum = 0
    for i in range(n):
        for j in range(n):
            if(i == j):
                sum += matriz[i][j]
    print("O det é: ",sum)

def escalona(matriz,invet,n):
    #troca de linha
    num_1 = -1
    for i in range(n):
        if(matriz[i][0] == 1 and i != 0):
            num_1 = i
        elif(i == 0):
            num_1 = 0
    if(num_1 != -1):
        troca_linhas(matriz,0,num_1)
        troca_linhas(invet,0,num_1)
        #Triangular superior
        for i in range(n):
            for j in range(n):
                if(i == j):
                    mestre = matriz[i][j]
                    for c in range(i+1,n):
                        for f in range(n):
                            if(c > f):
                                mul = matriz[c][i]
                                mult_soma(matriz,i,c,mul*(-1),mestre,n,c)
                                mult_soma(invet,i,c,mul*(-1),mestre,n,c)
        #Triangular inferior
        l = n*(-1)
        m = n*(-1)
        for j in range(n):
            if(l == m):
                mestre = matriz[l][m]
                mul = matriz[l][m+1]
                mult_soma(matriz,i,c,mul*(-1),mestre,n,c)
                mult_soma(invet,i,c,mul*(-1),mestre,n,c)
        nao = 1
        for i in range(n):
            for j in range(n):
                if (i > j):
                    if(matriz[i][j] != 0):
                        nao = 0
        if(nao == 1):
            det(matriz,n)

        
        '''for i in range(n):
            sim_ou_nao = 0
            for j in range(n):
                if(matriz[i][j]%2 == 0):
                    sim_ou_nao = 1
                else:
                    sim_ou_nao = 0
                    break
            if(sim_ou_nao == 1):
                divide(matriz,i,2)'''






def menu(copia,invet,n):
    while(True):
        os.system("clear")
        opcao = 0
        l1 = l2 = 0
        imprime(copia,n)
        imprime(invet,n)
        print("Opcoes disponives")
        print("troca -> troca as linhas de lugares")
        print("soma -> Multiplica e soma as linhas")
        print("divide -> Divide a linha que deseja")
        print("sinal -> Troca o sinal da linha")
        print("sair -> Encera o progarma")
        escalona(copia,n)
        opcao = input("Qual a opcao: ")
        print(opcao)
        for i in range(n):
            print("Linha ",i+1)
        if(opcao == 'troca'):
            print("Quais serao as linhas trocadas: ")
            l1 = int(input("Primeira linha: "))
            l2 = int(input("Segunda linha: "))
            troca_linhas(copia,l1-1,l2-1)
            troca_linhas(invet,l1-1,l2-1)
        elif(opcao == 'soma'):
            l1 = int(input("Primeira linha: "))
            num_1 = int(input("Numero que multiplica a primeira linha: "))
            l2 = int(input("Segunda linha: "))
            num_2 = int(input("Numero que multiplica a segunda linha: "))
            destino = int(input("Linha de destinho: "))
            mult_soma(copia,l1-1,l2-1,num_1,num_2,n,destino-1)
            mult_soma(invet,l1-1,l2-1,num_1,num_2,n,destino-1)
        elif(opcao == 'divide'):
            l = int(input("Linha que ira dividir: "))
            num = int(input("Numero que ira dividir: "))
            divide(copia,l-1,num)
            divide(invet,l-1,num)
        elif(opcao == 'sinal'):
            l = int(input("Linha que ira troca de sinal: "))
            num = int(input("Numero que ira multiplicar: "))
            sinal(copia,l-1,num)
            sinal(invet,l-1,num)
        elif(opcao == 'sair'):
            print("Fim do programa!!!")
            break
def main():
    os.system("clear")

    n = 3
    invet = []
    matriz = [[1,2,3],[5,6,7],[4,2,1]]
    copia = [[1,2,3],[5,6,7],[4,2,1]]

    '''print("Digite o tamanho da matriz: ",end=" ")
    n = int(input())

    print("Digite os valores da matriz linha por linha")
    for i in range(n):
        lista = []
        for j in range(n):
            lista.append(int(input()))
        copia.append(lista)
        matriz.append(lista)'''
    for i in range(n):
        teste = []
        for j in range(n):
            if(i == j):
                teste.append(1)
            else:
                teste.append(0)
        invet.append(teste)
    

    
    imprime(copia,n)
    escalona(copia,invet,n)
    imprime(copia,n)
    imprime(invet,n)

    #menu(copia,invet,n)

main()