const head = require('./config/head.js');
const plugins = require('./config/plugins.js');
const themeConfig = require('./config/themeConfig.js');

module.exports = {
  theme: 'vdoing', // 使用依赖包主题
  // theme: require.resolve('../../theme-vdoing'), // 使用本地主题

  title: "小冷学习笔记",
  description: '后端技术博客,简洁至上,专注JAVA后端学习与总结。Spring、SpringBoot、SpringCloud、Mybatis、分布式、高并发、微服务、云原生、ES等技术文章。',
  // base: '/', // 格式：'/<仓库名>/'， 默认'/'
  markdown: {
    lineNumbers: true, // 代码行号
  },

  head,
  plugins,
  themeConfig,
}
