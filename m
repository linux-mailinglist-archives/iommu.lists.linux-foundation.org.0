Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE6F28375
	for <lists.iommu@lfdr.de>; Thu, 23 May 2019 18:26:02 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id DC60FF2C;
	Thu, 23 May 2019 16:26:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CB4E4F25
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 16:25:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 5161B7FB
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 16:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rC3WukTp6GQRTN3i3fDk7GQCWKEVopJ8WI0YSxAfth4=;
	b=D3a9zrjegIqrQTJzkpHvQzaZqWbEviBa79pI9bNf44yZFxsAl3MEoS8bd+mo/kAGHDaihqWGRbpE9XZg5W3FqaH98n2748ebyhasb93AnYeTpEG2TWGLfYYKMZz/tnx0KccwT36JNasapxRNY9rLndQeGH+Eq67qA3sLihzloZs=
Received: from AM0PR0402MB3476.eurprd04.prod.outlook.com (52.133.50.141) by
	AM0PR0402MB3378.eurprd04.prod.outlook.com (52.133.51.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.16; Thu, 23 May 2019 16:25:54 +0000
Received: from AM0PR0402MB3476.eurprd04.prod.outlook.com
	([fe80::1cc6:b168:7419:aa48]) by
	AM0PR0402MB3476.eurprd04.prod.outlook.com
	([fe80::1cc6:b168:7419:aa48%6]) with mapi id 15.20.1900.020;
	Thu, 23 May 2019 16:25:54 +0000
From: Horia Geanta <horia.geanta@nxp.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy
	<robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
Thread-Topic: [PATCH] swiotlb: sync buffer when mapping FROM_DEVICE
Thread-Index: AQHVEG7XwyI2zYKLCECD0q7/YpNC2Q==
Date: Thu, 23 May 2019 16:25:54 +0000
Message-ID: <AM0PR0402MB3476949ECC57B188E83B820B98010@AM0PR0402MB3476.eurprd04.prod.outlook.com>
References: <20190522072018.10660-1-horia.geanta@nxp.com>
	<20190522123243.GA26390@lst.de>
	<6cbe5470-16a6-17e9-337d-6ba18b16b6e8@arm.com>
	<20190522130921.GA26874@lst.de>
	<fdfd7318-7999-1fe6-01b6-ae1fb7ba8c30@arm.com>
	<20190522133400.GA27229@lst.de>
	<CGME20190522135556epcas2p34e0c14f2565abfdccc7035463f60a71b@epcas2p3.samsung.com>
	<ed26de5e-aee4-4e19-095c-cc551012d475@arm.com>
	<0c79721a-11cb-c945-5626-3d43cc299fe6@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=horia.geanta@nxp.com; 
x-originating-ip: [94.69.234.123]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a0a4b2c-4721-4767-1917-08d6df9b5418
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:AM0PR0402MB3378; 
x-ms-traffictypediagnostic: AM0PR0402MB3378:
x-microsoft-antispam-prvs: <AM0PR0402MB3378372015446189DB61792698010@AM0PR0402MB3378.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(376002)(396003)(366004)(346002)(39860400002)(189003)(199004)(7696005)(55016002)(7736002)(476003)(446003)(256004)(6246003)(14444005)(110136005)(305945005)(6436002)(66476007)(44832011)(74316002)(66556008)(66946007)(102836004)(9686003)(66446008)(64756008)(486006)(478600001)(76176011)(99286004)(76116006)(186003)(53546011)(73956011)(26005)(229853002)(6506007)(86362001)(52536014)(2906002)(316002)(14454004)(68736007)(5660300002)(33656002)(6116002)(3846002)(81156014)(53936002)(25786009)(71200400001)(71190400001)(81166006)(4326008)(8676002)(66066001)(8936002)(54906003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR0402MB3378;
	H:AM0PR0402MB3476.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5A+F7k/6MmBhZ/DrxB1emjAW2UixQDrufCThlicP6eKZuxNkZ6DY+nh/7IASyXln4OP3TSlXd5MHUHb+FxSSyopgVDyGyXsTG/AEd+DXBTbX1QpKkSH5aqZMR7pa50qYp0otfoG1HIE2a/7bfm+oTKw7N4KydzM/7C1DOFbdjbFqFEsD87EVJ4BR+rzwXYLVI45r7RpjRkg/GSFcuexfmoUN3Ocqw5W//by2YKP1tD5pW97B5Y5zqUcyCpmOEngdQxGb2w5jb34PrRUfoUTiTrcqMZ8wZoJP63TpLQV64lcouqdDip3hBDRe0O8m5McmF/e07/sLJL69RnLoo2MsSsxANxVkmZrNqjuGOnpVORhEAD3BWpKMO2JujEQ3TuDyCv2D78o/LOYZjnTrVWv/M27keqJ3o2xbPFw6uBrZQiA=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a0a4b2c-4721-4767-1917-08d6df9b5418
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 16:25:54.2364 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3378
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: dl-linux-imx <linux-imx@nxp.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 5/23/2019 8:35 AM, Marek Szyprowski wrote:
> Hi Robin,
> =

> On 2019-05-22 15:55, Robin Murphy wrote:
>> On 22/05/2019 14:34, Christoph Hellwig wrote:
>>> On Wed, May 22, 2019 at 02:25:38PM +0100, Robin Murphy wrote:
>>>> Sure, but that should be irrelevant since the effective problem here =

>>>> is in
>>>> the sync_*_for_cpu direction, and it's the unmap which nobbles the =

>>>> buffer.
>>>> If the driver does this:
>>>>
>>>> =A0=A0=A0=A0dma_map_single(whole buffer);
>>>> =A0=A0=A0=A0<device writes to part of buffer>
>>>> =A0=A0=A0=A0dma_unmap_single(whole buffer);
>>>> =A0=A0=A0=A0<contents of rest of buffer now undefined>
>>>>
>>>> then it could instead do this and be happy:
>>>>
>>>> =A0=A0=A0=A0dma_map_single(whole buffer, SKIP_CPU_SYNC);
>>>> =A0=A0=A0=A0<device writes to part of buffer>
>>>> =A0=A0=A0=A0dma_sync_single_for_cpu(updated part of buffer);
>>>> =A0=A0=A0=A0dma_unmap_single(whole buffer, SKIP_CPU_SYNC);
>>>> =A0=A0=A0=A0<contents of rest of buffer still valid>
>>>
>>> Assuming the driver knows how much was actually DMAed this would
>>> solve the issue.=A0 Horia, does this work for you?
In my particular case, input is provided as a scatterlist, out of which fir=
st N
bytes are problematic (not written to by device and corrupted when swiotlb
bouncing is needed), while remaining bytes (Total - N) are updated by the d=
evice.

>>
>> Ohhh, and now I've just twigged what you were suggesting - your =

>> DMA_ATTR_PARTIAL flag would mean "treat this as a read-modify-write of =

>> the buffer because we *don't* know exactly which parts the device may =

>> write to". So indeed if we did go down that route we wouldn't need any =

>> of the sync stuff I was worrying about (but I might suggest naming it =

>> DMA_ATTR_UPDATE instead). Apologies for being slow :)
> =

> Don't we have DMA_BIDIRECTIONAL for such case? Maybe we should update =

> documentation a bit to point that DMA_FROM_DEVICE expects the whole =

> buffer to be filled by the device?
> =

Or, put more bluntly, driver must not rely on previous data in the area map=
ped
DMA_FROM_DEVICE. This limitation stems from the buffer bouncing mechanism o=
f the
swiotlb DMA API backend, which other backends might not suffer from (e.g. I=
OMMU).

Btw, the device I am working on (caam crypto engine) is deployed in several=
 SoCs
configured differently - with or without an IOMMU (and coherent or non-cohe=
rent
etc.). IOW it's a "power user" of the DMA API and I appreciate all the help=
 in
solving / clarifying this kind of implicit assumptions.

Thanks,
Horia
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
