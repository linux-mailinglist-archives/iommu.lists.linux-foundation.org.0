Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF4D47A2D
	for <lists.iommu@lfdr.de>; Mon, 17 Jun 2019 08:46:39 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4FC0EB4B;
	Mon, 17 Jun 2019 06:46:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8BF25A70
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from JPN01-TY1-obe.outbound.protection.outlook.com
	(mail-eopbgr1400098.outbound.protection.outlook.com [40.107.140.98])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9CB22C3
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lnGaHcQ8tF6UuYuj5w7KWm64uTDoc1O6aClv9W1hi9Q=;
	b=GYqkBD4aVWbK+xejBausvC/Mc8kVzAF4qUlgpHSA26b8N+wJlvQsYM44uM9NH7VWfhg7vhma4LgEMOl2THS+c0EdjtGa80qiDlnhp6k2XS/weLCng+/o4ui/2lDIWSrFsBWO/YJVS2vOwnKzlYhLHQkREMJdkMUiwd9Y5TlqmyY=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
	OSBPR01MB2134.jpnprd01.prod.outlook.com (52.134.243.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.13; Mon, 17 Jun 2019 06:46:33 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
	([fe80::b1c2:125c:440d:e240]) by
	OSBPR01MB3590.jpnprd01.prod.outlook.com
	([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014;
	Mon, 17 Jun 2019 06:46:33 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Christoph Hellwig <hch@lst.de>
Subject: RE: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Thread-Topic: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Thread-Index: AQHVIdGmGPEUTZUzykuLpLo4YRSl9aaawOiAgASqhHA=
Date: Mon, 17 Jun 2019 06:46:33 +0000
Message-ID: <OSBPR01MB3590FA5DB10D9EF34F551335D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190614072459.GD8420@lst.de>
In-Reply-To: <20190614072459.GD8420@lst.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d47081f2-7209-40ba-7da7-08d6f2ef8964
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:OSBPR01MB2134; 
x-ms-traffictypediagnostic: OSBPR01MB2134:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <OSBPR01MB2134169C01374FE8B4254064D8EB0@OSBPR01MB2134.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(39860400002)(366004)(346002)(376002)(396003)(199004)(189003)(256004)(478600001)(26005)(6506007)(14444005)(64756008)(66446008)(76176011)(316002)(476003)(68736007)(486006)(11346002)(446003)(8936002)(81156014)(81166006)(6246003)(86362001)(102836004)(8676002)(33656002)(25786009)(966005)(55016002)(3846002)(53936002)(9686003)(73956011)(6116002)(7696005)(76116006)(99286004)(66556008)(66476007)(186003)(66946007)(14454004)(6306002)(5660300002)(74316002)(66066001)(2906002)(305945005)(7736002)(54906003)(6916009)(71200400001)(71190400001)(4326008)(6436002)(52536014)(229853002)(135533001)(6606295002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2134;
	H:OSBPR01MB3590.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: c15Jyn8qa+4ao8lDgmdZI5SSSsMwndeZ547K41xVtpgllyx1bKcmMES/jXtvx1ak6OH8gY7y09bvczaXvGzS9h3df+/fyxWdv8NXCVD//Ulz5NZ6POKh/oO2Fv/5QnT+x4+2Jc+dYtODFS3vk46C6WffyZLbN3MVXs+vLhgF1I1UG+U5vq0rzd9gbzBEgf7TbLYoA6T0pfL4dX3/UEe0ETV/qfq1rezX9ZOz6J+Nmf0cTm4T1LscHEofjX1/jQMffKIuQJij+1W5axp4p8U5G0VCrkImGzN9/hDQGpaw5atI/ExPZiTlpoJSwJNI4D9eyesDohDVjOffjk6McxwvExFNnjQFghBSE/4qN34XQjViTczvi+CkXvGTgtcs0ej05Hd8oAIWNYHRiNIGYL37ii6pk6MLN1NM5K8DPBJSyvk=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d47081f2-7209-40ba-7da7-08d6f2ef8964
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:46:33.3574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2134
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
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

> From: Christoph Hellwig, Sent: Friday, June 14, 2019 4:25 PM
> 
> On Thu, Jun 13, 2019 at 07:20:15PM +0900, Yoshihiro Shimoda wrote:
> > +static unsigned int mmc_get_max_segments(struct mmc_host *host)
> > +{
> > +	return host->can_merge ? BLK_MAX_SEGMENTS : host->max_segs;
> > +}
> 
> Note that BLK_MAX_SEGMENTS is really a little misnamed, it just
> is a BLK_DEFAULT_SEGMENTS.  I think you are better of picking your
> own value here (even if 128 ends up ok) than reusing this somewhat
> confusing constant.

Thank you for your comments. I got it. I'll fix this.

> > +	/*
> > +	 * Since blk_mq_alloc_tag_set() calls .init_request() of mmc_mq_ops,
> > +	 * the host->can_merge should be set before to get max_segs from
> > +	 * mmc_get_max_segments().
> > +	 */
> > +	if (host->max_segs < BLK_MAX_SEGMENTS &&
> > +	    device_iommu_mapped(mmc_dev(host)))
> > +		host->can_merge = 1;
> > +	else
> > +		host->can_merge = 0;
> > +
> 
> can_merge seems a little too generic a name to me.  Maybe can_iommu_merge?

I'll fix the name. Also, only the device_iommu_mapped() condition wiil cause
a problem on iommu=pt [1]. So, I'll add another condition here.

[1]
https://marc.info/?l=linux-mmc&m=156050608709643&w=2

Best regards,
Yoshihiro Shimoda

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
