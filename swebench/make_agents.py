import json
import os
import shutil
from pathlib import Path
from glob import glob


def convert_jsonl_to_json_array(input_file, output_file):
    """将单个JSONL文件转换为JSON数组"""
    data = []
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            for line_num, line in enumerate(f, 1):
                line = line.strip()
                if not line:
                    continue
                try:
                    data.append(json.loads(line))
                except json.JSONDecodeError as e:
                    print(f"解析错误：{Path(input_file).name} 第{line_num}行 - {str(e)}")
                    continue

        with open(output_file, 'w', encoding='utf-8') as f:
            json.dump(data, f, indent=2, ensure_ascii=False)

    except Exception as e:
        print(f"处理文件 {input_file} 时出错: {str(e)}")


def batch_convert(input_dir, output_dir):
    """批量转换jsonl文件"""
    # 清空并重建输出目录
    if os.path.exists(output_dir):
        shutil.rmtree(output_dir)
    os.makedirs(output_dir)

    # 获取所有jsonl文件（包括子目录）
    input_files = glob(os.path.join(input_dir, "**/*.jsonl"), recursive=True)

    for input_path in input_files:
        # 保持原始相对路径结构
        rel_path = os.path.relpath(input_path, input_dir)
        output_path = os.path.join(output_dir, rel_path)
        output_path = os.path.splitext(output_path)[0] + ".json"

        # 确保子目录存在
        os.makedirs(os.path.dirname(output_path), exist_ok=True)

        print(f"转换: {rel_path} → {os.path.relpath(output_path, output_dir)}")
        convert_jsonl_to_json_array(input_path, output_path)


if __name__ == "__main__":
    # 路径配置
    BASE_DIR = os.path.dirname(os.path.abspath(__file__))  # 获取脚本所在目录
    INPUT_DIR = os.path.join(BASE_DIR, "top20_agents")
    OUTPUT_DIR = os.path.join(BASE_DIR, "top20_agents_preprocessed")

    # 执行转换
    batch_convert(INPUT_DIR, OUTPUT_DIR)
    print(f"\n所有文件已转换完成，结果保存在: {OUTPUT_DIR}")