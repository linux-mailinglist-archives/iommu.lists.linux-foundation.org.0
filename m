Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 124DAE3292
	for <lists.iommu@lfdr.de>; Thu, 24 Oct 2019 14:41:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id AE37D1540;
	Thu, 24 Oct 2019 12:41:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD8AA1535
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:41:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-eopbgr150084.outbound.protection.outlook.com [40.107.15.84])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CEF0D89C
	for <iommu@lists.linux-foundation.org>;
	Thu, 24 Oct 2019 12:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P8O+uE8l0sPJ/qUIcG/3Fve7V062q5cGrlsePzuYuuCxdS0QKsQnyXdL58M50AwIxaKRY/Hb/katl4u1KNNNidS9rd/Vlh7dqwa+wB6/EqVyHj9heFcJDGHR6LnFHgSpChY/FpY2DzuEaycQF0qkVYea4jQkmFWOH3eTDUtSDV51Oi1O1kpJRsV/dX4FV4gZvIbiBklwjdcY0tyWoqgvdGcxI4EasHLsecj8iKT/KWc07yTJTU9ApYt+xFz8Mq61EkkdnLAUzlGuUtoriR7Qb2NiJLb/jrV09G5chXzyubZSHzhFiv83dPaZL/9VD0kfGBOCrKFh35a9e2g05JcAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BSBFRP4DRoFcrSgqeCUmxnwOPMiOtLBJI5VddwSuYpg=;
	b=fCQ3a33ZDe9/HNMivtPJLdMmDwlnPttnoBPSY2sAdeyHZXp84n1KhubhSV/8wuGCog4MuZaMxYl8zz8QJ3wAd3wme7mlglyI4DDkR+9kGPrx3gH+OhLCkhnQzVlcD9ECFa34N+UF3TMO9W+L4g3SjzFpTEt8iGmz0fCoYPgpxRqCbyfLQdJ/4GtcsTd+pEIfiPlL49/ZIPCD5mQxv4qkAdqy5nf1E5CCCuuOA3Ic2c8g4V3sUWlFVlz0vhjqM1Y0QlWw+1mOlr33FQHy4jBYqfPj0Z8dOc8syFcfamq1T+gFjZxaTNhOPRO2vq4sPFNShuUsFfznzEqbv8WR6+WrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BSBFRP4DRoFcrSgqeCUmxnwOPMiOtLBJI5VddwSuYpg=;
	b=Aukd6gW66OHpr96XZnLlvuSdnLKNqnwoSqTvaiQrqpBVoEYgVAnpCHieKZmNL45mnLgRs5nNFpqz8PALLNvwdLrFJ48PuGlUYCnGgEA2SP/vaunsF/93wlzUww+8TYNiwwkqUDnAT+A1aAzm3JGawcAkPltCHm3Ej1ITnF0hNwY=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB4701.eurprd04.prod.outlook.com (20.177.48.154) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.22; Thu, 24 Oct 2019 12:41:42 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb%7]) with mapi id 15.20.2347.030;
	Thu, 24 Oct 2019 12:41:42 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>, "joro@8bytes.org" <joro@8bytes.org>, Ioana
	Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	"linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "iommu@lists.linux-foundation.org"
	<iommu@lists.linux-foundation.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH v2 1/3] dma-mapping: introduce new dma unmap and sync api
	variants
Thread-Topic: [PATCH v2 1/3] dma-mapping: introduce new dma unmap and sync api
	variants
Thread-Index: AQHVimhiysgNu4P7eUCr9wwTZY4WUQ==
Date: Thu, 24 Oct 2019 12:41:41 +0000
Message-ID: <20191024124130.16871-2-laurentiu.tudor@nxp.com>
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
x-ms-office365-filtering-correlation-id: f11b17da-f791-4a9e-fa40-08d7587f854e
x-ms-traffictypediagnostic: VI1PR04MB4701:|VI1PR04MB4701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB470187712AC17A23DC9E28F3EC6A0@VI1PR04MB4701.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:862;
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
x-microsoft-antispam-message-info: MDxOGLHBtqpx+ZiUv2yY/8G/NH09ljTyrtXcV3DzcmpfJv2XT50FbGdU0GSbjU3moEsMnZuPkWO98lZxRCFamfPvSjIHfbGB+mSHEn7CHqKRauSBVWdDqwfTRagli9nWrep7OrVWasZSY2/B/tE0ZadItxRm2BN7EmKLE492ujR0OMj58d0sXvvgHVCdgWNcF0EsYQ8hwKzeauUdirHpboPqxsHZC4b65xt/MCVDcjjhHbfXw5CL6Ge2yPlgEJi+9lMVzpVvFwszd+VuUteB5CLI2TBbyMnA3s3SpuxaBueyrcKSJqG3aF3arxI0vdQs0YnC77i02wMEdD93395utiiI5IU5hUan2nIfYjTVx3KUMZr5YAyDkFG9FzqduToeGubXEz1+YAjMORc333UOnJ3X5JtYt3d39pT/sYdsUxXcJ+NHAPRs++ZMagXl60FC
Content-ID: <D9F926365C2F0C438647A8D89021A054@eurprd04.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f11b17da-f791-4a9e-fa40-08d7587f854e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 12:41:41.9069 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hF0RoxaKnWbBDFqnLfkQUa3qvd8Dl6vhuUnDvAunxOMWvpXP2zyDXMNhN4F3eXCTFFnw2El2tahaxiRi4RU2pw==
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

Introduce a few new dma unmap and sync variants that, on top of the
original variants, return the virtual address corresponding to the
input dma address.
In order to implement this a new dma map op is added and used:
    void *get_virt_addr(dev, dma_handle);
It does the actual conversion of an input dma address to the output
virtual address.

Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 include/linux/dma-mapping.h | 55 +++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 4a1c4fca475a..ae7bb8a84b9d 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -132,6 +132,7 @@ struct dma_map_ops {
 	u64 (*get_required_mask)(struct device *dev);
 	size_t (*max_mapping_size)(struct device *dev);
 	unsigned long (*get_merge_boundary)(struct device *dev);
+	void *(*get_virt_addr)(struct device *dev, dma_addr_t dma_handle);
 };
 
 #define DMA_MAPPING_ERROR		(~(dma_addr_t)0)
@@ -304,6 +305,21 @@ static inline void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr,
 	debug_dma_unmap_page(dev, addr, size, dir);
 }
 
+static inline struct page *
+dma_unmap_page_attrs_desc(struct device *dev, dma_addr_t addr, size_t size,
+			  enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	void *ptr = NULL;
+
+	if (ops && ops->get_virt_addr)
+		ptr = ops->get_virt_addr(dev, addr);
+
+	dma_unmap_page_attrs(dev, addr, size, dir, attrs);
+
+	return ptr ? virt_to_page(ptr) : NULL;
+}
+
 /*
  * dma_maps_sg_attrs returns 0 on error and > 0 on success.
  * It should never return a value < 0.
@@ -390,6 +406,21 @@ static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
 	debug_dma_sync_single_for_cpu(dev, addr, size, dir);
 }
 
+static inline void *
+dma_sync_single_for_cpu_desc(struct device *dev, dma_addr_t addr, size_t size,
+			     enum dma_data_direction dir)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	void *ptr = NULL;
+
+	if (ops && ops->get_virt_addr)
+		ptr = ops->get_virt_addr(dev, addr);
+
+	dma_sync_single_for_cpu(dev, addr, size, dir);
+
+	return ptr;
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
+static inline void *
+dma_sync_single_for_cpu_desc(struct device *dev, dma_addr_t addr, size_t size,
+			     enum dma_data_direction dir)
+{
+}
 static inline void dma_sync_single_for_device(struct device *dev,
 		dma_addr_t addr, size_t size, enum dma_data_direction dir)
 {
@@ -594,6 +631,21 @@ static inline void dma_unmap_single_attrs(struct device *dev, dma_addr_t addr,
 	return dma_unmap_page_attrs(dev, addr, size, dir, attrs);
 }
 
+static inline void *
+dma_unmap_single_attrs_desc(struct device *dev, dma_addr_t addr, size_t size,
+			    enum dma_data_direction dir, unsigned long attrs)
+{
+	const struct dma_map_ops *ops = get_dma_ops(dev);
+	void *ptr = NULL;
+
+	if (ops && ops->get_virt_addr)
+		ptr = ops->get_virt_addr(dev, addr);
+
+	dma_unmap_single_attrs(dev, addr, size, dir, attrs);
+
+	return ptr;
+}
+
 static inline void dma_sync_single_range_for_cpu(struct device *dev,
 		dma_addr_t addr, unsigned long offset, size_t size,
 		enum dma_data_direction dir)
@@ -610,10 +662,13 @@ static inline void dma_sync_single_range_for_device(struct device *dev,
 
 #define dma_map_single(d, a, s, r) dma_map_single_attrs(d, a, s, r, 0)
 #define dma_unmap_single(d, a, s, r) dma_unmap_single_attrs(d, a, s, r, 0)
+#define dma_unmap_single_desc(d, a, s, r) \
+		dma_unmap_single_attrs_desc(d, a, s, r, 0)
 #define dma_map_sg(d, s, n, r) dma_map_sg_attrs(d, s, n, r, 0)
 #define dma_unmap_sg(d, s, n, r) dma_unmap_sg_attrs(d, s, n, r, 0)
 #define dma_map_page(d, p, o, s, r) dma_map_page_attrs(d, p, o, s, r, 0)
 #define dma_unmap_page(d, a, s, r) dma_unmap_page_attrs(d, a, s, r, 0)
+#define dma_unmap_page_desc(d, a, s, r) dma_unmap_page_attrs_desc(d, a, s, r, 0)
 #define dma_get_sgtable(d, t, v, h, s) dma_get_sgtable_attrs(d, t, v, h, s, 0)
 #define dma_mmap_coherent(d, v, c, h, s) dma_mmap_attrs(d, v, c, h, s, 0)
 
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
