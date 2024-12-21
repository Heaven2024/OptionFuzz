import os

folder_path = "/yuhao/opensmt_/z3" 

if not os.path.exists(folder_path):
    os.makedirs(folder_path)


for i in range(85, 201):
    file_name = f"{i}.smt2"
    file_path = os.path.join(folder_path, file_name)
    with open(file_path, 'w') as file:
        pass  # 创建空文件

print("文件创建完毕")
