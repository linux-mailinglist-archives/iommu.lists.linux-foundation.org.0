Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DB9E3297
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 14:42:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08A9F1545;
	Thu, 24 Oct 2019 12:41:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 40E521535
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:41:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150084.outbound.protection.outlook.com [40.107.15.84])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id C447589C
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=KqRK04Qu0KgnmJX6yorMNv72sZKKcPTm58k1/Mjm0BqL3qJPU5mMuqG4cB5Oznl975inwXpZgZ+cfAyWwBe/gu3Xmn6+2tOMayp7FAEq06D1MvkIsQEgSq8ANMCJ+MP7nDOx76qEMsBOv1Gb/GSbVuPualcf29TE6jsRk1kogKzp5Wd1dxMYgAG5ksu4ZCAg6OP7ZLrf7AYpALKdbmG6BNVAUCLWwzO/92CU66t43ecNtRf/9nJxldWgW6eo9cNT2j1nfBpfB0OLMoID3dxL7G5eqCy+CMakNEkeNKZHt1fRecblHE55dNEfetdSgSQXr4G9MoYpPQTydz9OAWBv7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=C1PdZneEfdKn0kABbC7K+jwYIZA2H+ORAlnYSqjAs9o=;
	b=OunAyEFeccO0LDiwxv1kvPKUMfWrGLAKiIAr5xjIucEeSiYGYgDtJbCBg7qdFCfYyTew6039UYxpynwdsgf8neLbuvROJGpyIFvjHySO7LWYv2YNtO3ITN+mfSCh/SAxpHKLUly62QuV/q8qeKuD/bbSojlAqZOfnX++ICC1GEkC2egpJs2rFMnhWfpTs/AfMwf3ZN0TSWoV6PB7J3jXwMtqNz7Q4sd37kko47ZW+jIfl1VbViLSn/TdSWqaL6VVapv7lNRWNeBVx8etJOpELsWG2QiUlyuRJ3/I90Tw1GnqA5UioVFCT1bog48fFIdVBWn2fHlXDT+YLlTuu4JOqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=C1PdZneEfdKn0kABbC7K+jwYIZA2H+ORAlnYSqjAs9o=;
	b=fF7MYDS8DmXhR9kRyIjsysEBQaCioHpQ9ASUAsJGvajusyQoPVrjnbiULeZxoDpMgL3BZcF2Qbpo0W+WdCfyYgBMCyNt3SOxMJRVdxxiVFOPrVa3zvNBXB8UgWTOgiV72i933QUXgQfSpuFitnT/KsQLCneIPdkZJMuX4rtshx8=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB4701.eurprd04.prod.outlook.com (20.177.48.154) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.22; Thu, 24 Oct 2019 12:41:45 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb%7]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 12:41:45 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>, Ioana
	Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 3/3] dpaa2_eth: use new unmap and sync dma api variants
Thread-Topic: [PATCH v2 3/3] dpaa2_eth: use new unmap and sync dma api variants
Thread-Index: AQHVimhlfWE0TvO4OUun0YFZridDXg==
Date: Thu, 24 Oct 2019 12:41:45 +0000
Message-ID: <20191024124130.16871-4-laurentiu.tudor@nxp.com>
References: <20191024124130.16871-1-laurentiu.tudor@nxp.com>
In-Reply-To: <20191024124130.16871-1-laurentiu.tudor@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0278.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:a1::26) To VI1PR04MB5134.eurprd04.prod.outlook.com
	(2603:10a6:803:5f::16)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 995e25e4-b5da-44f4-0eec-08d7587f8773
x-ms-traffictypediagnostic: VI1PR04MB4701:|VI1PR04MB4701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4701048E6A93BBBA4B013597EC6A0@VI1PR04MB4701.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(199004)(189003)(66556008)(64756008)(66476007)(66946007)(66446008)(1076003)(8676002)(8936002)(81156014)(50226002)(2201001)(305945005)(66066001)(7736002)(2501003)(54906003)(99286004)(81166006)(86362001)(186003)(5660300002)(14454004)(76176011)(316002)(52116002)(6506007)(2616005)(256004)(14444005)(26005)(102836004)(386003)(6512007)(71200400001)(71190400001)(446003)(11346002)(6486002)(6436002)(25786009)(486006)(110136005)(478600001)(44832011)(4326008)(476003)(2906002)(6636002)(6116002)(3846002)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4701;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JiKrACe20Qhkg3997MAk+Dx6Sz9G9f00849G6Rbr5rMyOuZoh1Jpjd5SoCzybruqprWArhhK2RCCRxHvU/C3mcKgyHd4dIwjadcP3ye1lHjdkRBawWxUuD9OoN/RSduHx3oppK/qgytzU7FQ6QVkyVQmfjY8QiqS2zTDQKESR6n8ZBWYVD3xqPhnsYmty3mpbIntGXTUduwUIncv/6eHahe2daPF6uFXHAajx7UvKOy1b7H1RqL53yo9fzTdBUjOiCfYTGmFXuKamlqiyHopjdAvJ2WX6qFubagyyNup3fiq3z7NpY69l+NA8wR2vE5h8JxJf6CJMFQSNh4ugyx2W/pVqpeyKSO/6jppIey1i2GfhRjPQJEPL8CDLdo9aRlAlJ7UmrplDAboUSNgczoQr5OqcyN/aFOrBuXGL/iGWI+Nv/95cJr1vo7T/2mzu5sq
Content-ID: <A594FFC39A7BD74EA5ADE32E48C8FB3D@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 995e25e4-b5da-44f4-0eec-08d7587f8773
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 12:41:45.7037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tK9BGAcYRzxMd/w8igvpx6g/WOyifYDCoV2UCB/XdHVhPEP3nIB08csLN8CXK+lTm66NsBxZJy5/WsUi1h8gBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4701
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Madalin Bucur <madalin.bucur@nxp.com>, Leo Li <leoyang.li@nxp.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
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

Convert this driver to usage of the newly introduced dma unmap and
sync DMA APIs. This will get rid of the unsupported direct usage of
iommu_iova_to_phys() API.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  | 40 +++++++------------
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.h  |  1 -
 2 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 19379bae0144..8c3391e6e598 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -29,16 +29,6 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Freescale Semiconductor, Inc");
 MODULE_DESCRIPTION("Freescale DPAA2 Ethernet Driver");
 
-static void *dpaa2_iova_to_virt(struct iommu_domain *domain,
-				dma_addr_t iova_addr)
-{
-	phys_addr_t phys_addr;
-
-	phys_addr = domain ? iommu_iova_to_phys(domain, iova_addr) : iova_addr;
-
-	return phys_to_virt(phys_addr);
-}
-
 static void validate_rx_csum(struct dpaa2_eth_priv *priv,
 			     u32 fd_status,
 			     struct sk_buff *skb)
@@ -85,9 +75,10 @@ static void free_rx_fd(struct dpaa2_eth_priv *priv,
 	sgt = vaddr + dpaa2_fd_get_offset(fd);
 	for (i = 1; i < DPAA2_ETH_MAX_SG_ENTRIES; i++) {
 		addr = dpaa2_sg_get_addr(&sgt[i]);
-		sg_vaddr = dpaa2_iova_to_virt(priv->iommu_domain, addr);
-		dma_unmap_page(dev, addr, DPAA2_ETH_RX_BUF_SIZE,
-			       DMA_BIDIRECTIONAL);
+		sg_vaddr = page_to_virt
+				(dma_unmap_page_desc(dev, addr,
+						    DPAA2_ETH_RX_BUF_SIZE,
+						    DMA_BIDIRECTIONAL));
 
 		free_pages((unsigned long)sg_vaddr, 0);
 		if (dpaa2_sg_is_final(&sgt[i]))
@@ -143,9 +134,10 @@ static struct sk_buff *build_frag_skb(struct dpaa2_eth_priv *priv,
 
 		/* Get the address and length from the S/G entry */
 		sg_addr = dpaa2_sg_get_addr(sge);
-		sg_vaddr = dpaa2_iova_to_virt(priv->iommu_domain, sg_addr);
-		dma_unmap_page(dev, sg_addr, DPAA2_ETH_RX_BUF_SIZE,
-			       DMA_BIDIRECTIONAL);
+		sg_vaddr = page_to_virt
+				(dma_unmap_page_desc(dev, sg_addr,
+						    DPAA2_ETH_RX_BUF_SIZE,
+						    DMA_BIDIRECTIONAL));
 
 		sg_length = dpaa2_sg_get_len(sge);
 
@@ -210,9 +202,9 @@ static void free_bufs(struct dpaa2_eth_priv *priv, u64 *buf_array, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		vaddr = dpaa2_iova_to_virt(priv->iommu_domain, buf_array[i]);
-		dma_unmap_page(dev, buf_array[i], DPAA2_ETH_RX_BUF_SIZE,
-			       DMA_BIDIRECTIONAL);
+		vaddr = page_to_virt(dma_unmap_page_desc(dev, buf_array[i],
+							 DPAA2_ETH_RX_BUF_SIZE,
+							 DMA_BIDIRECTIONAL));
 		free_pages((unsigned long)vaddr, 0);
 	}
 }
@@ -369,9 +361,8 @@ static void dpaa2_eth_rx(struct dpaa2_eth_priv *priv,
 	/* Tracing point */
 	trace_dpaa2_rx_fd(priv->net_dev, fd);
 
-	vaddr = dpaa2_iova_to_virt(priv->iommu_domain, addr);
-	dma_sync_single_for_cpu(dev, addr, DPAA2_ETH_RX_BUF_SIZE,
-				DMA_BIDIRECTIONAL);
+	vaddr = dma_sync_single_for_cpu_desc(dev, addr, DPAA2_ETH_RX_BUF_SIZE,
+					     DMA_BIDIRECTIONAL);
 
 	fas = dpaa2_get_fas(vaddr, false);
 	prefetch(fas);
@@ -682,7 +673,8 @@ static void free_tx_fd(const struct dpaa2_eth_priv *priv,
 	u32 fd_len = dpaa2_fd_get_len(fd);
 
 	fd_addr = dpaa2_fd_get_addr(fd);
-	buffer_start = dpaa2_iova_to_virt(priv->iommu_domain, fd_addr);
+	buffer_start = dma_sync_single_for_cpu_desc(dev, fd_addr, sizeof(*swa),
+						    DMA_BIDIRECTIONAL);
 	swa = (struct dpaa2_eth_swa *)buffer_start;
 
 	if (fd_format == dpaa2_fd_single) {
@@ -3448,8 +3440,6 @@ static int dpaa2_eth_probe(struct fsl_mc_device *dpni_dev)
 	priv = netdev_priv(net_dev);
 	priv->net_dev = net_dev;
 
-	priv->iommu_domain = iommu_get_domain_for_dev(dev);
-
 	/* Obtain a MC portal */
 	err = fsl_mc_portal_allocate(dpni_dev, FSL_MC_IO_ATOMIC_CONTEXT_PORTAL,
 				     &priv->mc_io);
diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.h b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.h
index 8a0e65b3267f..4e5183617ebd 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.h
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.h
@@ -374,7 +374,6 @@ struct dpaa2_eth_priv {
 
 	struct fsl_mc_device *dpbp_dev;
 	u16 bpid;
-	struct iommu_domain *iommu_domain;
 
 	bool tx_tstamp; /* Tx timestamping enabled */
 	bool rx_tstamp; /* Rx timestamping enabled */
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
