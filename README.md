### 分支说明
- **main分支**：基于原始仓库 [SWE-bench](https://github.com/SWE-bench/SWE-bench) 版本2.1.7构建
  - 包含UTGenerator生成的测试文件替换，部分文件错误信息更正
  - 基础框架核心代码
- **dev分支**：用于Agent扩展测试和结果验证
  - 包含Step 3的agent扩展实现
  - 自动生成的gold标准存放在 `logs/gold/`
  - 测试报告路径 `logs/report/`

