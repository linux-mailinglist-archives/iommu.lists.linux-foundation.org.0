Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B62C8274FB
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 06:16:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id BE39AF25;
	Thu, 23 May 2019 04:16:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1809AF1F
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 04:16:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410139.outbound.protection.outlook.com [40.107.141.139])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6F3D081A
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 04:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=zt/uipm5zsh9iKCQro4Z9mxBbevRldG5Tm9VcGcOszQ=;
	b=KJOSpINmRY3/KT5V/ebO7qGabPmLxuNQ9eXfxP+qJos506xTbDjQZdFWTtDMkeWWBKM/9py+pQl6BNVVdJ6R/Arm3+yEzt3+on/px312Q1mpNBjfOqPo7r1ODR82u1ceRSoS+FCNPc4AacRxAG2piz+2mSPYV9+XJVmB3Otnd5E=
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com (52.134.247.150) by
	OSAPR01MB4690.jpnprd01.prod.outlook.com (20.179.176.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.16; Thu, 23 May 2019 04:15:58 +0000
Received: from OSAPR01MB3089.jpnprd01.prod.outlook.com
	([fe80::4597:5353:28fb:cfd8]) by
	OSAPR01MB3089.jpnprd01.prod.outlook.com
	([fe80::4597:5353:28fb:cfd8%7]) with mapi id 15.20.1922.017;
	Thu, 23 May 2019 04:15:58 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: RE: [PATCH v3 3/3] mmc: renesas_sdhi: use multiple segments if
	possible
Thread-Topic: [PATCH v3 3/3] mmc: renesas_sdhi: use multiple segments if
	possible
Thread-Index: AQHVEIhjlypG6+YeLUuqUYoEqb9HzqZ3Es6AgAD9d8A=
Date: Thu, 23 May 2019 04:15:58 +0000
Message-ID: <OSAPR01MB30890D412403BE3DF5C34D6BD8010@OSAPR01MB3089.jpnprd01.prod.outlook.com>
References: <1558520319-16452-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1558520319-16452-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190522122901.GA4583@infradead.org>
In-Reply-To: <20190522122901.GA4583@infradead.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 16908ba5-2fb9-4f96-dee5-08d6df355bc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:OSAPR01MB4690; 
x-ms-traffictypediagnostic: OSAPR01MB4690:
x-microsoft-antispam-prvs: <OSAPR01MB4690B3BFDCA0D55FA0821676D8010@OSAPR01MB4690.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(376002)(39860400002)(396003)(346002)(199004)(189003)(4326008)(66556008)(66446008)(73956011)(8676002)(76116006)(64756008)(66476007)(9686003)(6246003)(14454004)(53936002)(8936002)(81166006)(33656002)(81156014)(66946007)(52536014)(478600001)(305945005)(186003)(7736002)(74316002)(229853002)(6436002)(55016002)(6916009)(68736007)(446003)(476003)(76176011)(7696005)(316002)(11346002)(6116002)(3846002)(99286004)(2906002)(54906003)(5660300002)(256004)(86362001)(66066001)(102836004)(486006)(26005)(6506007)(71190400001)(71200400001)(14444005)(25786009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSAPR01MB4690;
	H:OSAPR01MB3089.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c85yS6krjVsz/Q5aF6wxgUNhPHVzNLBUbTkAxyKqjrz8vnsHz3InNvOX1SC0nQXtsgDrq34Uu4rr+yT7BCvMjJ8KrpyP4Fn033GyHix37ebYQ4yf+HtCAQykcVK8kzRDBXdK08t8NQQWfkFAa+T4ScGc/UvoZF/3xgJo2sfZA7jfinFLWIRbKFQYwsFxJliqDnNXtcmWjjhIEziqOwTr5bxor64i1aD7vMygFixZG3mlOckQESw4BOZdRz+Y/cyt35HjIK0tmBUcIF466b8ZrkKpXrZ7ejsFzvnQPLCs68Dz5nhRcCVlm2p1/wdtgp4bGJofscd86PrGW+kAAG/mFgzMI2F1hiMubtu5dVS5PCTjtZKV5RM1SXwAoNb02dwimUSYipqkRkX24/CueeskgU3Lku7IwCc20zMRBBw+vFI=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16908ba5-2fb9-4f96-dee5-08d6df355bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 04:15:58.3484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4690
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Hi Christoph,

Thank you for your review!

> From: Christoph Hellwig, Sent: Wednesday, May 22, 2019 9:29 PM
> 
> On Wed, May 22, 2019 at 07:18:39PM +0900, Yoshihiro Shimoda wrote:
> > In IOMMU environment, since it's possible to merge scatter gather
> > buffers of memory requests to one iova, this patch changes the max_segs
> > value when init_card of mmc_host timing to improve the transfer
> > performance on renesas_sdhi_internal_dmac.
> 
> Well, you can't merge everything with an IOMMU.  For one not every
> IOMMU can merge multiple scatterlist segments,

I didn't know such IOMMU exists. But, since R-Car Gen3 IOMMU device
(handled by ipmmu-vmsa.c) can merge multiple scatterlist segments,
should this mmc driver check whether the IOMMU device is used or not somehow?

> second even it can merge
> segements the segments need to be aligned to the IOMMU page size.

If this driver checks whether the segments are aligned to the IOMMU
page size before DMA API is called every time, is it acceptable?
If one of the segments is not aligned, this driver should not use
the DMAC.

>  And
> then of course we might have an upper limit on the total mapping.

IIUC, if such a case, DMA API will fail. What do you think?

> > +	if (host->pdata->max_segs < SDHI_MAX_SEGS_IN_IOMMU &&
> > +	    host->pdev->dev.iommu_group &&
> > +	    (mmc_card_mmc(card) || mmc_card_sd(card)))
> > +		host->mmc->max_segs = SDHI_MAX_SEGS_IN_IOMMU;
> 
> This is way to magic.  We'll need a proper DMA layer API to expose
> this information, and preferably a block layer helper to increase
> max_segs instead of hacking that up in the driver.

I think I should have described the detail somewhere. This can expose
this information to a block layer by using blk_queue_max_segments()
that mmc_setup_queue() calls. In other words, this init_card() ops
is called before a block device is created. Is this acceptable if
such a comment is described here?

Best regards,
Yoshihiro Shimoda

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
