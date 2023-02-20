#!/bin/bash
quartus_sh --flow compile *.qpf
quartus_cpf -c output_files/Arcade-BombJack.sof output_files/Arcade-BombJack.rbf
