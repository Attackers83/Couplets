# Couplets

## 项目名称：仄平仄平仄仄平

### 主要功能:

输入上联，输出下联

### 实现原理：

#### 1、数据收集

从GitHub网站下载couplet v1.0 release版本的数据，并解压。
GitHub网站：https://github.com/wb14123/couplet-dataset/releases
文件名：couplet.tar.gz

#### 2、下载Tensor2Tensor库v1.2.9版本

在Resources目录下，
git clone https://github.com/tensorflow/tensor2tensor.git
git checkout v1.2.9

#### 3、数据处理

Couplet数据解压后，有两个文件夹，分别存放train和test的上下联数据。In为上联，out为下联。在训练过程中，我们只需对train的数据进行预处理。

##### 1.在Resources目录下，创建data子目录。

##### 2.	将couplet中train和test目录下的数据移动至data目录下，并重命名为：train.in.txt，train.out.txt，test.in.txt，test.out.txt。

##### 3.	在data目录中，合并上下联文件并保存结果：cat train.in.txt train.out.txt > train.merge.txt

##### 4.	在data目录中，统计字表数目并保存字表：

需要安装subword-nmt包：python -m pip install subword-nmt
统计字数命令：subword-nmt get-vocab –input train.merge.txt –output train.merge.txt.vocab

##### 5.	在data目录中，去掉字表文件中的汉字出现次数，只留字表：

cat train.merge.txt.vocab | awk ‘print $1’ > merge.txt.vocab.clean

##### 6.	将Resources目录下的merge_vocab.py和__init__.py文件拷贝到data目录。

##### 7.	修改merge_vocab.py中的内容（如果前面跟我起的名字都一样，则不需修改）：

###### a.	SRC_TRAIN_DATA 为训练集上联数据文件

###### b.	TGT_TRAIN_DATA 为训练集下联数据文件

###### c.	SRC_DEV_DATA 为测试集上联数据文件

###### d.	TGT_DEV_DATA 为测试集下联数据文件

###### e.	MERGE_VOCAB 为最终字表文件

###### f.	VOCAB_SIZE为字表文件中字的个数

##### 4、数据生成

###### 1.	在Resources目录下，修改data_gen.sh脚本内容（如果前面跟我起的名字都一样，则不需修改）。

###### 2.	运行bash data_gen.sh脚本，完成数据生成工作。

##### 5、数据训练

###### 1.	在Resources目录下，创建output目录存放训练结果。

###### 2.	修改train.sh脚本内容，如train_steps，batch_size等为你想要的数值。

###### 3.	运行bash train.sh脚本，完成数据处理工作。

###### 4.	数据训练完成，则在output目录下生成训练数据。

我设置的batch_size为100000，所以最终需要的数据文件为：

model.ckpt-100000.data-00000-of-00003

model.ckpt-100000.data-00001-of-00003

model.ckpt-100000.data-00002-of-00003

model.ckpt-100000.index

model.ckpt-100000.meta

checkpoint
