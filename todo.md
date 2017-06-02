# ToDo

## Goal of this project

All I want is just a dictionary which has the following line format.

```
traditional character(s),simplified character(s),pinyin,tag,meanings in English(slash separeted)
```

- Pinyins start with a capital letter if the word is a proper noun such as a surname.
- The tags are word classes "詞性". Tag defintions are from Jieba.

Example lines.

```
還,还,Huan2,nr,surname Huan
還,还,hai2,d,still/still in progress/still more/yet/even more/in addition/fairly/passably (good)/as early as/even/also/else
還,还,huan2,v,to pay back/to return
```

## A course

- From cedict\_ts.u8, we can get traditional and simplified characters, pinyin and meanings in English.
- From dict.txt.big we can get simplified characters and tags.
- Merge them depending on simplified characters. Hooray!

## Problems

- cedict\_ts.u8 has more than one line for the same chinese characters(ex. 还)
- dict.txt.big has more than one line for the same chinese characters(ex. 一乾二淨)
- There are many words which only exist in either cedict\_ts.u8 or dict.txt.big.
- So merging them is not one-to-one.

## Solitions

- Merging two dictionaries only if each word have one-to-one mapping.
- Adding pinyin with pypinyin the word of which only exists in dict.txt.big.
- Applying patch with a handcrafted dictionary to resolve multi-to-multi mappings X(
