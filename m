Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id F334347A23
	for <lists.iommu@lfdr.de>; Mon, 17 Jun 2019 08:38:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 44A21C74;
	Mon, 17 Jun 2019 06:38:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5EA242F
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:38:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410111.outbound.protection.outlook.com [40.107.141.111])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D36C47DB
	for <iommu@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 06:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qe9aRn3yBpcWJlbeRMRLrXHov5SdIXtGL0ukBlvK0tU=;
	b=SF5NN9EaO04JezK1kdaJePSU25+YFOntdxT44i6G4jOdFYm18isHcfsLe3GJDZIYt7V8fme40J5Dooqay490U6EfTyHuQu3MmzXX/MIwy3RQxi4qY/ws6Ajx/0dfiXO6jQmULXt5awoWLkgYts3YZ29YHomoiKWUNhW3HxZr07s=
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com (20.178.97.80) by
	OSBPR01MB2485.jpnprd01.prod.outlook.com (52.134.255.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.13; Mon, 17 Jun 2019 06:38:13 +0000
Received: from OSBPR01MB3590.jpnprd01.prod.outlook.com
	([fe80::b1c2:125c:440d:e240]) by
	OSBPR01MB3590.jpnprd01.prod.outlook.com
	([fe80::b1c2:125c:440d:e240%4]) with mapi id 15.20.1987.014;
	Mon, 17 Jun 2019 06:38:13 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: RE: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Thread-Topic: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU can
	merge the segments
Thread-Index: AQHVIdGmGPEUTZUzykuLpLo4YRSl9aaaAScAgAVpc1A=
Date: Mon, 17 Jun 2019 06:38:13 +0000
Message-ID: <OSBPR01MB35904746C1E9CEF1C404ED9FD8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190613195839.GE6863@kunai>
In-Reply-To: <20190613195839.GE6863@kunai>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dfa52670-0d35-42e2-afe4-08d6f2ee5f8a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:OSBPR01MB2485; 
x-ms-traffictypediagnostic: OSBPR01MB2485:
x-microsoft-antispam-prvs: <OSBPR01MB2485AA922F2530488FF5A42CD8EB0@OSBPR01MB2485.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(366004)(136003)(346002)(396003)(189003)(199004)(8936002)(68736007)(256004)(476003)(486006)(9686003)(99286004)(6506007)(186003)(7696005)(76176011)(316002)(102836004)(52536014)(305945005)(26005)(7736002)(4744005)(2906002)(54906003)(446003)(478600001)(14454004)(5660300002)(86362001)(71190400001)(6246003)(25786009)(6916009)(53936002)(66066001)(11346002)(3846002)(6116002)(73956011)(55016002)(229853002)(64756008)(76116006)(7416002)(66476007)(66556008)(6436002)(74316002)(81166006)(81156014)(33656002)(66446008)(4326008)(8676002)(66946007)(71200400001)(135533001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2485;
	H:OSBPR01MB3590.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: renesas.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +3rLkP0GnbaxGZkyOqVpUrLpYVlmXJD9sWSb76hK0oR0A2OWv7Y9Qa/gHt+N+T3Rim12I5c2IKHDeJpCw5IZtQoVPPnYjbZJIx95L3WrxhipFYEM2R+u1GpoxF/1lXYSXlyKgW2fxLGSkZbuLe1OdKutcA7uypBPpKlDe2V5fDoqJg5Xuq80krkKwzga9Y8bWbPd0vMzFuiVqKK3SjQu7Kwrr4rbvYepzgtKRDM9ZHUs6IW5lNoMGhisOTXn+UNr+03MNY340lQTeXX0FyDWAx78Qo5NwjJEUBLl6mteBk3hJXkYc7A4HL1xq7yz9gj4N+mUPuzmv8NAC2lKL8+8GKSvxCoQ6ERCjutamUwmRLQ8boCsGv387qHd2j9nvQk7W810DlgOPihxsW3qMXrlY3NTMOKf8STkG8QgvGathZw=
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa52670-0d35-42e2-afe4-08d6f2ee5f8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 06:38:13.7427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoshihiro.shimoda.uh@renesas.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2485
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
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"hch@lst.de" <hch@lst.de>
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

Hi Wolfram-san,

> From: Wolfram Sang, Sent: Friday, June 14, 2019 4:59 AM
> 
> > -	blk_queue_max_segments(mq->queue, host->max_segs);
> > +	/* blk_queue_can_use_iommu_merging() should succeed if can_merge = 1 */
> > +	if (host->can_merge &&
> > +	    !blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)))
> > +		WARN_ON(1);
> > +	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));
> 
> Maybe we could use WARN here to save the comment and move the info to
> the printout?
> 
> -	blk_queue_max_segments(mq->queue, host->max_segs);
> +	if (host->can_merge)
> +		WARN(!blk_queue_can_use_iommu_merging(mq->queue, mmc_dev(host)),
> +		     "merging was advertised but not possible\n");
> +	blk_queue_max_segments(mq->queue, mmc_get_max_segments(host));

Thank you for the suggestion. It's a good idea! I'll fix the patch.

Best regards,
Yoshihiro Shimoda

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
