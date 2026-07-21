# LUT Research Site

> 一个静态 LUT 研究与参考索引站点，方便浏览调色风格、素材来源与观察笔记。

Contact: **Jacksun** · [qinji@jack-sun.com](mailto:qinji@jack-sun.com)

![lut-research-site project visual](docs/assets/lut-research-site-hero.png)

## 本地预览

```bash
python3 -m http.server 4173
```

打开 `http://localhost:4173`。内容数据位于 `data/entries.json`，页面不依赖后端服务。

## 部署

```bash
./deploy.sh /absolute/deployment/path
```

部署脚本只复制静态页面及数据到你指定的目录。

本项目采用 [MIT License](LICENSE) 开源。
