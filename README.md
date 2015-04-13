# roda_a_roda
Script para resolver palavras do programa Roda a Roda (do SBT) e no joga da forca.

O script fornece as palavras que coincidem com o critério e também uma lista de possíveis letras (útil em jogos de forca).

Uso
---

A palavra desconhecida ou conhecida parcialmente é _a___idade. Assim executamos:

  $ ./genio.sh _a___idade wordlist_pt_br.txt
  Executando: cat wordlist_pt_br.txt | awk 'BEGIN{FS=OFS=""}{ if ( length($0) == 10 && $2 == "a" && $6 == "i" && $7 == "d" && $8 == "a" && $9 == "d" && $10 == "e" ) print $0;}' 
  banalidade
  caducidade
  calamidade
  capacidade
  facilidade
  fatalidade
  habilidade
  maioridade
  Melhores opcoes de letras: cat wordlist_pt_br.txt | awk 'BEGIN{FS=OFS=""}{ if ( length($0) == 10 && $2 == "a" && $6 == "i" && $7 == "d" && $8 == "a" && $9 == "d" && $10 == "e" ) print $0;}'  | grep -o '\S' | awk '{a[$1]++}END{for(k in a)print a[k],k}' | sort -nr | head -10
  20 a
  17 d
  11 i
  8 e
  6 c
  5 l
  2 m
  2 f
  2 b
  1 u
