Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FD4FB060
	for <lists.iommu@lfdr.de>; Wed, 13 Nov 2019 13:24:37 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 66F3811B3;
	Wed, 13 Nov 2019 12:24:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B3CF011AB
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 12:24:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B5AD82B
	for <iommu@lists.linux-foundation.org>;
	Wed, 13 Nov 2019 12:24:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=CdHqUMoBUaqswrsF5JRGHE7u/LD0wHgh50X4Bm1VpxJRHpXg/CxT9OCNrwzabN85IbV58SKbF4ez6RSpZLs+kLmOQG2nyr7VUn37mpkqMiddrRsJFf1HKw1ymr99DsnEHnwzG2uoYicPzCV7RNmSXV2ISU+nPW6/Dsz/hdRwmz7EF9gTfS/R0qJE+bCVN8FdeolI7OqIzdrdSNZEyE+OaT/xeWFXN026jEqN36AQ/WwhK4cf3nWltiLymTOWRh2f6B1N5zBIwSeqwoxYft5myv1mX9i5HUiUNhcgS/VWWOaijc10sL4MHOt+mAnr5/y9csU176fG0VFB1ktIh3sVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xvZgDx8lsM9IdHWIV+urJxo4y79fh/x5+zsNC8aQtUs=;
	b=YIVteh6lDWS8Bnc1b26hBHFoYcopRslJUG/EpAu0N7ZCNsPqfbQ7OSs3THtRbjMUkC5LQWkgNWmFBkra+xW4K07Vstck0QdR64D/HiFvrurCG+a6QFft/FAUcjBJWfLESp+Zf8+5LXx0MOgfe90GSw83zU/ipcbhjUCtbETXqeUmDQ5Xum6iuxjU69Ybbc28owMZy9OtMXERckETgAWx4fu6pzdAriS/cGLJrQ6I+0wbeKMcZAiTXbnXLiw0ZTkIlynFKxcIVRaDAlI5BupqSC4TlJUHOXJQ1RIzblJLUChqVf79wtWGYMFGgmGhkb1HcQFvus29iSmWwMUdfQsrDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xvZgDx8lsM9IdHWIV+urJxo4y79fh/x5+zsNC8aQtUs=;
	b=eO3HlgXTTpPZ7G63773a6PEj/wQAUqLHWr70yC7F3QvTccHlh0UkHmaEN2kPcRXGC6ddt0RwrLz6yjOqUyvPjqxeBHOnPvnJKLzsSlto/NmwbBQDh/9qUyesGgss54sSo2P9ei8qInTYwgwWfCz82rKTCd77eo3bNGvPouSIcKM=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB6142.eurprd04.prod.outlook.com (20.179.27.138) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2430.25; Wed, 13 Nov 2019 12:24:21 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::71d2:55b3:810d:c75b]) by
	VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::71d2:55b3:810d:c75b%7]) with mapi id 15.20.2451.023;
	Wed, 13 Nov 2019 12:24:21 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>, "robin.murphy@arm.com" <robin.murphy@arm.com>, 
	"joro@8bytes.org" <joro@8bytes.org>, Ioana Ciocoi Radulescu
	<ruxandra.radulescu@nxp.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v3 2/4] iommu/dma: wire-up new dma map op .get_virt_addr
Thread-Topic: [PATCH v3 2/4] iommu/dma: wire-up new dma map op .get_virt_addr
Thread-Index: AQHVmh1GAJk81aT3UUaEgIm4Q06aaw==
Date: Wed, 13 Nov 2019 12:24:21 +0000
Message-ID: <20191113122407.1171-3-laurentiu.tudor@nxp.com>
References: <20191113122407.1171-1-laurentiu.tudor@nxp.com>
In-Reply-To: <20191113122407.1171-1-laurentiu.tudor@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR02CA0008.eurprd02.prod.outlook.com
	(2603:10a6:208:3e::21) To VI1PR04MB5134.eurprd04.prod.outlook.com
	(2603:10a6:803:5f::16)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 505612b1-bd35-493a-d0bf-08d768346942
x-ms-traffictypediagnostic: VI1PR04MB6142:|VI1PR04MB6142:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6142B0A585CDD72684D72BB9EC760@VI1PR04MB6142.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0220D4B98D
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(189003)(199004)(6486002)(66066001)(486006)(446003)(110136005)(86362001)(6436002)(44832011)(5660300002)(54906003)(2906002)(305945005)(476003)(14454004)(2201001)(6512007)(186003)(3846002)(11346002)(316002)(6116002)(66946007)(2616005)(7736002)(256004)(66556008)(66446008)(99286004)(52116002)(76176011)(6636002)(36756003)(64756008)(25786009)(2501003)(386003)(71190400001)(6506007)(478600001)(1076003)(8936002)(71200400001)(26005)(50226002)(102836004)(81156014)(81166006)(4326008)(66476007)(8676002)(142923001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB6142;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5Z8mYwfmIYUsg3J6oXL70C651Q1QXBaQduehtomxX1M6lQNmvrTc18NhZZ5zDHEvIlYWbdmQCopa+MqXkSgy8YZb2DPswrbyoX6g6csQNyAIky2HsFgLj45dPqhpWiJazQE/9IjVQ4aMyUTxuvbuwXtBRn4BOsgUiJ7fAZaHiGOohP355w7DJMSaiXlEyJ//qbJtP/LhoCx79Da9aAaT4sG1vmk1vAeFyEgmFtDbipJF8sJfJ3vVe28Q/glb6Uvsk5E/S9TljYnWpprPgRYkR2Dej9/dJanKz7YtSzfAgBcyRUGtBX6tH/bgfjoXdNd+Qe+SNTvv1jmGXoHBCNanPV70F54QrWSKdu65LrgTKFh+tnLqCD3L7ZCtNpr5F1LiEmPN2jICesYN+ZkKQk7JUZu+F4e8EMuBuqy+eOrZZV7dKReHNN4Uu0vLyQQaM0A
Content-ID: <49A734C862D36A45B3E59F06788CF2ED@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 505612b1-bd35-493a-d0bf-08d768346942
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2019 12:24:21.1850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yvXJur6ln6IGcsVTl9NjJ2ImWfv0R2BD53EPN5bHYL8qHkvUDbfvTBMQqFmp2fwwEhSYKa4EDPhpudjwbi1OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6142
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Leo Li <leoyang.li@nxp.com>,
	Camelia Alexandra Groza <camelia.groza@nxp.com>,
	"davem@davemloft.net" <davem@davemloft.net>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

From: Laurentiu Tudor <laurentiu.tudor@nxp.com>

Add an implementation of the newly introduced dma map op in the
generic DMA IOMMU generic glue layer and wire it up.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/iommu/dma-iommu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index f321279baf9e..98742c1451ce 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1091,6 +1091,18 @@ static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
 	return (1UL << __ffs(domain->pgsize_bitmap)) - 1;
 }
 
+static void *iommu_dma_get_virt_addr(struct device *dev, dma_addr_t dma_handle)
+{
+	struct iommu_domain *domain = iommu_get_dma_domain(dev);
+	phys_addr_t phys;
+
+	phys = iommu_iova_to_phys(domain, dma_handle);
+	if (phys)
+		return phys_to_virt(phys);
+
+	return NULL;
+}
+
 static const struct dma_map_ops iommu_dma_ops = {
 	.alloc			= iommu_dma_alloc,
 	.free			= iommu_dma_free,
@@ -1107,6 +1119,7 @@ static const struct dma_map_ops iommu_dma_ops = {
 	.map_resource		= iommu_dma_map_resource,
 	.unmap_resource		= iommu_dma_unmap_resource,
 	.get_merge_boundary	= iommu_dma_get_merge_boundary,
+	.get_virt_addr		= iommu_dma_get_virt_addr,
 };
 
 /*
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
