Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id AC093E2F90
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 12:55:58 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 56B9114E9;
	Thu, 24 Oct 2019 10:55:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 0A4A014B8
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 10:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130073.outbound.protection.outlook.com [40.107.13.73])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 244108B5
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 10:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=VKixqj5avaUviYARzBW3p6zhaa5e2R/Qf0kZcvj9ffoN04dUQzuehis2T+jrvmeeyPzNrXH43FRTPuR1pEPhQRaSxanFrL6y5ctqsPE9uT2HwvQW5Jud2k0qh5396TzWeO/3Amz1JMEuK1SxihIGqnBPujvMy1/Wp1FxS543tWE7nG2itOERRvHWRAdS7PxnDuHYC6iUKCJ4ue1qu6cERLNtXAmvbkrczB5MD6NESTSltK7HO7x7QcB90XZC0X0f7pU495HABk+BSf4KPpz/VT/XlElPtNtIiWR8k17SKzPLNBXlk6jAuLC0kKHh2LSn7S7QWDV6+2Zbp7cecfCnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=J/nrJVtIlUMw41hzjpoV7KQmEsK3SPrxoQekOSjK5W4=;
	b=Q/HIS8aFhjNHHEnXFntvSXg9FFDvTDQ2flAvuycjcYmcPu1Wvfxjq+HlHcUanfcYd1AZgiQ95jI7KLIb+OInHkURI1nlus2fxiRRqTfsMzCJwul5hzlPw8f3iwyrLpCTh1klQTTCAPSv8lQPPIHIWE6OQq5NmGUTKgb01+bBlPGP717efMhQcwVtvJX9zMABADROvt078taCfPynetvacD8vMbZ8naLWtTxpQCyaFcdoakizaByQiPPu7wQR2PFVT4oAZTaAePq1iTvAxfZooIGaWsT9NwzRpPMsFgikVuU1m5S/fM8S79Fav1Dmwl0t8KTceEik4fWbhEj0uRJIWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=J/nrJVtIlUMw41hzjpoV7KQmEsK3SPrxoQekOSjK5W4=;
	b=oipJeF78BYyUymDhGaYkPIdn2vuE7Q+ufg+i9wEV3LV/qcmNl6+dM02xKBC0MGZzQuLSWe9lq23Z9eu+6wvA15Y8nlzPTPMG3Zj8MQY+umXildGHNDhiBh/T3ZpPxgoyVJHJlXQtlTmPNS5x2TTtHhPq+SeQ9ziJ+WKPctfLOmY=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB4190.eurprd04.prod.outlook.com (52.134.123.151) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.22; Thu, 24 Oct 2019 10:55:48 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb%7]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 10:55:48 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>, Ioana
	Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 1/3] dma-mapping: introduce new dma unmap and sync api variants
Thread-Topic: [PATCH 1/3] dma-mapping: introduce new dma unmap and sync api
	variants
Thread-Index: AQHVilmX9H3/VaZyFkqs7UQthoDn7Q==
Date: Thu, 24 Oct 2019 10:55:47 +0000
Message-ID: <20191024105534.16102-2-laurentiu.tudor@nxp.com>
References: <20191024105534.16102-1-laurentiu.tudor@nxp.com>
In-Reply-To: <20191024105534.16102-1-laurentiu.tudor@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0040.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:61::28) To VI1PR04MB5134.eurprd04.prod.outlook.com
	(2603:10a6:803:5f::16)
x-mailer: git-send-email 2.17.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [89.37.124.34]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 32009dea-5ebc-4e15-d5a7-08d75870b9ae
x-ms-traffictypediagnostic: VI1PR04MB4190:|VI1PR04MB4190:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB419089A44CECA10A2732438FEC6A0@VI1PR04MB4190.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(189003)(199004)(446003)(71190400001)(71200400001)(2906002)(476003)(8676002)(2201001)(36756003)(316002)(1076003)(11346002)(52116002)(81156014)(14454004)(2501003)(81166006)(478600001)(7736002)(2616005)(6436002)(6486002)(4326008)(66446008)(86362001)(54906003)(186003)(6636002)(66066001)(99286004)(6116002)(66946007)(66476007)(305945005)(66556008)(8936002)(50226002)(64756008)(14444005)(3846002)(256004)(5660300002)(25786009)(486006)(6512007)(6506007)(110136005)(76176011)(44832011)(102836004)(386003)(26005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4190;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xA2BdO3AqA/e7qyMQD1m6krSwIgudN4Utcr4D8dVJnYJswn/JgcUx1WS1cuRiqIhOwN+A/T0jYgqQnU/xymHKQq1jkmYDJ/XmD5wQAcdaEt1QXMfbGc7hLJXyf//aI+GzUHU9VeDlEPoiqfrN7WZc9H9ahEL23rdQiRLfM4JMy+oCFHX8B5V3FBfkTMf97NqRSzgWi30BaEjVLMWGfEh6WKPeXKVfLrFvEFdat8dohj/DtB3rf7QyP6sm/0bt2DGJMU2jA5jbBN6St1lsAe6P4Ol8nrMl4Es/erg+7SfD4vPspjwm9BRs3Re94YgGl+Qe4zJ6sX1HYLoidSoyw8OW6PpoCDskGElyHCbSSUjmscjowQod8/1kNIMCLU2onypS6ubnZ5VRdGz1jOAMMib4wNVq4PY1TVCK5KxUYIf4ViWSexwi1FqDnTN3tsOrq9S
Content-ID: <FF2D151C549025418AD65186BA5FFF6E@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32009dea-5ebc-4e15-d5a7-08d75870b9ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 10:55:47.7934 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eyjzLJcNRI+tjD9NRjJSClt6XJjKu6Fo/K3LGoOBt/FfQqQFsIC6OuQeNWkmEab0bR/6vIr5Nt38bBZYPz8fnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4190
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

Introduce a few new dma unmap and sync variants that, on top of the
original variants, return the physical address corresponding to the
input dma address.
In order to implement this a new dma map op is added and used:
    phys_addr_t get_phys_addr(dev, dma_handle);
It does the actual conversion of an input dma address to the output
physical address.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 include/linux/dma-mapping.h | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4a1c4fca475a..d2bccb814eac 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -132,6 +132,7 @@ struct dma_map_ops {
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
 	unsigned long (*get_merge_boundary)(struct device *dev);
+	phys_addr_t (*get_phys_addr)(struct device *dev, dma_addr_t dma_handle);
 };
 
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
@@ -304,6 +305,21 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
 	debug_dma_unmap_page(dev, addr, size, dir);
 }
 
+static inline phys_addr_t
+dma_unmap_page_phys_attrs(struct device *dev, dma_addr_t addr, size_t size,
+			  enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	phys_addr_t phys = 0;
+
+	if (ops && ops->get_phys_addr)
+		phys = ops->get_phys_addr(dev, addr);
+
+	dma_unmap_page_attrs(dev, addr, size, dir, attrs);
+
+	return phys;
+}
+
 /*
  * dma_maps_sg_attrs returns 0 on error and > 0 on success.
  * It should never return a value < 0.
@@ -390,6 +406,21 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
 	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
 }
 
+static inline phys_addr_t
+dma_sync_single_for_cpu_phys(struct device *dev, dma_addr_t addr, size_t size,
+			     enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	phys_addr_t phys = 0;
+
+	if (ops && ops->get_phys_addr)
+		phys = ops->get_phys_addr(dev, addr);
+
+	dma_sync_single_for_cpu(dev, addr, size, dir);
+
+	return phys;
+}
+
 static inline void dma_sync_single_for_device(struct device *dev,
 					      dma_addr_t addr, size_t size,
 					      enum dma_data_direction dir)
@@ -500,6 +531,12 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
 		size_t size, enum dma_data_direction dir)
 {
 }
+
+static inline phys_addr_t
+dma_sync_single_for_cpu_phys(struct device *dev, dma_addr_t addr, size_t size,
+			     enum dma_data_direction dir)
+{
+}
 static inline void dma_sync_single_for_device(struct device *dev,
 		dma_addr_t addr, size_t size, enum dma_data_direction dir)
 {
@@ -594,6 +631,21 @@ static inline void dma_unmap_single_attrs(struct device *dev, dma_addr_t addr,
 	return dma_unmap_page_attrs(dev, addr, size, dir, attrs);
 }
 
+static inline phys_addr_t
+dma_unmap_single_phys_attrs(struct device *dev, dma_addr_t addr, size_t size,
+			    enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	phys_addr_t phys = 0;
+
+	if (ops && ops->get_phys_addr)
+		phys = ops->get_phys_addr(dev, addr);
+
+	dma_unmap_single_attrs(dev, addr, size, dir, attrs);
+
+	return phys;
+}
+
 static inline void dma_sync_single_range_for_cpu(struct device *dev,
 		dma_addr_t addr, unsigned long offset, size_t size,
 		enum dma_data_direction dir)
@@ -610,10 +662,13 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 
 #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
 #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
+#define dma_unmap_single_phys(d, a, s, r) \
+		dma_unmap_single_phys_attrs(d, a, s, r, 0)
 #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
 #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
 #define dma_map_page(d, p, o, s, r) dma_map_page_attrs(d, p, o, s, r, 0)
 #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
+#define dma_unmap_page_phys(d, a, s, r) dma_unmap_page_phys_attrs(d, a, s, r, 0)
 #define dma_get_sgtable(d, t, v, h, s) dma_get_sgtable_attrs(d, t, v, h, s, 0)
 #define dma_mmap_coherent(d, v, c, h, s) dma_mmap_attrs(d, v, c, h, s, 0)
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
