# mecab-cc-cedict-jieba

A dictionary for MeCab to make pinyins from chinese sentenses.

## files

add\_cc\_cedit\_pinyin\_into\_jieba.rb: generate `dict/seed_dict.csv` based on jieba's dict.txt.big with pinyin from CC-CEDICT

add\_jieba\_tags\_into\_cc\_cedit.rb: generate `dict/seed_dict.csv` based on jieba's dict.txt.big with pinyin from CC-CEDICT

dict/: Settings files for MeCab. ref.) https://taku910.github.io/mecab/learn.html

## how to generate MeCab dictionary

```
cd dict
mkdir work
mkdir work/seed work/final
cp seed_dict.csv work/seed
cp dicrc work/seed
cp char.def work/seed
cp unk.def work/seed
cp rewrite.def work/seed
cp feature.def work/seed
cp /home/your/corpus work/seed
cd work/seed
mecab-dict-index
mecab-cost-train -c 1.0 corpus model
mecab-dict-gen -o ../final -m model
cd ../final
mecab-dict-index
```

You have to provide your own corpus, the format of which is the same as MeCab's outputs. Punctuation marks should have 'w' tag. You can get much of chinese texts from Wikipedia dumps (https://dumps.wikimedia.org/zhwiki/latest/zhwiki-latest-pages-articles.xml.bz2).

```
我	0,0,0,r,wo3
姓	0,0,0,v,xing4
丁	0,0,0,nr,Ding1
。	0,0,0,w,
EOS.
我	0,0,0,r,wo3
姓	0,0,0,v,xing4
龍	0,0,0,nr,Long2
。	0,0,0,w,
EOS.
```
