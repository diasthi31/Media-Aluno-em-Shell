#!/bin/bash

function dadosAluno {
    echo -n "Digite o nome do aluno: "
    read nome
    echo -n "Digite a primeira nota: "
    read nota1
    if (( $(echo "$nota1 > 10.0" | bc -l) )); then
        echo -n "Nota inválida, digite uma nota entre 0-10: "
        read nota1
    fi
    echo -n "Digite a segunda nota: "
    read nota2
    if (( $(echo "$nota2 > 10.0" | bc -l) )); then
        echo -n "Nota inválida, digite uma nota entre 0-10: "
        read nota2
    fi

    media=$(echo "scale=2; ($nota1 + $nota2) / 2" | bc)

    if [ $(echo "$media >= 6.0" | bc -l) -eq 1 ]; then
        resultado="Aprovado"
    else 
        resultado="Reprovado"
    fi

    nomes+=("$nome")
    medias+=("$media")
    resultados+=("$resultado")
}

nomes=()
medias=()
resultados=()

while [ resposta=='s' ]
do
    dadosAluno
    echo -n "Deseja continuar? [s/n]: "
    read resposta
    test "$resposta" = "n" && break
    clear
done

clear

echo "Médias:"
for ((i=0; i<${#nomes[@]}; i++)); do
    echo "Nome     : ${nomes[i]}"
    echo "Média    : ${medias[i]}"
    echo "Resultado: ${resultados[i]}"
    echo
done