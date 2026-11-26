# Candongueiro Simulator

**Candongueiro Simulator** é um jogo 2D desenvolvido no **Godot Engine** que coloca o jogador ao volante de um candongueiro no trânsito de **Luanda**.

> **Estado do projeto:** Protótipo inicial — a primeira rua está jogável e serve de base para a mecânica central de condução e mudança de faixas.

## O que já funciona
- **Cenário em pixel art:** ambiente visual inspirado na Baía de Luanda.
- **Condução base:** deslocação para a frente e para trás.
- **Mudança de faixas:** alternância entre duas faixas na via.

## Controlos
| Tecla | Ação |
| :--- | :--- |
| `Seta direita` (`ui_right`) | Acelerar / andar para a frente |
| `Seta esquerda` (`ui_left`) | Marcha-atrás / travar |
| `Seta cima` (`ui_up`) | Mudar para a faixa superior |
| `Seta baixo` (`ui_down`) | Mudar para a faixa inferior |

## Estrutura prevista (Godot)
```text
candongueiro-simulator/
├── scenes/        # Cenas (rua, candongueiro, UI)
├── scripts/       # Lógica em GDScript
├── assets/        # Sprites em pixel art, mapas e sons
└── project.godot  # Configuração principal do projeto

Próximos passos
Câmara: acompanhamento suave do candongueiro com limites de cena.

Novo traçado: introdução de uma segunda rua com curva.

Loop de candongueiro: embarque/desembarque de passageiros, gestão de kwanza/dinheiro e nível de combustível.

Como abrir o projeto
Instala o Godot 4.3 ou mais recente.

Clona ou descarrega este repositório.

No Godot, seleciona Importar e abre project.godot.

Carrega em F5 para jogar.

Autor
Esdras Francisco


---

### Etapa 3 — 100% (Versão 3x — Completa, polida e pronta para o repositório)
Aqui está a versão final do `README.md`, com identidade de marca, *roadmap* por marcos, guia de resolução de problemas comuns no Godot e secção de contribuição/licença.

````markdown
# Candongueiro Simulator

**Candongueiro Simulator** é um jogo 2D em desenvolvimento no **Godot Engine** onde conduzes um candongueiro pelas ruas de **Luanda**, começando num cenário em *pixel art* inspirado na **Baía de Luanda**.

O projeto encontra-se numa fase inicial: a primeira rua já está jogável e valida a movimentação básica e a troca de faixas.

## Funcionalidades atuais
- **Visual em pixel art:** cenário inicial inspirado na Baía de Luanda.
- **Controlo direcional:** movimentação para a frente e para trás.
- **Faixas de rodagem:** transição entre duas faixas na via.

## Controlos
| Tecla | Ação |
| :--- | :--- |
| **Seta direita** | Andar para a frente |
| **Seta esquerda** | Andar para trás |
| **Seta cima** | Ir para a faixa de cima |
| **Seta baixo** | Ir para a faixa de baixo |

## Roadmap
- [ ] **Câmara dinâmica:** seguir o candongueiro com suavização e limites da pista.
- [ ] **Expansão do percurso:** adicionar uma segunda rua com curva.
- [ ] **Economia e rotina do candongueiro:** sistema de passageiros, cobrança/dinheiro e gestão de combustível.
- [ ] **Polimento de jogo:** efeitos sonoros, feedback visual e obstáculos no trajeto.

## Como abrir e correr o projeto
1. Instala o **Godot 4.3** ou superior.
2. Clona ou descarrega este repositório:
   ```bash
   git clone <url-do-repositorio>
Abre o Godot, clica em Importar, escolhe o ficheiro project.godot e confirma.

Carrega em F5 para iniciar o jogo.

Dica: Se as teclas não responderem ao arrancar, verifica em Project > Project Settings > Input Map se ui_left, ui_right, ui_up e ui_down estão mapeadas para as setas do teclado.

Tecnologias
Godot Engine (4.3+)

GDScript

Autor
Esdras Francisco

Contribuições e licença
Sugestões, issues e melhorias são bem-vindas através do repositório. Define aqui a licença do projeto (ex.: MIT) caso pretendas disponibilizar o código abertamente.
