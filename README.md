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
