Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFC3E81C4
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 08:05:45 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 96717DDD;
	Tue, 29 Oct 2019 07:05:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AD03CDCE
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 07:05:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30085.outbound.protection.outlook.com [40.107.3.85])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0B93842D
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 07:05:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Jk4149nGWqpoUBCxeyVINNgdciy5BBPeX+i9P/e59TYZHRPKpgp4PoJLGX6HF05UTBi+huxjmU35oa9sjcVtVES0RNKRAasaMQ6h6ri7oaK8bFh8s+JizgIl/DwH3BGyIRM8GScWc7nZas709nGOG4IWKUubhdq9bZ5vp1Yfg5s9ngdya4jfuJeZG99Qu99DNqPCwW3Vv+r98cGKJNmaPllPBu4jAoyCev2Pa/81D7USDtqr/8Kh3aXAeDI1KKNDbb31p8WAL7WACC+5aXHqf1zxPS2tQ30q6MHf/PPzcPsBe8rzOqmRw8QAu0gOLMJxCKUQvjwnTIe5IFLbNV2zAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a0nGv4+Jux5Ik1K2x8sChxCQw3i7x0FLTh002Vsl/zs=;
	b=SNm9IVby8Wn5O52/zHRsb9MI5jqjn4iRKb8ZX/I88k+cfCcqxwXBso4rPP0L5uKhCMLeEJ2oICjlnThqAuvg+cotQWlT+VG32b4A/EIzaZzuskL0Fhh1TJ37yz2Hm3TXJeLfBoMWY4wXPvpqsS2W8mC5dPBKtP476WZviNFfBRw75zjE8dgSZhuPnZENlYi+FGjtF/e1+LZRicnlW7MB+0pBDEfrNJwEUEgKVH+HjH27LIJgdxwz6qTIkSoXB3yncLwMsOFT+plBnD+T3UfjjntAZtzboX3xyL1S54TJhIUEcXFVu4EbZ/xzzlgYGZmZrHShhL0ysOaIBZNW6x4OsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=a0nGv4+Jux5Ik1K2x8sChxCQw3i7x0FLTh002Vsl/zs=;
	b=X5HUVrO6ptsspd1q7tSCF+VD2r9rh76DwKsiz9CvWgo0xrWryQg9QT/nOjPbYiTyrqadX9KJnNXqw8xPk5v7DCFUaMWDTjwBUsVxwKeWQVoYTWRsJGwLHflmh/V1dqq1eI1kJNzHBQaaunNTeJOcuXTJZj/+hKzhg61APyka1pU=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.51.208) by
	VI1PR04MB7118.eurprd04.prod.outlook.com (10.186.157.140) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.22; Tue, 29 Oct 2019 07:05:36 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::10f0:af2c:76ac:dfb%7]) with mapi id 15.20.2387.025;
	Tue, 29 Oct 2019 07:05:36 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: "hch@lst.de" <hch@lst.de>
Subject: RE: [PATCH v2 1/3] dma-mapping: introduce new dma unmap and sync api
	variants
Thread-Topic: [PATCH v2 1/3] dma-mapping: introduce new dma unmap and sync api
	variants
Thread-Index: AQHVimhiysgNu4P7eUCr9wwTZY4WUadwBEWAgAE0mtA=
Date: Tue, 29 Oct 2019 07:05:36 +0000
Message-ID: <VI1PR04MB51340164BACC952498E46FFDEC610@VI1PR04MB5134.eurprd04.prod.outlook.com>
References: <20191024124130.16871-1-laurentiu.tudor@nxp.com>
	<20191024124130.16871-2-laurentiu.tudor@nxp.com>
	<20191028123805.GA25160@lst.de>
In-Reply-To: <20191028123805.GA25160@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-originating-ip: [86.123.56.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: caffd9bc-47b8-495a-0b67-08d75c3e660b
x-ms-traffictypediagnostic: VI1PR04MB7118:|VI1PR04MB7118:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB7118B1C5A1438512BA581A1FEC610@VI1PR04MB7118.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0205EDCD76
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(199004)(189003)(13464003)(305945005)(486006)(44832011)(7736002)(55016002)(11346002)(102836004)(6916009)(6506007)(316002)(54906003)(66556008)(186003)(14454004)(26005)(66476007)(5660300002)(3846002)(99286004)(76116006)(66446008)(64756008)(7696005)(14444005)(9686003)(2351001)(76176011)(256004)(6116002)(81156014)(476003)(8676002)(66066001)(446003)(71200400001)(71190400001)(74316002)(1730700003)(478600001)(6246003)(33656002)(81166006)(229853002)(4326008)(2501003)(8936002)(52536014)(6436002)(2906002)(5640700003)(86362001)(25786009)(66946007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB7118;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /0Cc5QupfQ/1ckzXmS4Rp6/zeiFxA4Q1606vLSI9S098Qf0fbBj35ZzJz4hPiqJelPKZ20KD0EMFw5yGFePSoRv5cGQ14y5CfROnO+A/oKF16WFAPMQoxjG+XzQVLzNy1DNakAHZL/GPn8stDZcIUnbX17bUEBryNGJ6pmnF7lgG8p2YElcDm5/Bty3JUhI85HXx5hl+8ZZMYkvGoCpvxW9+um9h6WiHbWZXxU+xUJVG2RzEjSrgp7FiJVmA41XPQsrOdA8D6YB/FC44IUReeNualsbLn7AO4fQW8o4p3WYa79imNgIn7LltOvLQIGZ1YM2aU6qDuF6k3/moC+FY57ItheZYYoD51hanPO/FpXI09ze88Eyva86c7huj/ioBnfVhyTVLcf7tdyonEsLJ4RJ4d7qLfCBluxGaIGPM7eWm4bNv0l2nIhOv/N1xVcvP
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caffd9bc-47b8-495a-0b67-08d75c3e660b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2019 07:05:36.3983 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /aP4bRnk00Mi601WtGsCIALgf0nUPLLCvomfZv2gMlawlM7wJxNoOaayh5UlIsQsb6wg+b9AV1m8VCHQTfyZHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7118
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leo Li <leoyang.li@nxp.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
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



> -----Original Message-----
> From: hch@lst.de <hch@lst.de>
> Sent: Monday, October 28, 2019 2:38 PM
> 
> On Thu, Oct 24, 2019 at 12:41:41PM +0000, Laurentiu Tudor wrote:
> > From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> >
> > Introduce a few new dma unmap and sync variants that, on top of the
> > original variants, return the virtual address corresponding to the
> > input dma address.
> > In order to implement this a new dma map op is added and used:
> >     void *get_virt_addr(dev, dma_handle);
> > It does the actual conversion of an input dma address to the output
> > virtual address.
> 
> We'll definitively need an implementation for dma-direct at least as
> well.  Also as said previously we need a dma_can_unmap_by_dma_addr()
> or similar helper that tells the driver beforehand if this works, so
> that the driver can either use a sub-optimal workaround or fail the
> probe if this functionality isn't implemented.

Alright. On top of that I need to make this work on booke ppc as we have one driver that runs both on arm and ppc and will use these APIs.

---
Best Regards, Laurentiu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
