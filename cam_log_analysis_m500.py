import sys
import re
import pandas as pd

if __name__ == '__main__':
    file_path = sys.argv[1]

    # 打开文件并逐行读取内容
    with open(file_path,'r',encoding='utf-8') as file:
        lines = file.readlines()

    filename1 = file_path + 'gimbal'
    str_txt_1 = filename1 +'.txt'
    keyword = 'cardle log'
    with open(str_txt_1,"w",encoding="utf-8") as f_writer:
        # 遍历每一行，判断是否存在关键字并提取整行内容
        for line in lines:
            if keyword in line:
                exlinepart = re.split("[,\s;]+",line)
                # print(exlinepart)

                exlineall = exlinepart[1] + ',' + exlinepart[5] + ','\
                          + exlinepart[6] + ',' + exlinepart[7] + ',' + exlinepart[8] + ','\
                          + exlinepart[9] + ',' + exlinepart[10] + ',' + exlinepart[11] + ','\
                          + exlinepart[12] + ',' + exlinepart[13] + ',' + exlinepart[14] + ','\
                          + exlinepart[15] + ',' + exlinepart[16] + ',' + exlinepart[17] + ','\
                          + exlinepart[18] + ',' + exlinepart[19] + ',' + exlinepart[20] \
                          + '\n'
                f_writer.write(exlineall)
                # extracted_lines.append(exlineall)

    print("end-gimbal-txt")

    str_csv = filename1 + '.csv'
    df=pd.read_csv(str_txt_1,delimiter=',')#delimiter是间隔符
    df.to_csv(str_csv,encoding='utf_8_sig',index=False)
    print('success-gimbal-csv')
