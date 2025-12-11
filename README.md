# 100 Chance 💀

**100 chance**, ou sem chance, é um jogo que consiste em completar vários labirintos, porém você tem apenas 100 movimentos/ações para vencer.

Além disso, haverá outros "obstáculos" além de paredes para impedir o progesso do jogador.

Ultrapassar esses 100 movimentos mata o jogador e reseta para o inicio do nível atual, mas quaisquer alterações feitas nesse nível se mantém.

---

## Recomendações ✔️

Para rodar o nosso jogo, você precisa de 3 coisas essenciais:

- `make`
- `compilador c`
- `terminal bash (linux/wsl)`

## Inicialização

Após verificar se você tem esses componentes instalados, basta usar os comandos: 
```bash
make all
```

Caso o comando falhe, indicando a falta do módulo gtk+-2.0, utilize um desses dois comandos para instalá-lo:

### Ubuntu
```bash
sudo apt-get install libgtk2.0-dev
```

### Fedora
```bash
sudo dnf install gtk2-devel
```

Ele deve fazer todas as funções necessárias para rodar o jogo. Para mais informações sobre o que se pode fazer, utilize `make help`.

---

## Sobre o código

Adotamos algumas convenções durante o desenvolvimento de código com relação aos registradores:

| Registrador |                 Função                 |
|:-----------:|:--------------------------------------:|
|      R0     | Guardar a posição de qualquer coisa    |
|      R1     | Guarda o valor de um caracter qualquer |
|   R2 - R7   | Uso Geral                              |

---

## Criadores

<div style="display:inline-block; padding:1rem;">
    <img src="https://github.com/ItzCrynix.png" style="height: 40px; border-radius:20px">
    <ul style="display:inline-block">
        <li><span>Cainan Loyola Schiavolin</span>
        <li><span style="font-size:10pt">15444319</span>
    </ul>
</div>

<div style="display:inline-block; padding:1rem;">
    <img src="https://github.com/luis-antoniosi.png" style="height: 40px; border-radius:20px">
    <ul style="display:inline-block">
        <li><span>Luís Gustavo Vieira Antoniosi</span>
        <li><span style="font-size:10pt">17067476</span>
    </ul>
</div>

<div style="display:inline-block; padding:1rem;">
    <img src="https://github.com/4i6caetano.png" style="height: 40px; border-radius:20px">
    <ul style="display:inline-block">
        <li><span>João Pedro Correia Caetano</span>
        <li><span style="font-size:10pt">16987067</span>
    </ul>
</div>
