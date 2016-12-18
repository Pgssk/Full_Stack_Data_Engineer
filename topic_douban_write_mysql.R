library(RMySQL)
library(data.table)
movie = fread('data/douban_movie_clean.txt', sep = '^', encoding = 'UTF-8')
head(movie)
tail(movie)

movie = data.frame(movie)
head(movie)

conn <- dbConnect(RMySQL::MySQL(), username="root", password= 'iae', host="localhost", port=3306, dbname = 'study')

# MySQL����ʵ����Ϣ
summary(conn, verbose = TRUE)
# �鿴���ݿ�ı�
dbListTables(conn)

# ��������������
dbWriteTable(conn,"movie", movie, overwrite = T)
dbSendQuery(conn,'SET NAMES gbk')
mysql=dbGetQuery(conn,"select * from movie")
head(mysql)


## �ر�����
dbDisconnect(conn)


