![opscenter 5.1.1](https://img.shields.io/badge/opscenter-5.1.1-brightgreen.svg) ![License MIT](https://img.shields.io/badge/license-MIT-blue.svg)

# docker-opscenter

### Base Docker Image

[debian:wheezy](https://registry.hub.docker.com/_/debian/)

### 説明

Cassandra OpsCenter Dockerコンテナイメージです。

[OpsCenterとは？](http://www.datastax.com/what-we-offer/products-services/datastax-opscenter)  
[Dockerとは？](https://docs.docker.com/ "Dockerとは？")  
[Docker Command Reference](https://docs.docker.com/reference/commandline/cli/ "Docker Command Reference")

### 使用方法

git pull後に

    $ cd docker-opscenter

イメージ作成

    $ docker build -t tanaka0323/opscenter .

### Figでの使用方法

[Figとは](http://www.fig.sh/ "Figとは")  

[設定ファイル記述例](https://bitbucket.org/tanaka0323/fig-examples "設定ファイル記述例")

### License

The MIT License
Copyright (c) 2015 Daisuke Tanaka

以下に定める条件に従い、本ソフトウェアおよび関連文書のファイル（以下「ソフトウェア」）の複製を取得するすべての人に対し、ソフトウェアを無制限に扱うことを無償で許可します。これには、ソフトウェアの複製を使用、複写、変更、結合、掲載、頒布、サブライセンス、および/または販売する権利、およびソフトウェアを提供する相手に同じことを許可する権利も無制限に含まれます。

上記の著作権表示および本許諾表示を、ソフトウェアのすべての複製または重要な部分に記載するものとします。

ソフトウェアは「現状のまま」で、明示であるか暗黙であるかを問わず、何らの保証もなく提供されます。ここでいう保証とは、商品性、特定の目的への適合性、および権利非侵害についての保証も含みますが、それに限定されるものではありません。 作者または著作権者は、契約行為、不法行為、またはそれ以外であろうと、ソフトウェアに起因または関連し、あるいはソフトウェアの使用またはその他の扱いによって生じる一切の請求、損害、その他の義務について何らの責任も負わないものとします。