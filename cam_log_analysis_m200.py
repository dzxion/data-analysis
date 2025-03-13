import sys
import re
import pandas as pd

if __name__ == '__main__':
    file_path = sys.argv[1]

    # 打开文件并逐行读取内容
    with open(file_path,'r') as file:
        lines = file.readlines()

    filename1 = file_path + 'gimbal'
    str_txt_1 = filename1 +'.txt'
    keyword = 'recv cradle pos data'
    with open(str_txt_1,"w",encoding="utf-8") as f_writer:
        # 遍历每一行，判断是否存在关键字并提取整行内容
        for line in lines:
            if keyword in line:
                exlinepart = re.split(r'\s*[,\s]\s*',line)
                # print(exlinepart)

                exlineall = exlinepart[1] + ',' + exlinepart[8] + ',' + exlinepart[9] + ',' + exlinepart[10] + '\n'
                f_writer.write(exlineall)
                # extracted_lines.append(exlineall)

    print("end-gimbal-txt")

    filename2 = file_path + 'fc'
    str_txt_2 = filename2 +'.txt'
    keyword = 'recv cradle fcdata'
    with open(str_txt_2,"w",encoding="utf-8") as f_writer:
        # 遍历每一行，判断是否存在关键字并提取整行内容
        for line in lines:
            if keyword in line:
                exlinepart = re.split(r'\s*[,\s]\s*',line)
                # print(exlinepart)

                exlineall = exlinepart[1] + ',' + exlinepart[8] + ',' + exlinepart[10] + ',' + exlinepart[12] + '\n'
                f_writer.write(exlineall)
                # extracted_lines.append(exlineall)

    print("end-fc-txt")

    str_csv = filename1 + '.csv'
    df=pd.read_csv(str_txt_1,delimiter=',')#delimiter是间隔符
    df.to_csv(str_csv,encoding='utf_8_sig',index=False)
    print('success-gimbal-csv')

    str_csv = filename2 + '.csv'
    df=pd.read_csv(str_txt_2,delimiter=',')#delimiter是间隔符
    df.to_csv(str_csv,encoding='utf_8_sig',index=False)
    print('success-fc-csv')
