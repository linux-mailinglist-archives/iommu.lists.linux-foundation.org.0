Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CEE043E
	for <lists.iommu@lfdr.de>; Tue, 22 Oct 2019 14:55:36 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 546A9105E;
	Tue, 22 Oct 2019 12:55:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 06B40B0B
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 12:55:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50078.outbound.protection.outlook.com [40.107.5.78])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3582A8A2
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 12:55:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Xvjz0h2ow+jh/wstdHaOrzvqkdRZXqD292zeLgbfL1ZELa3CsXksarCSEE+8XZpNO+RjtFV9wdUzymQP/qMKCgLzU3a3ShLfufM/KF9spLRN53+NVjccgD8k8U1etUWzaSBsgjchYT4NviBGexuvFCzwe8wdHYfzo4RPuXpt7PRfEklzHrrGG4K6o1RIu+vW+ZmWa9ILFeV0vHN/NRF+/l/CzhGE9w8+urfgTeT5pBYSkyBkjBMMIytgIYdOXnos5HXze9VKbY6A3sbWdBmpQWh50lIUUBzgIIMFCmxPJokRTGrRjk46df5g8LwjVxGqsNxKKyyJHpkuf3kzY2629w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Qm5JDl1y8kuM97BxSrOo/kjgn6CuTVIJx95FYjY4qJg=;
	b=ivgM3NtNwIC7RaOR1bZIYtalNQsB20P/qrAv1m2zjzeJpppBRfT2/kjORsIEsNt8hnAEMz4Y7wJ3F0sORXed8OOStX/l53esALv1Wz6zKx8l+Y907FzTBjtf//ckoyk3zP5ejNsaPW8NlCZKRPsna7p1JjUUhyEDP3nrwZlVcwho7SdYfAyE16stTr3KD2vKjA2akgtNQsSZhpiVTLy9We3G3zyvrnzWC6jDPsJjebY75XR5MQ6Z0U+pqMegej+VfmpYWeFJ6dwA3K7cI35GlMWuexQqJmc0wnSXYLQlwQ7pqzUWOFaIMK7FQ+cvf2NifY4T/yuUAIoSw8pOe7jeVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Qm5JDl1y8kuM97BxSrOo/kjgn6CuTVIJx95FYjY4qJg=;
	b=X+hVdefrTKPahvwR8zks85pNDeAv9vchcMwffvYPadmNgc5evo/QZ7LyXEr62SZZFoPL2BAJtKBhRo96ohP1DGL40c+jZ18C1lF7c69W2Y8NIohQdQkpDmgo9N8cIIpArsk0aUOVJjQ/gqhpI3e/xvsw4o0qE7/f6lJ+Ivga1oc=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB5053.eurprd04.prod.outlook.com (20.177.49.94) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.16; Tue, 22 Oct 2019 12:55:18 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb%7]) with mapi id 15.20.2347.029;
	Tue, 22 Oct 2019 12:55:17 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>, Ioana
	Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [RFC PATCH 3/3] dpaa2_eth: use dma_addr_to_phys_addr() new dma api
Thread-Topic: [RFC PATCH 3/3] dpaa2_eth: use dma_addr_to_phys_addr() new dma
	api
Thread-Index: AQHViNf0dhnJpC3HQk2GUJXKAPp57w==
Date: Tue, 22 Oct 2019 12:55:17 +0000
Message-ID: <20191022125502.12495-4-laurentiu.tudor@nxp.com>
References: <20191022125502.12495-1-laurentiu.tudor@nxp.com>
In-Reply-To: <20191022125502.12495-1-laurentiu.tudor@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM6P193CA0066.EURP193.PROD.OUTLOOK.COM
	(2603:10a6:209:8e::43) To VI1PR04MB5134.eurprd04.prod.outlook.com
	(2603:10a6:803:5f::16)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b9a16084-3fc9-4449-303e-08d756ef16a8
x-ms-traffictypediagnostic: VI1PR04MB5053:|VI1PR04MB5053:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB50536A22913F224A6ECFF8B1EC680@VI1PR04MB5053.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(199004)(189003)(66446008)(64756008)(5660300002)(66556008)(25786009)(66476007)(66946007)(36756003)(2501003)(14454004)(71190400001)(71200400001)(110136005)(54906003)(1076003)(478600001)(316002)(66066001)(7736002)(102836004)(6636002)(186003)(2906002)(6486002)(476003)(6512007)(3846002)(386003)(6436002)(50226002)(2201001)(26005)(81156014)(305945005)(81166006)(8936002)(86362001)(76176011)(6116002)(6506007)(99286004)(8676002)(52116002)(2616005)(44832011)(446003)(4326008)(486006)(256004)(14444005)(11346002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5053;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B5yRbk2awoUFSbGV2VchzgEhLgzEj3iIDOtUv78G6zSPzcDKCW6M+ME9BxHovze42pgqPq1qCBc32nqIRisN0vibwZyq0c2tWfr3TaMzNJF6/6or7L0pyBJdNcGeFz1P0jZvlmzbxsElCMP6bvEMS691SdJI/qsSvSu6B1yLbMO00+oFxzY4iwiwLH4Nf/OZq6he60ybr+BnCbZnYwou1Hh/EUfjT35OgtxafXA9QFc2MPNb4UuhMGGFzkhxhtqVcZX1WR6w5PmHVll9+1jZNQ02VSzEE/F9KT2ooA63JofEfdJ8OcWThLQ5+4Zoq5Wg7xUbiwQzqgTmoaQGD0eGVPpqiwHCoWD/gSjlbCQvppiT2d5SuSuGKYiKVvzOif/B3kTabrr+FeSNf7zvlJ+GF06kuaF/r3GDEHWr/sbXAL6gpGOf3LcvTmHCf3peZZUu
Content-ID: <2BF0507B532F9846BF9B8147FD22494A@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a16084-3fc9-4449-303e-08d756ef16a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 12:55:17.8455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+G5RyTWCfhi2iye2oirdIOHEmvCCNfsJF8YH+WJCfv3StD6IUHPwfvVeR7xpKB1H0+m3f1iH92Xd9A45S7CGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5053
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>, Leo Li <leoyang.li@nxp.com>,
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

Convert this driver to usage of the newly introduced
dma_addr_to_phys_addr() DMA API. This will get rid of the unsupported
direct usage of iommu_iova_to_phys() API.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.c  | 21 +++++++------------
 .../net/ethernet/freescale/dpaa2/dpaa2-eth.h  |  1 -
 2 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
index 19379bae0144..7332b91ca3a2 100644
--- a/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
+++ b/drivers/net/ethernet/freescale/dpaa2/dpaa2-eth.c
@@ -29,14 +29,9 @@ MODULE_LICENSE("Dual BSD/GPL");
 MODULE_AUTHOR("Freescale Semiconductor, Inc");
 MODULE_DESCRIPTION("Freescale DPAA2 Ethernet Driver");
 
-static void *dpaa2_iova_to_virt(struct iommu_domain *domain,
-				dma_addr_t iova_addr)
+static void *dpaa2_iova_to_virt(struct device *dev, dma_addr_t dma_handle)
 {
-	phys_addr_t phys_addr;
-
-	phys_addr = domain ? iommu_iova_to_phys(domain, iova_addr) : iova_addr;
-
-	return phys_to_virt(phys_addr);
+	return phys_to_virt(dma_addr_to_phys_addr(dev, dma_handle));
 }
 
 static void validate_rx_csum(struct dpaa2_eth_priv *priv,
@@ -85,7 +80,7 @@ static void free_rx_fd(struct dpaa2_eth_priv *priv,
 	sgt = vaddr + dpaa2_fd_get_offset(fd);
 	for (i = 1; i < DPAA2_ETH_MAX_SG_ENTRIES; i++) {
 		addr = dpaa2_sg_get_addr(&sgt[i]);
-		sg_vaddr = dpaa2_iova_to_virt(priv->iommu_domain, addr);
+		sg_vaddr = dpaa2_iova_to_virt(dev, addr);
 		dma_unmap_page(dev, addr, DPAA2_ETH_RX_BUF_SIZE,
 			       DMA_BIDIRECTIONAL);
 
@@ -143,7 +138,7 @@ static struct sk_buff *build_frag_skb(struct dpaa2_eth_priv *priv,
 
 		/* Get the address and length from the S/G entry */
 		sg_addr = dpaa2_sg_get_addr(sge);
-		sg_vaddr = dpaa2_iova_to_virt(priv->iommu_domain, sg_addr);
+		sg_vaddr = dpaa2_iova_to_virt(dev, sg_addr);
 		dma_unmap_page(dev, sg_addr, DPAA2_ETH_RX_BUF_SIZE,
 			       DMA_BIDIRECTIONAL);
 
@@ -210,7 +205,7 @@ static void free_bufs(struct dpaa2_eth_priv *priv, u64 *buf_array, int count)
 	int i;
 
 	for (i = 0; i < count; i++) {
-		vaddr = dpaa2_iova_to_virt(priv->iommu_domain, buf_array[i]);
+		vaddr = dpaa2_iova_to_virt(dev, buf_array[i]);
 		dma_unmap_page(dev, buf_array[i], DPAA2_ETH_RX_BUF_SIZE,
 			       DMA_BIDIRECTIONAL);
 		free_pages((unsigned long)vaddr, 0);
@@ -369,7 +364,7 @@ static void dpaa2_eth_rx(struct dpaa2_eth_priv *priv,
 	/* Tracing point */
 	trace_dpaa2_rx_fd(priv->net_dev, fd);
 
-	vaddr = dpaa2_iova_to_virt(priv->iommu_domain, addr);
+	vaddr = dpaa2_iova_to_virt(dev, addr);
 	dma_sync_single_for_cpu(dev, addr, DPAA2_ETH_RX_BUF_SIZE,
 				DMA_BIDIRECTIONAL);
 
@@ -682,7 +677,7 @@ static void free_tx_fd(const struct dpaa2_eth_priv *priv,
 	u32 fd_len = dpaa2_fd_get_len(fd);
 
 	fd_addr = dpaa2_fd_get_addr(fd);
-	buffer_start = dpaa2_iova_to_virt(priv->iommu_domain, fd_addr);
+	buffer_start = dpaa2_iova_to_virt(dev, fd_addr);
 	swa = (struct dpaa2_eth_swa *)buffer_start;
 
 	if (fd_format == dpaa2_fd_single) {
@@ -3448,8 +3443,6 @@ static int dpaa2_eth_probe(struct fsl_mc_device *dpni_dev)
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
