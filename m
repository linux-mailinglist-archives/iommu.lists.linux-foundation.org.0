Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6494721F6
	for <lists.iommu@lfdr.de>; Mon, 13 Dec 2021 08:51:02 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A13960F00;
	Mon, 13 Dec 2021 07:51:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5C5bvqudW1Cl; Mon, 13 Dec 2021 07:51:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 32BD060EFA;
	Mon, 13 Dec 2021 07:51:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7CE4BC0030;
	Mon, 13 Dec 2021 07:50:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0A515C0012
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 07:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E271240162
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 07:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com header.b="mb0Z03R+";
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
 header.b="IRie9jBJ"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XongRZ7pJUje for <iommu@lists.linux-foundation.org>;
 Mon, 13 Dec 2021 07:50:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 836C540002
 for <iommu@lists.linux-foundation.org>; Mon, 13 Dec 2021 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639381856; x=1670917856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2/fx1I/4eS5vFDqu8+y3sFLxh5jd+HN3Yo2Ix0wVTkw=;
 b=mb0Z03R+3lDfnsg52m57eKfQm4wEoCEOYArwMWcYFATQ1k8zyKhYZmad
 /zDH9p/7ZDW0U/Mb90j84NMvvbG/O6qU5ix6HYDk8riQmBU9fUIpttP1x
 dmHvhHYJmDZR8KtghVzd/iLE5dsxHq93aIsIYpiw3j8g00dXFK6oqg5d/
 P2LiSBDMJqyx0eKBWllMfAUyyPWR8IGSnjBs2p8BmFfX4oJOhrRcGRWE3
 dnPl7SRQxNWYWP01s6QPq5yAyQf91yJ2k8XrQDKZ4tTlxycln372ctgTw
 mBkAiG8Qz324k94EV8zRx45ImLubsxwmBZ6WXoIXkJ5sPCCKWfCO8uVp7 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="299463687"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="299463687"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 23:50:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; d="scan'208";a="463291419"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP; 12 Dec 2021 23:50:55 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sun, 12 Dec 2021 23:50:54 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Sun, 12 Dec 2021 23:50:54 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Sun, 12 Dec 2021 23:50:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNJq41pYFHNm8gn6V6Lnz6pwOv+ZDyS+QHlIX4Is/ip9j56IvpyWGN0fQfFIzpSZJ0RZopFzjXvlRtXwAHvnPZckvRzFRn3EniNXfFPemzCeiacTIEsBPU3Jm3NF25AWZNyhXfuTDkXEI21ulF2dXmCG0tanolbveWc63ZTJsS+q1ilokDmA2EzACGBiZDmgC5iNOBvfIcR4kzw9cfOuptRYaxmdkaYBT6S3xbi6nHHlBACYp0nfp7ZNw1Cv09MFCy5ALCy1zFGDcl5Ii+mnkTwZvQz1sW6oqFXZhVsCIDdo8IVSJCwhu7xzReV5CvLbmuSlXL5aKMEW7to0MWDY/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S+8Uf+TNLzvPMkktbvIrwHNDm97CWPgm/lo1RxGeULI=;
 b=WVJavp9V0GclhtGCBNToht3srRejOMm29SY7+SZ7UbHCfpdPK/x35FGO4XVUbyB0dsKzC/KzDYbhxctqPxAsWkPPG8mxaPLrKN1LNZNuvPB+BvDHcq0ZAhWi/Jpz7XsGQfHfVK1aUOSri/On2q9GyRlBXMWb1+TQs+Ta74Xu0+nwLkJ25xWx0loRgzRbgwplxqhz0dgb+DK+kCk+Hvj3xmFQENP8QnC1DfN/b+PR11jBNxaxdgLBo6hwiaJhElTbRIxb/xps46rNcCmhDZ52JUPhD6vtyTJRpym/c0qwWK4TwsYg18xRtOmKhesz76sFzhvvBQZzGwOGEAcSz0vFyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S+8Uf+TNLzvPMkktbvIrwHNDm97CWPgm/lo1RxGeULI=;
 b=IRie9jBJj0XVGMnid/huwThVRQ1ZcGPB3Z5cFPV/Ac5JP4rccT7PEImQPhxolhTSEsZRcCnotVCJ+OrDiXJwiMP1koLk57RozKTKgzY34tfMxrrLraQOAomCquL1j1BSXSnYF1TY70XrI4DzxydlEc1Tqo1BgmiXrz1FajVlHeM=
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5484.namprd11.prod.outlook.com (2603:10b6:408:105::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 07:50:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::5c8a:9266:d416:3e04%3]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 07:50:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Topic: [patch 21/32] NTB/msi: Convert to msi_on_each_desc()
Thread-Index: AQHX4y1VNaiO68omHEet2J9DWrVARKwa1YEAgAAp0QCAABreAIAAIi2AgAE8MoCAAAd1gIAACyoAgAAPcQCAADDDAIAAp1uAgABn9QCAACTxgIAAAdGAgAAbd4CAAA94gIAABpSAgAt9SoCAADlJAIAAgb+AgABGMACAAAc8gIAAE+oAgAAmHACAAFJ4oIAAem8AgABqWwCAANPscIAAWxoAgADV7aCAAT/pAIAALSqAgAB3WTA=
Date: Mon, 13 Dec 2021 07:50:50 +0000
Message-ID: <BN9PR11MB52766327C636245CFA8C9E248C749@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20211209205835.GZ6385@nvidia.com> <8735n1zaz3.ffs@tglx>
 <87sfv1xq3b.ffs@tglx>
 <BN9PR11MB527619B099061B3814EB40408C719@BN9PR11MB5276.namprd11.prod.outlook.com>
 <20211210123938.GF6385@nvidia.com> <87fsr0xp31.ffs@tglx>
 <BN9PR11MB527625E8A9BB854F3C0D19AE8C729@BN9PR11MB5276.namprd11.prod.outlook.com>
 <875yrvwavf.ffs@tglx>
 <BL1PR11MB5271326D39DAB692F07587768C739@BL1PR11MB5271.namprd11.prod.outlook.com>
 <87fsqxv8zf.ffs@tglx> <20211212233711.GN6385@nvidia.com>
In-Reply-To: <20211212233711.GN6385@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38055116-a1cc-4666-331b-08d9be0d4842
x-ms-traffictypediagnostic: BN9PR11MB5484:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <BN9PR11MB548463C37E8A6206F72919508C749@BN9PR11MB5484.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0wX6LKRwcZyilLoBb/TQRdKNMQTD44HDJig2G6od77X6o1FewoaFYeKrUhVtp3HpW7dCI7hcrWCXPHeAbXhmjyH8g6y/7SpgcC90dNYUO9Lpneuz7ivEbxxQvsmWE9/8h8MuHPixD2EGEcGtd6YvQKWInoUScNJxlISjOy/PNj/kM6ieL2q5JWKQbltW7aPCKDXiyl3338jfmrXySw5ObbLRkUJ6YZquTfdv0069VQfUrAoJ9gUP5vBYXjWDQ0Jc5js/o3mPh2ATJX4l/yYB9o77RNh3upkQumxRFAKGZSEgc2+OZICS3jxs6MTog3mBmQOuSNV5V2sMjOal7e2Cvoxa53cy9EGy0b7vqEC8zbIMgjiLuwv263P/4fLue2PyrRD9qWFQDnm2vfg150sCxes0/fWw55gf0GeJZ0uc81B8Dfue4plWr8od+tzwVCThIhIJSmycrEHUdlBFvW+XayO7edFLkMHBFHsbWZuEyb63bzjyMWb56ps38D+xLa+9xEJbdP97NkVCXrWTZdjpMCcrGDrE6vsHy0PChUZYhdqCrifqGKRT/C7f/1F45kNsQL1nVrmx/q+tVb2zjg3CkWwQttaSyXBjnMHtNeUaQB7ZXLbEqtQq4CA4dQiz4oPoKyO+9WeRI627J03yzOsgQQeMD3yf7MoHQgOtdft48pUWVAGS2MUEgs78TCEAwBjBQTKPK95GX6wTGQDpOZ8FYQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66446008)(122000001)(66556008)(26005)(186003)(71200400001)(6506007)(4326008)(9686003)(38100700002)(82960400001)(2906002)(64756008)(66946007)(7416002)(76116006)(66476007)(52536014)(83380400001)(55016003)(508600001)(5660300002)(33656002)(54906003)(38070700005)(8676002)(110136005)(7696005)(8936002)(86362001)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EOXzUo4rWNa/aJ4Nk2YKW8Lca6Rol3XbOXHEGce/jeOU8s/4Om0VqHOjDoJM?=
 =?us-ascii?Q?5m2kp1zXB34bdLv+KUqGvVJGKK6T9HGU8CN68p2byr4ajEiJv5E0+licqRm5?=
 =?us-ascii?Q?FyK9KM8pXDyTWuIIDP7XySwiPCe7N//qXicrV4/tYQMDnroxKLOVCgAYAZgr?=
 =?us-ascii?Q?mi1DYw7t4gg5FJvheRjnPiAluMDSXUMqyABbucgi9Z/8X+2PgxR76cFOWFsq?=
 =?us-ascii?Q?0TZlUK8JgCyezYVvljMLeJiCF3N28nHaisDqox4zxdMLQihqROOB6j9KD0TC?=
 =?us-ascii?Q?qvNJbsTpE/WFjggzx2EARvHovdCDaqZmZZaUYBudS3cyFcuBOeYgNBN73g8Z?=
 =?us-ascii?Q?scQUEQneEXxTfnz3hUuArl24dqW7RTxyF55NpabfyXXFiIOf8dqdjkrvHdex?=
 =?us-ascii?Q?ykNYpXZVSwYfBT2Fm9FHoZ/2SX7tUyPUxFPr3t1KwLw6vdUX7yxwnqHaat2r?=
 =?us-ascii?Q?CDX74dSgCNifFshC/eq75VcNhH4kcJO5RPfBk1tMn84N6M8l4NZ/PA4gmOkd?=
 =?us-ascii?Q?zs/Td/40M6A0OcxODYxqt+6iayBIneY3TtDtw0OORNFmcvx8Ougg+Xo/Bbd2?=
 =?us-ascii?Q?9jd8lQvZtwmAA57qM0kAKnhSGeja49v5QD34w+00BhqExfiX/Tl8nKPjPBmJ?=
 =?us-ascii?Q?icCVMuFeEQMTLRVF3uhA73DHshR311+TJMJ0n+GP8yr7ODpc4MUcJQlduTKO?=
 =?us-ascii?Q?ozqAKne/jp/1SMRGtJTjJ2Y7y1z4qfZe88RkUoMsW+ZgFLMpSlwwkL+u+mNE?=
 =?us-ascii?Q?cVF19WtEjS9d4cbkRRXtukh0K/AdAZsI7acD7GH2iJRWYcL62A7UMdjIlQyB?=
 =?us-ascii?Q?5G1E7933565LnQI165bWU/+eK3Ht7f8DiIa3nF8kh3sFZj+vwk6CzS2QJx9W?=
 =?us-ascii?Q?JaSx7gUqImzaJKUL/pWgmS3j8VVVeP9cnoonpEL3qKcOwW+GuCSzddOU80IJ?=
 =?us-ascii?Q?mixbzASa/BZfb0R5MBI9b7UNV8syj1YePU3RqiHXvlYDphfcgl1YNyu2dmLv?=
 =?us-ascii?Q?cN3aEqwf7xxmS0UuCKgey51Xo7ikTNIFQpXBy/KPwp96ziU58Si0/DnIJJ0K?=
 =?us-ascii?Q?RsmCN2ZXzOAixgYg3Wm8MokuarhVVUV2wI0Fs/W0RO03cQCcafhphExf+yxP?=
 =?us-ascii?Q?EndUPbP8PIrHCSEzRxJqngJEd1zX1GrEYyZRBXC1d3jVN6CQATVpXCPBYcnT?=
 =?us-ascii?Q?BdZa86uLXd+BCSxCkyPLrF9WThGg6jUyhmakQIgZkHXoZtE+GoUJrrvKpEc/?=
 =?us-ascii?Q?e2UvJPf3vy0Ma0f99pAvesgr0GZdJnik8UJuwGdgIKJU9mlIAxInMG5N4XIf?=
 =?us-ascii?Q?lQTmSTxWdvkFr3lxN4XWECI18GaHl6tCTULA7f++H5vckhxsyUGkH8Xcv1s+?=
 =?us-ascii?Q?MNe9+q/p1prTAJW3OgWIzEXgFE40FusDhBmybmhtRDN65SCiplPewHPjmzE2?=
 =?us-ascii?Q?KrJkPZy2bVWp2OO+GLFp2XL0HYpQ1DxHzesc/kXG0pseJ3Ye0A1a7l5R72/z?=
 =?us-ascii?Q?4gD8ncYsLotjG6KYvLZgQeTYJqV0t6U9/gvvwv4X1/N40fWvhyQHTpDlP43W?=
 =?us-ascii?Q?70WKotFvL/Vg0J0NHVma608/PUW7orp50W+Tn9OkolQGLpG6VWFYoua85BL1?=
 =?us-ascii?Q?Rg=3D=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38055116-a1cc-4666-331b-08d9be0d4842
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2021 07:50:50.4850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UWim5/Z3zvyMbpHgDE3GO+r8dD7HueWdHs2cKIM3sGPpOL/NxR2PJOPIJLKh7nBql0fQREItkL15ZKyBERrW6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5484
X-OriginatorOrg: intel.com
Cc: Allen Hubbe <allenbh@gmail.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "Jiang, Dave" <dave.jiang@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marc Zygnier <maz@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, "Rodel, Jorg" <jroedel@suse.de>,
 Bjorn Helgaas <helgaas@kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-ntb@googlegroups.com" <linux-ntb@googlegroups.com>,
 Logan Gunthorpe <logang@deltatee.com>, "Dey, Megha" <megha.dey@intel.com>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Monday, December 13, 2021 7:37 AM
> 
> On Sun, Dec 12, 2021 at 09:55:32PM +0100, Thomas Gleixner wrote:
> > Kevin,
> >
> > On Sun, Dec 12 2021 at 01:56, Kevin Tian wrote:
> > >> From: Thomas Gleixner <tglx@linutronix.de>
> > >> All I can find is drivers/iommu/virtio-iommu.c but I can't find anything
> > >> vIR related there.
> > >
> > > Well, virtio-iommu is a para-virtualized vIOMMU implementations.
> > >
> > > In reality there are also fully emulated vIOMMU implementations (e.g.
> > > Qemu fully emulates Intel/AMD/ARM IOMMUs). In those configurations
> > > the IR logic in existing iommu drivers just apply:
> > >
> > > 	drivers/iommu/intel/irq_remapping.c
> > > 	drivers/iommu/amd/iommu.c
> >
> > thanks for the explanation. So that's a full IOMMU emulation. I was more
> > expecting a paravirtualized lightweight one.
> 
> Kevin can you explain what on earth vIR is for and how does it work??
> 
> Obviously we don't expose the IR machinery to userspace, so at best
> this is somehow changing what the MSI trap does?
> 

Initially it was introduced for supporting more than 255 vCPUs. Due to 
full emulation this capability can certainly support other vIR usages
as observed on bare metal.

vIR doesn't rely on the physical IR presence.

First if the guest doesn't have vfio device then the physical capability
doesn't matter.

Even with vfio device, IR by definition is just about remapping instead
of injection (talk about this part later). The interrupts are always routed
to the host handler first (vfio_msihandler() in this case), which then 
triggers irqfd to call virtual interrupt injection handler (irqfd_wakeup())
in kvm.

This suggests a clear role split between vfio and kvm:

  - vfio is responsible for irq allocation/startup as it is the device driver;
  - kvm takes care of virtual interrupt injection, being a VMM;

The two are connected via irqfd.

Following this split vIR information is completely hidden in userspace.
Qemu calculates the routing information between vGSI and vCPU
(with or without vIR, and for whatever trapped interrupt storages) 
and then registers it to kvm.

When kvm receives a notification via irqfd, it follows irqfd->vGSI->vCPU
and injects a virtual interrupt into the target vCPU.

Then comes an interesting scenario about IOMMU posted interrupt (PI).
This capability allows the IR engine directly converting a physical
interrupt into virtual and then inject it into the guest. Kinda offloading 
the virtual routing information into the hardware.

This is currently achieved via IRQ bypass manager, which helps connect 
vfio (IRQ producer) to kvm (IRQ consumer) around a specific Linux irq 
number. Once the connection is established, kvm calls 
irq_set_vcpu_affinity() to update IRTE with virtual routing information 
for that irq number.

With that design Qemu doesn't know whether IR or PI is enabled 
physically. It always talks to vfio for having IRQ resource allocated and
to kvm for registering virtual routing information.

Then adding the new hypercall machinery into this picture:

  1) The hypercall needs to carry all necessary virtual routing 
     information due to no-trap;

  2) Before querying IRTE data/pair, Qemu needs to complete necessary
     operations as of today to have IRTE ready:

	a) Register irqfd and related GSI routing info to kvm
	b) Allocates/startup IRQs via vfio;

     When PI is enabled, IRTE is ready only after both are completed.

  3) Qemu gets IRTE data/pair from kernel and return to the guest.

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
