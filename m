Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA6984AC9
	for <lists.iommu@lfdr.de>; Wed,  7 Aug 2019 13:42:13 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 56722AD8;
	Wed,  7 Aug 2019 11:42:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6329E2F
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 11:42:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140074.outbound.protection.outlook.com [40.107.14.74])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 890237D2
	for <iommu@lists.linux-foundation.org>;
	Wed,  7 Aug 2019 11:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ZVr3jfMo76HyKmLduAUrKb8WFb6ymaUtSVWaW1IhKEtpy+EnHcFtfOwM3BEjFy3nmrloTq+dGyxZ3TxU+xix8ehL5gleoF6nfuJc7krGZNNbYw7kB7xSttsSej+ZppUJk5glVGhyHgLAiBzAdijUrdsFlwqH60QHJxaM4CT4xR1Ye8X4TYrngu74IXmCqpiK87picL0qIwdISMpM5OnWFAImnIeEcgKuboRP/zL4nMZYacgfg2RsSaYzlan20Dld9vTLp1WvxgvH4XHc8P/LWmWDhehP2ICeYZpW976YC7Jo6mbk8bvLnCFYT6p+/+urIY91h4uG6zzb4C0RS6sW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aL+citF68CAxs6Y8RXNOO5t8vu7g/fcgeL4uoy5a6ZE=;
	b=IszXDIPi99jN2PerFFVxuRT76q/+SWjdvGDhsl4K/S3g4elKx9DYWt6gGMCtFLMEnQ8Iz7qZ8vtbZ3MD0XRYOqrqsFPKujEd6/Km3buCJR3m17CcT6kllPwO/5QH/KsiZIcmmGa+7lTQuU5wThPvkLUrgvqJcBHB2pT09p6XDO+oOsXHKNumg1c8t3GerfoCIB0CVv8eHPVuTn+LXctEqALLCASxMDzY4LrYn4YNEQZG4FvyU/yuZ3UiyqAFVYA5IHq+R3SXyyGLIw2RUv/cQ20XTMf/pzuU3nMN7tYUWt1zIn5OtnvOio65y1lqXI7QVsWV1DPCMQATnUz50ltTpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=mellanox.com;dmarc=pass action=none
	header.from=mellanox.com;dkim=pass header.d=mellanox.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=aL+citF68CAxs6Y8RXNOO5t8vu7g/fcgeL4uoy5a6ZE=;
	b=mKYy+2iHsozehJuxnw2Y8sf/QMwxnQla+qM2hpFCgrK84l2hGEG7x8dV1TShUhZACyb8JgBO40qZOXA6fAM9GJTdhr8DWRuLBCmDYb0HkiDsVzSp2YBcLWOjz3N0B6FqRu1UDADmhKFMWLxeluH+jJrbtMgf0N0p3EZLy+M7doY=
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com (10.171.182.144) by
	VI1PR05MB4224.eurprd05.prod.outlook.com (52.133.12.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2136.14; Wed, 7 Aug 2019 11:42:05 +0000
Received: from VI1PR05MB4141.eurprd05.prod.outlook.com
	([fe80::5c6f:6120:45cd:2880]) by
	VI1PR05MB4141.eurprd05.prod.outlook.com
	([fe80::5c6f:6120:45cd:2880%4]) with mapi id 15.20.2136.018;
	Wed, 7 Aug 2019 11:42:05 +0000
From: Jason Gunthorpe <jgg@mellanox.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
Subject: Re: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Topic: [PATCH v3 hmm 10/11] drm/amdkfd: use mmu_notifier_put
Thread-Index: AQHVTKz0LjDSzhEB4EaA22+m0WS24abuyVUAgADHj4A=
Date: Wed, 7 Aug 2019 11:42:05 +0000
Message-ID: <20190807114159.GA1571@mellanox.com>
References: <20190806231548.25242-1-jgg@ziepe.ca>
	<20190806231548.25242-11-jgg@ziepe.ca>
	<d58a1a8f-f80c-edfe-4b57-6fde9c0ca180@amd.com>
In-Reply-To: <d58a1a8f-f80c-edfe-4b57-6fde9c0ca180@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YT1PR01CA0007.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::20)
	To VI1PR05MB4141.eurprd05.prod.outlook.com
	(2603:10a6:803:4d::16)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jgg@mellanox.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [156.34.55.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1087a58d-cdab-450f-eed7-08d71b2c4559
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:VI1PR05MB4224; 
x-ms-traffictypediagnostic: VI1PR05MB4224:
x-microsoft-antispam-prvs: <VI1PR05MB42240F0964A805F21C3C18CECFD40@VI1PR05MB4224.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01221E3973
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(39860400002)(346002)(376002)(396003)(366004)(136003)(199004)(189003)(186003)(446003)(478600001)(11346002)(7736002)(14444005)(316002)(6246003)(33656002)(2616005)(476003)(71200400001)(71190400001)(4326008)(8676002)(256004)(2906002)(486006)(386003)(8936002)(6916009)(7416002)(102836004)(6486002)(68736007)(99286004)(52116002)(305945005)(229853002)(26005)(54906003)(6506007)(53546011)(3846002)(6116002)(81156014)(6512007)(66556008)(14454004)(36756003)(66066001)(1076003)(53936002)(81166006)(66476007)(76176011)(25786009)(5660300002)(6436002)(64756008)(66446008)(86362001)(66946007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR05MB4224;
	H:VI1PR05MB4141.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: mellanox.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IgSPmRJlcx5V/wGT4V9R6qOKgkgatfYgsL3FNjghYwzUEfezLy17OMRBs0OLS1AEpzQMLrIeMb4FmHDcS6BVivZf99xzE08ks276NRr4Z2vz7zSyVNi/dibZowxwQPcXCs3/1DH7tyLjc53VdBy+Vq30x1L+pT/WopWnLZxOIFgTLShW/o/kN9FSSqckMwK5jVKt28X34Z/T/oRe3CXyYFgXq1u+kQP0vr4KorDAIXQQKQ43kmQvmDtY8xVzn4+77l54rLKVRcmWfLJ1JcwxDtXTq45K9fOY7cjlA6Qh5+nvCQkLYc4I/hMSr1oWxVwJluom/aQvzZaqYEk2rfws6uGHlc24pD74d8UvjGQEcF3pU5ZdQxmHs3AEQBpgJ/uDKBFDuAynhLq+kBCGkJK1whhSyI+3j+qC0V5XDgb3iNM=
Content-ID: <FEC4B53D5BFE794F897559B0282A7946@eurprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1087a58d-cdab-450f-eed7-08d71b2c4559
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2019 11:42:05.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgg@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4224
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Andrea Arcangeli <aarcange@redhat.com>, "Zhou,
	David\(ChunMing\)" <David1.Zhou@amd.com>,
	Ralph Campbell <rcampbell@nvidia.com>, Dimitri Sivanich <sivanich@sgi.com>,
	Gavin Shan <shangw@linux.vnet.ibm.com>,
	Andrea Righi <andrea@betterlinux.com>,
	"linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>,
	=?iso-8859-1?Q?J=E9r=F4me_Glisse?= <jglisse@redhat.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
	Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, Aug 06, 2019 at 11:47:44PM +0000, Kuehling, Felix wrote:
> On 2019-08-06 19:15, Jason Gunthorpe wrote:
> > From: Jason Gunthorpe <jgg@mellanox.com>
> >
> > The sequence of mmu_notifier_unregister_no_release(),
> > mmu_notifier_call_srcu() is identical to mmu_notifier_put() with the
> > free_notifier callback.
> >
> > As this is the last user of those APIs, converting it means we can drop
> > them.
> >
> > Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
> 
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
> 
> >   drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  3 ---
> >   drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++------
> >   2 files changed, 4 insertions(+), 9 deletions(-)
> >
> > I'm really not sure what this is doing, but it is very strange to have a
> > release with no other callback. It would be good if this would change to use
> > get as well.
> KFD uses the MMU notifier to detect process termination and free all the 
> resources associated with the process. This was first added for APUs 
> where the IOMMUv2 is set up to perform address translations using the 
> CPU page table for device memory access. That's where the association of 
> KFD process resources with the lifetime of the mm_struct comes from.

When all the HW objects that could do DMA to this process are
destroyed then the mmu notififer should be torn down. The module
should remain locked until the DMA objects are destroyed.

I'm still unclear why this is needed, the IOMMU for PASID already has
notififers, and already blocks access when the mm_struct goes away,
why add a second layer of tracking?

Jason
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
