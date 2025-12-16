# SillyTavern

LLM Frontend for Power Users

## Resources

- GitHub: <https://github.com/SillyTavern/SillyTavern>
- Docs: <https://docs.sillytavern.app/>
- Discord: <https://discord.gg/sillytavern>
- Reddit: <https://reddit.com/r/SillyTavernAI>

## License

AGPL-3.0


🚀 接下来：开始你的定制开发
所有障碍都已清除，现在你可以在 custom 分支上自由修改了。请遵循这个简单的工作流：

确保你在正确的分支（你已经在 custom 分支了）：

bash
git checkout custom
进行你的修改：编辑项目中的任何文件。

提交并推送你的修改：

bash
git add .
git commit -m "这里填写你的修改描述"
git push origin custom  # 现在推送会非常顺畅
🔄 未来同步官方更新的流程
当你需要获取官方的新功能或修复时：

bash
# 1. 从官方获取最新稳定代码到 main 分支
git checkout main
git pull upstream release

# 2. 将官方更新合并到你的定制分支
git checkout custom
git merge main
# 如果遇到冲突，解决后执行 `git add .` 和 `git commit`

# 3. 将合并后的结果推送到你的仓库
git push origin custom