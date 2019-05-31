Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E921630E8C
	for <lists.iommu@lfdr.de>; Fri, 31 May 2019 15:10:17 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E887C1185;
	Fri, 31 May 2019 13:10:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BFBD1170
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:09:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30053.outbound.protection.outlook.com [40.107.3.53])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B24B05F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 31 May 2019 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=thIHFzZq6Yb7o0fGxI4pwYvE39AiI5eu80a85wEuJ1M=;
	b=piBRNDz/eG+pR7bxfuC6i1wl8ga2ktUmDf4jTvetzep3//wcRekFdj/IKE5xVPUlWWOtzUoxJCr+wuB6WhPjFWQbeAqgmJSfghpkdyyWyYNXHNGZFFuV/o2TMFm6mxBi9DZKQltnEX6YKC8Au9LONQO72h8BLhdgZTRbVFXKoDc=
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com (20.177.50.159) by
	VI1PR04MB5583.eurprd04.prod.outlook.com (20.178.123.33) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1943.17; Fri, 31 May 2019 13:09:25 +0000
Received: from VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::8d0e:de86:9b49:b40]) by VI1PR04MB5134.eurprd04.prod.outlook.com
	([fe80::8d0e:de86:9b49:b40%7]) with mapi id 15.20.1922.024;
	Fri, 31 May 2019 13:09:25 +0000
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
To: David Miller <davem@davemloft.net>
Subject: RE: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Thread-Topic: [PATCH v3 0/6] Prerequisites for NXP LS104xA SMMU enablement
Thread-Index: AQHVFvLAUsVmmx2jaE2ZHLZY1pGN66aEOpgAgAD6PbA=
Date: Fri, 31 May 2019 13:09:25 +0000
Message-ID: <VI1PR04MB5134C8FF07C4BED216DE12DCEC190@VI1PR04MB5134.eurprd04.prod.outlook.com>
References: <20190530141951.6704-1-laurentiu.tudor@nxp.com>
	<20190530.150844.1826796344374758568.davem@davemloft.net>
In-Reply-To: <20190530.150844.1826796344374758568.davem@davemloft.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=laurentiu.tudor@nxp.com; 
x-originating-ip: [192.88.166.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3b320303-6336-4846-e41c-08d6e5c934cc
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VI1PR04MB5583; 
x-ms-traffictypediagnostic: VI1PR04MB5583:
x-ms-exchange-purlcount: 1
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VI1PR04MB5583705E1A156E9DF61DFD80EC190@VI1PR04MB5583.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1443;
x-forefront-prvs: 00540983E2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(366004)(376002)(39860400002)(346002)(396003)(189003)(199004)(13464003)(26005)(66946007)(64756008)(6916009)(73956011)(11346002)(3846002)(99286004)(33656002)(6116002)(4744005)(66556008)(76176011)(66446008)(66476007)(186003)(55016002)(44832011)(966005)(7696005)(476003)(14454004)(446003)(486006)(478600001)(6246003)(2906002)(229853002)(4326008)(6436002)(25786009)(14444005)(74316002)(9686003)(68736007)(6306002)(76116006)(52536014)(66066001)(305945005)(71190400001)(71200400001)(53936002)(54906003)(6506007)(256004)(5660300002)(7736002)(8936002)(102836004)(81156014)(86362001)(81166006)(316002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5583;
	H:VI1PR04MB5134.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gnqMazF+nzQTNQhmoGkYY7imzrTpo5wzUZ0kcmM93IUJDEfrqOQ15Bn2XqpCjTa3uflPhM7mwZTLTJgCnOUMXfqxueSQmCHsmwuAwaYHLFQxyZeA6CAuWSXcyDGmQxgMgurtAAz281eZP7q6owXMEUUFykgBzo6nbx9XLMwdU7nTQqRDIV2Fv5osOT8lAg8ICwAL949f8xK40AVKOr6S1UYlcAdys2155+H3eB4fm0RARCGp+1BPqG0DAysREEtvLq053Y2HP+E+fycMKUfnmo9NG07i3yb3lspMDUUOngq7ufnseDXmT8SuNLpk/KpW+IN7lsj8hZ9EgjOrbqtoY6JpLj4gg4Dz+KhCE1/Dq0pUwajK3hUW1m72SLQA0D0ML6OAEf2x2E88mvqknaf9qppWSBg3/as88O4VfPz4pds=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b320303-6336-4846-e41c-08d6e5c934cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2019 13:09:25.4735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: laurentiu.tudor@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5583
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Madalin-cristian Bucur <madalin.bucur@nxp.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	Roy Pledge <roy.pledge@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Leo Li <leoyang.li@nxp.com>,
	"jocke@infinera.com" <joakim.tjernlund@infinera.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Camelia Alexandra Groza <camelia.groza@nxp.com>,
	"u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
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

Hello,

> -----Original Message-----
> From: David Miller <davem@davemloft.net>
> Sent: Friday, May 31, 2019 1:09 AM
> 
> From: laurentiu.tudor@nxp.com
> Date: Thu, 30 May 2019 17:19:45 +0300
> 
> > Depends on this pull request:
> >
> >
> http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/653554.html
> 
> I'm not sure how you want me to handle this.

Dave, would it make sense / be possible to also pick Leo's PR through your tree?

---
Thanks & Best Regards, Laurentiu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
