Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C7DE0EA9
	for <lists.iommu@lfdr.de>; Wed, 23 Oct 2019 01:49:03 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 34C79B65;
	Tue, 22 Oct 2019 23:48:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DFC20AD8
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 23:48:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 750B1822
	for <iommu@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 23:48:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
	hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
	id <B5daf956e0000>; Tue, 22 Oct 2019 16:49:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
	by hqpgpgate101.nvidia.com (PGP Universal service);
	Tue, 22 Oct 2019 16:48:56 -0700
X-PGP-Universal: processed;
	by hqpgpgate101.nvidia.com on Tue, 22 Oct 2019 16:48:56 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
	(172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Tue, 22 Oct 2019 23:48:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.36.57) by
	HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server
	(TLS) id
	15.0.1473.3 via Frontend Transport; Tue, 22 Oct 2019 23:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=P/i5kEYw48pPVIElu1zgU8gcROQIcLk3LE7zxUtoEtSIhDJ6M3FPOpPUDNiTZqm1Vi9VDDK9F4yv5ugZQMF7hr/BdW0zbLWSiucz/j5mgVB44GR26qjF1SlAySj0WYpjXYyNgZWa+jbjgSmDBz2zVUxvLLwoQLUYcoFLbc4J9zj6goNpbSddNCKnONohQk1eVHyAQWNCHpQ295nn2F0IIb7OPRrk0dhPVCcPj/nbOKWULpWng38rTxnXxXfN540N3PgpJcsGMifbyDq2cdKMksyjEhs2Gz0lfMjn5Pd6JvMW3jzp4m+TUrF/C7NWnmKaMnRvBfIZ0YYsVg3Leg17YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hh7MXofScYhBwjHA1E2Rr/9tALzMhSRaxjzSxLclQ4s=;
	b=QfNmE2k3QtO/sJbDMywj5mGgaPSHRpaVPXliRGae2bv72a+FDk1MRHD4mcWSs/0DYPmRqDJRSLcNb3dn1cFmeHthIvQEycEaCAbwgbdj5oyWcmrW0GkNx9G6UwOaiVEvxbB4UCzTqSAVvLDWprR4BtXsgR/rZeZ/T41RfwBjOPT5tN9Yx+TO34H033W32CoBNJSL2QOBVPz+Glj184prMHGKeGRPceGU4iFK+O/Xg6k+io6Ui2zuS2ZQ0UItHMKDwg6t846mV3vQwaCUrI2UojjGa5b/BROy3lEiY1IF2BskQwwwrhJHP1V0P0mMPzdDHjqd4D7qGqb8rqu3q2EHHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
	dkim=pass header.d=nvidia.com; arc=none
Received: from BYAPR12MB2710.namprd12.prod.outlook.com (20.177.124.11) by
	BYAPR12MB2856.namprd12.prod.outlook.com (20.179.93.29) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2347.28; Tue, 22 Oct 2019 23:48:55 +0000
Received: from BYAPR12MB2710.namprd12.prod.outlook.com
	([fe80::c0fa:c019:dd8e:dd40]) by
	BYAPR12MB2710.namprd12.prod.outlook.com
	([fe80::c0fa:c019:dd8e:dd40%6]) with mapi id 15.20.2347.029;
	Tue, 22 Oct 2019 23:48:55 +0000
From: Krishna Reddy <vdumpa@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>, "will@kernel.org" <will@kernel.org>
Subject: RE: [PATCH v3 0/7] Nvidia Arm SMMUv2 Implementation
Thread-Topic: [PATCH v3 0/7] Nvidia Arm SMMUv2 Implementation
Thread-Index: AQHVhgwr2/1seTuEaUyC0D9/Qf1q8adm9sOAgABg1jA=
Date: Tue, 22 Oct 2019 23:48:55 +0000
Message-ID: <BYAPR12MB2710879535971E290E8B25D3B3680@BYAPR12MB2710.namprd12.prod.outlook.com>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
	<6d9e6425-fa69-9b76-b477-1fe50c459ca5@arm.com>
In-Reply-To: <6d9e6425-fa69-9b76-b477-1fe50c459ca5@arm.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Enabled=True;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SiteId=43083d15-7273-40c1-b7db-39efd9ccc17a;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Owner=VDUMPA@nvidia.com;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_SetDate=2019-10-22T23:48:52.8304322Z;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Name=Unrestricted;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Application=Microsoft
	Azure Information Protection;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_ActionId=2963f581-b925-41a1-8109-ed18d39e57e8;
	MSIP_Label_6b558183-044c-4105-8d9c-cea02a2a3d86_Extended_MSFT_Method=Automatic
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=vdumpa@nvidia.com; 
x-originating-ip: [216.228.112.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1005c41b-ffcf-4272-7641-08d7574a667a
x-ms-traffictypediagnostic: BYAPR12MB2856:|BYAPR12MB2856:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB28563C77B9A8FAD795B84917B3680@BYAPR12MB2856.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01986AE76B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(366004)(376002)(39860400002)(346002)(396003)(136003)(189003)(199004)(76116006)(86362001)(25786009)(6246003)(6436002)(4744005)(229853002)(107886003)(55016002)(52536014)(4326008)(66066001)(64756008)(54906003)(66446008)(66556008)(66946007)(66476007)(33656002)(9686003)(11346002)(476003)(7696005)(8676002)(186003)(6506007)(71200400001)(74316002)(5660300002)(486006)(71190400001)(446003)(305945005)(81166006)(81156014)(102836004)(478600001)(26005)(256004)(8936002)(6116002)(2906002)(2501003)(3846002)(14454004)(316002)(7736002)(76176011)(99286004)(110136005);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB2856;
	H:BYAPR12MB2710.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nvidia.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3f6s9SPPqph/UZ7Lx2+MRvotk/0sckXSYrhNvMobFSAvMFKnzWqzv3Hjl93sqIPhC1k2mLTKgCs06TUzoiqk0bVf216/dYhGWz5BG6mEssHeIbcJ/lTyGHLyjm7x8jm+ABcyMmt7QFRPb1Aw3Jhf3ZYIKVhKvpkqgwXv8rN1EFWdyCxniqH4uD7Rfd8NxV0Ks6bjp6GVXKXedecjAAZOqt8NWAzjb94HExlIrCNMzq5gSBvh6yNAFXXiYiXv2hseNn/I6DA+3SV33zaUieXBdFFrygTHHgKJ6jj3hvcPYOtdzeCGJCQS/GcdG+/BaW586pekfsMPsc7xDQ6sxIbIFDyRU8LsxPrFiKiV64tXTdTCLKYJcksRygp37GzgMmy2A80tKVCCF2uR88KB1VpRK4S6kz2LxO4YUkZ8dvJ7Vrd4ggKmugvjste7BeEEf/ti
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1005c41b-ffcf-4272-7641-08d7574a667a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2019 23:48:55.3573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AdK44H9I2DwMtfaoWTLZ6nAKu7UhfyztEEBJYk7aGtI2Ny0uUudihfHiikgkabZEHwwvSohvf6T89t4UIO5m1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2856
X-OriginatorOrg: Nvidia.com
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1571788142; bh=hh7MXofScYhBwjHA1E2Rr/9tALzMhSRaxjzSxLclQ4s=;
	h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
	ARC-Authentication-Results:From:To:CC:Subject:Thread-Topic:
	Thread-Index:Date:Message-ID:References:In-Reply-To:
	Accept-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	authentication-results:x-originating-ip:x-ms-publictraffictype:
	x-ms-office365-filtering-correlation-id:x-ms-traffictypediagnostic:
	x-ms-exchange-transport-forked:x-microsoft-antispam-prvs:
	x-ms-oob-tlc-oobclassifiers:x-forefront-prvs:
	x-forefront-antispam-report:received-spf:
	x-ms-exchange-senderadcheck:x-microsoft-antispam:
	x-microsoft-antispam-message-info:MIME-Version:
	X-MS-Exchange-CrossTenant-Network-Message-Id:
	X-MS-Exchange-CrossTenant-originalarrivaltime:
	X-MS-Exchange-CrossTenant-fromentityheader:
	X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	X-MS-Exchange-CrossTenant-userprincipalname:
	X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg:
	Content-Language:Content-Type:Content-Transfer-Encoding;
	b=JuyFt6ousahItj4lJXzCbpeM1/og4cXzKIGryozbYvks1k2aWV9vxmpPO4RDjixzc
	TKgKfJ/+q/GxgdMr8Ln9+QBDBzwgSSuwPWh2ZNBsmep3VyMSJwYsvfMWxCPY7TkiPW
	hHl23rs5jd9hUgAY5q9X1A8bskIr29kAzvCfmgm2RGqHqALu4pAtW0wM5ENwm0pbg0
	613g2Jbx3WCpWwxjJHHkVhaJcD8O92lsfZuDp5Una/bwyxbjwrE2MWFPrcPVPjCajm
	COg+YGU/fHcmJ9TtyRD5FGotUwd8+D8rNuiB+UP/l68rjnfQIzpSzPeC/X+AxU6IMi
	ho6XcFoEqH3Bg==
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Sachin Nikam <Snikam@nvidia.com>, "thomasz@nvidia.com" <thomasz@nvidia.com>,
	Juha Tukkinen <jtukkinen@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Pritesh Raithatha <praithatha@nvidia.com>, Timo Alho <talho@nvidia.com>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Yu-Huan
	Hsu <YHsu@nvidia.com>, Thierry Reding <treding@nvidia.com>,
	Alexander Van Brunt <avanbrunt@nvidia.com>,
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

Hi Robin,
>>Apologies for crossed wires, but I had a series getting rid of arm_smmu_flush_ops which was also meant to end up making things a bit easier for you:

I was looking to rebase on top of your changes first.  Then I read Will's reply that said your work is queued for 5.5. 
Let me know if these patches need to rebased on top of iommu/devel or a different branch. I can resend the patch set on top of necessary branch.

-KR
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
