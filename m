Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id BBCBC3A5BCB
	for <lists.iommu@lfdr.de>; Mon, 14 Jun 2021 05:09:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 43CE1402B3;
	Mon, 14 Jun 2021 03:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnODajwMV0Q7; Mon, 14 Jun 2021 03:09:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D27E040274;
	Mon, 14 Jun 2021 03:09:43 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AE70FC0024;
	Mon, 14 Jun 2021 03:09:43 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 88D3CC000B
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 03:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59E7660681
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 03:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bx3dJkDyBsNB for <iommu@lists.linux-foundation.org>;
 Mon, 14 Jun 2021 03:09:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 547266066E
 for <iommu@lists.linux-foundation.org>; Mon, 14 Jun 2021 03:09:37 +0000 (UTC)
IronPort-SDR: Xp019mDlRcKKcwaeU+vW2avFL3gvhScb/sdd/UhtOKEzleUfQ4fXt6sc+C9NOXJ0schxITPR2z
 onbWWPZoV7Ww==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="266903453"
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="266903453"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2021 20:09:35 -0700
IronPort-SDR: Ec+CS6m46d5twu++S5OFl17L0nrkfG506cBSX7TDSz3tQQcidOZsG+krwLtogSiAMnMv6b6Ryb
 g93x5PNt8wGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="420650730"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 13 Jun 2021 20:09:35 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 13 Jun 2021 20:09:35 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 13 Jun 2021 20:09:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Sun, 13 Jun 2021 20:09:34 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Sun, 13 Jun 2021 20:09:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dYO9+UdwarXBwxn1HTHP4EC8BvvKJ/flMZBpWGW4PPSkQlyIJx28QtGu3UV2Lw7QIoTswQpUwtGy1Ba7IdsCS8m9ojMeiNUxl4jYe0UUtZd6Im0Fc90YEhSbjTrepEJotbJGHOpy08awA/gulioHVoYvdoXQqcKaHF9CLMZD5MsgVCJSsGXBtgogwnispTOUm0lXLXIig0/TDU9UENRuKDGEF/3ZvngF3VsuXoeuqfPs4RIcgFDDh5asASQ3OhT/XMyPnRigtb1ws9Jgwvz2E2xt4bEn4jRcCt5nPpjUBwu6Au+hiErGzw4M/7lHI8cDX3beo6oZUF3TB+rmTNftkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWT4V63ZD5rbTPklnIriS9GWDTbgxkgeJxPvd4mqdQ0=;
 b=n0y4lEdkT6QvUdT4etCYms7k/CdrjElqRus9QQwbAM8EpS2hXuJqDVGbV6VHsbmIia27bw04q4eaAkav0r1hebQF+oXc4tN6zZEIX5UXCSLpxecIFGcDd4yB7XIa6oBIkgrcJ3DZnAulNLPmraMIUNnob97OjlT0tBUWNU2RaRH0y5uLZ7VFhsvyYBtXTz/6/FN2Q3c8OzkjE/i88S+cOFq0LpJu9WMmkJoDcCYx7CA3UjZgujbDYM87+ARnD51gJzMfDIcoR/jBvrW33FqFtKKjmbK+SHJmCstXhWH9uXcwJU/ZLo1LstoFORIgpx0civx+F8Ee6e6z/nFjvuF4Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWT4V63ZD5rbTPklnIriS9GWDTbgxkgeJxPvd4mqdQ0=;
 b=hvzCq1e+czfKAeHAp7STSvYUeMa1Whn2q2h2hvFwc7PMTBSFJOyTfdkat8WoYEkfKsetmO6cuCwlACaTEoY7UhZJm/NXSv4FKs7/VCk4RBytYlJQA70gu2GuAJvVcP+N/jCF2n1Ay53AA8x8yHaZziStd18Czq0TiDjJeD/iy2U=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 03:09:32 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::6597:eb05:c507:c6c1%12]) with mapi id 15.20.4219.025; Mon, 14 Jun
 2021 03:09:31 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: Plan for /dev/ioasid RFC v2
Thread-Topic: Plan for /dev/ioasid RFC v2
Thread-Index: AddbO/WEUAFl3MPnRsG8exiH8bwEagB7l+uAAACIfoAAAdwYAAADDw6AAAHKgwAAANd4AAAAacwAAAT4QwAAK587AAAR+AnQACzmaQAAbNgBMA==
Date: Mon, 14 Jun 2021 03:09:31 +0000
Message-ID: <MWHPR11MB1886C2A0A8AA3000EBD5F8E18C319@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <MWHPR11MB188699D0B9C10EB51686C4138C389@MWHPR11MB1886.namprd11.prod.outlook.com>
 <YMCy48Xnt/aphfh3@8bytes.org>	<20210609123919.GA1002214@nvidia.com>
 <YMDC8tOMvw4FtSek@8bytes.org>	<20210609150009.GE1002214@nvidia.com>
 <YMDjfmJKUDSrbZbo@8bytes.org>
 <20210609101532.452851eb.alex.williamson@redhat.com>
 <20210609102722.5abf62e1.alex.williamson@redhat.com>
 <20210609184940.GH1002214@nvidia.com>
 <20210610093842.6b9a4e5b.alex.williamson@redhat.com>
 <BN6PR11MB187579A2F88C77ED2131CEF08C349@BN6PR11MB1875.namprd11.prod.outlook.com>
 <20210611153850.7c402f0b.alex.williamson@redhat.com>
In-Reply-To: <20210611153850.7c402f0b.alex.williamson@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.142.3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5c6a5770-0f7b-48a9-079d-08d92ee1d495
x-ms-traffictypediagnostic: CO1PR11MB4964:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4964C443D06FB26146BCED088C319@CO1PR11MB4964.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ERTbzoc8j8WnINfNLTAhY+ILU3uy0PB/3zh6TPOC5wdTGQiLYzEzi3rP+Wv3rpq/Yk9rSlLKf0QJjhSQmMR95wxzs15wOUX1Wowx77xlJBTBcYm1oFPUbnM2HeUiJiqSPFA2fu2gXqCWLAyzzKK0ZsKHKjcM/kdW7/V+vahI3Sc49KQb7EoWYHGp62zYLNlvkoEHgSIC255KN+Rp4ifOnuZlvLQYQzy2A6F+Er+MojJYFUG/C8Le3sT9SLaEabEG66qqfVH+XVKgwBBruxNe0LEbWL+yJm2CYPlPtveURXhrT+/BENPSuu/KZe8wpjjSNzg2KNofBWRQS96bE0JYuNoLxztcOEO+As5ezwMdwjfys4otWwSrYDDU6Crxz1jh9YFnaxYRr9ZBaK9ym2dx9j7Ju+I9gyn7Dcg4Pxljj1BpYwwujPD5e0qLK6wCyJHIC0xB2e3fAbJwBkjuYpi+V92Mr+sN24X33pT7y7/C8gTZfXP99gT1WPRIEx8T1a8GtCwkl6bIl6WLSiCQLQFhYMJG4ZA9yXyK3+9JsNeyGmbB7XzBC2IMeOek7ZsFPHgm4NNiciOxSYY8VDQHNVvaaTialxANe4amDs5oQqY/z4Q=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(396003)(136003)(39860400002)(376002)(2906002)(186003)(6916009)(71200400001)(7416002)(83380400001)(122000001)(33656002)(86362001)(26005)(66946007)(64756008)(66476007)(66446008)(66556008)(38100700002)(4326008)(30864003)(7696005)(76116006)(54906003)(9686003)(316002)(52536014)(6506007)(8676002)(478600001)(8936002)(55016002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UTN6WUx4UG45dkpsaS9mOXlOQU01ZlBJTzJLQTVQZFdnSDNwWUd0VDlibDJl?=
 =?utf-8?B?TW1QVXJWS05rRW5maW5mbFNDcmYxTFJVRzhiZE5ET1FHeVpRbE5hZ0V1K2hz?=
 =?utf-8?B?cVJsNkRpV3IwNmZlVUVsNEM2Q1VUbzhZbGV2eUZvNU5YQXFFY3R3NlNuOUZ5?=
 =?utf-8?B?aWtSNTNjTHZvbmlCN1d3VFlJQlNQSFJYUzZIaWNXSTIzUFlDTVNhWWl3YnBr?=
 =?utf-8?B?RHNpV3ZXSTUrUkNKMnFhREdyVkVhSFpEdlBhQ1RZYnZ6clBibXh5VVI3Ti9M?=
 =?utf-8?B?aXJVb2xVSHhIOFBjRkVNemFucCtYUlBJNlVjcDlZZjVPaXEwU2d5SzNORUh4?=
 =?utf-8?B?N2l2a01Nd1k3REpNVlFoQ0VTSER3UStjNmI1eTJWMHUvVXJwS0xTY1gvZmVV?=
 =?utf-8?B?Yk9GeVVDNWw0YmFSbVBoSTRaa3QrWkQzU09PTVcxVmpGdmcyRTRBeWZnQ3NB?=
 =?utf-8?B?cGQ4TWJaZFdWUk4xU0t0OXA5UzJpNTRuY29PU205aWM2QWRoMVZWSkZ6Y2R4?=
 =?utf-8?B?ckZWaDF1cUs5U2o3c1VaUXZIdjA2MjJJWmFCTE5zVUE3M3lnTU5VTzhjVVVq?=
 =?utf-8?B?MTF6bG5heDJUMjh0bDBZYjgvQWtnTmZXMTZNcjNDUFB3K1N4VWg1YSs4OXFP?=
 =?utf-8?B?b3F0cjBZWHprVTV0RjN0ZXFQbEkzUERnS0RiRVpxQ2ZOakhDSUJNU281eUEy?=
 =?utf-8?B?QTI1M3hYbVN2alR0Q0RJWm9PY3hwNnJJQS9NT083Z0ZGSFRUdHdZd3FVakdL?=
 =?utf-8?B?Ylg2dER5WWkvWVRCcXYrbHBJRXNLMVl5WGZtQi96V1B5RHplaDE0MVU1cVAx?=
 =?utf-8?B?Zmo3QmZodDVuZ3pMMXZBTWVrdmlXV3BnL2w5T1NNN0t0NWdKMDlDRmEyNHhm?=
 =?utf-8?B?UWdBZmMxbXpoV1ZNeFphVkRqbFNVK2pmMnJLRGtIVUFpR3F5dDZhV25TMjlE?=
 =?utf-8?B?TDZ0R09zanUwZDIxUzZYNkNzalZlRFQ2OXd2SjY1K3JQa2VTdWxzbGlrWG13?=
 =?utf-8?B?Q01CNlhuVzRJdGthUEV6VGFxWU9McWx6WlJLaEtBZk5HU0hrc2txVG1PbUJB?=
 =?utf-8?B?VzF6U2s3cHZURVFxT1BndGIvdDltOTNqR3duY1NiM2Q2Z0F5SHhpS2o3a3VI?=
 =?utf-8?B?VGZwYXp3RWM0NHhDakhjalJWMllPaEUvaE5wSHVnVENmOC9YRWc5cTZqSXVE?=
 =?utf-8?B?UGZlMXJCKzdBYzJPZVNWZWVCWWFMTmk4T2lZc2dGZ0hDcEFFdjdYL0RrSTZq?=
 =?utf-8?B?VVhKSzVob2xTWFVtVnI2TkdRKzVtdEFCRWxCMFUzZzAzWm5Zc2YyVHZFdDJN?=
 =?utf-8?B?VTk4Q3I0NC93YU5JaHU4RThxU2g1MVZ0S0VvRFBaZVFaTkZxSFkzK1VFV0x1?=
 =?utf-8?B?WHh5eHdyZjdyR2RBUGJ5c2h0WCs4UWdzdHVzVTZhdTE3RGRWMU9RNWhwYUl6?=
 =?utf-8?B?N3F5aTkxZjQxdTRTOFFDU29HZzZGNlIrclVXOE50MUFQZVlXQ2dHTlNNQkR3?=
 =?utf-8?B?SVhOcHl5ZUVhNlN0ejhXVndOc092NEkvMklvMzVwSVlWL2RpUExjblJjYXVX?=
 =?utf-8?B?ZTU5ZlVtS2duclFNb0ZkOC9pOWJvWWtLSE5PdW1RamdHVlE5YXl0YmR0ZHEw?=
 =?utf-8?B?d08ycjIxVjFTOGZzZkM5WFZDaW5PcGVnQkR4TVVHeVlJNDNKWjcrSTdHV1Q1?=
 =?utf-8?B?WEF4MS9BWUZHU0pjalI3YlF0OGtBaXFqUXdBelBZUW5TY24yWVNsTGNnRWt4?=
 =?utf-8?Q?20Vu6tmfYem0PAfI+QOogOU2Es+G1/7web/Vzwr?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c6a5770-0f7b-48a9-079d-08d92ee1d495
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 03:09:31.6692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h41gzIjCHU/FFRRelnxqgRoSvqNYgNpHh56tlaueH85WyQGxZnhXG7JWaJ005DqLZ1iDCMw0vEelcAnxecd3yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
X-OriginatorOrg: intel.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jason Wang <jasowang@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@nvidia.com>,
 "parav@mellanox.com" <parav@mellanox.com>, "Enrico Weigelt,
 metux IT consult" <lkml@metux.net>, David Gibson <david@gibson.dropbear.id.au>,
 Robin Murphy <robin.murphy@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 Shenming Lu <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw2@infradead.org>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

PiBGcm9tOiBBbGV4IFdpbGxpYW1zb24gPGFsZXgud2lsbGlhbXNvbkByZWRoYXQuY29tPg0KPiBT
ZW50OiBTYXR1cmRheSwgSnVuZSAxMiwgMjAyMSA1OjM5IEFNDQo+IA0KPiBPbiBGcmksIDExIEp1
biAyMDIxIDAwOjU4OjM1ICswMDAwDQo+ICJUaWFuLCBLZXZpbiIgPGtldmluLnRpYW5AaW50ZWwu
Y29tPiB3cm90ZToNCj4gDQo+ID4gSGksIEFsZXgsDQo+ID4NCj4gPiA+IEZyb206IEFsZXggV2ls
bGlhbXNvbiA8YWxleC53aWxsaWFtc29uQHJlZGhhdC5jb20+DQo+ID4gPiBTZW50OiBUaHVyc2Rh
eSwgSnVuZSAxMCwgMjAyMSAxMTozOSBQTQ0KPiA+ID4NCj4gPiA+IE9uIFdlZCwgOSBKdW4gMjAy
MSAxNTo0OTo0MCAtMDMwMA0KPiA+ID4gSmFzb24gR3VudGhvcnBlIDxqZ2dAbnZpZGlhLmNvbT4g
d3JvdGU6DQo+ID4gPg0KPiA+ID4gPiBPbiBXZWQsIEp1biAwOSwgMjAyMSBhdCAxMDoyNzoyMkFN
IC0wNjAwLCBBbGV4IFdpbGxpYW1zb24gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEl0
IGlzIGEga2VybmVsIGRlY2lzaW9uLCBiZWNhdXNlIGEgZnVuZGFtZW50YWwgdGFzayBvZiB0aGUg
a2VybmVsIGlzDQo+IHRvDQo+ID4gPiA+ID4gPiA+IGVuc3VyZSBpc29sYXRpb24gYmV0d2VlbiB1
c2VyLXNwYWNlIHRhc2tzIGFzIGdvb2QgYXMgaXQgY2FuLiBBbmQgaWYNCj4gYQ0KPiA+ID4gPiA+
ID4gPiBkZXZpY2UgYXNzaWduZWQgdG8gb25lIHRhc2sgY2FuIGludGVyZmVyIHdpdGggYSBkZXZp
Y2Ugb2YgYW5vdGhlcg0KPiB0YXNrDQo+ID4gPiA+ID4gPiA+IChlLmcuIGJ5IHNlbmRpbmcgUDJQ
IG1lc3NhZ2VzKSwgdGhlbiB0aGUgcHJvbWlzZSBvZiBpc29sYXRpb24gaXMNCj4gPiA+IGJyb2tl
bi4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBBSVVJLCB0aGUgSU9BU0lEIG1vZGVsIHdpbGwg
c3RpbGwgZW5mb3JjZSBJT01NVSBncm91cHMsIGJ1dCBpdCdzIG5vdA0KPiBhbg0KPiA+ID4gPiA+
ID4gZXhwbGljaXQgcGFydCBvZiB0aGUgaW50ZXJmYWNlIGxpa2UgaXQgaXMgZm9yIHZmaW8uICBG
b3IgZXhhbXBsZSB0aGUNCj4gPiA+ID4gPiA+IElPQVNJRCBtb2RlbCBhbGxvd3MgYXR0YWNoaW5n
IGluZGl2aWR1YWwgZGV2aWNlcyBzdWNoIHRoYXQgd2UgaGF2ZQ0KPiA+ID4gPiA+ID4gZ3JhbnVs
YXJpdHkgdG8gY3JlYXRlIHBlciBkZXZpY2UgSU9BU0lEcywgYnV0IGFsbCBkZXZpY2VzIHdpdGhp
biBhbg0KPiA+ID4gPiA+ID4gSU9NTVUgZ3JvdXAgYXJlIHJlcXVpcmVkIHRvIGJlIGF0dGFjaGVk
IHRvIGFuIElPQVNJRCBiZWZvcmUgdGhleQ0KPiBjYW4NCj4gPiA+IGJlDQo+ID4gPiA+ID4gPiB1
c2VkLg0KPiA+ID4gPg0KPiA+ID4gPiBZZXMsIHRoYW5rcyBBbGV4DQo+ID4gPiA+DQo+ID4gPiA+
ID4gPiBJdCdzIG5vdCBlbnRpcmVseSBjbGVhciB0byBtZSB5ZXQgaG93IHRoYXQgbGFzdCBiaXQg
Z2V0cw0KPiA+ID4gPiA+ID4gaW1wbGVtZW50ZWQgdGhvdWdoLCBpZS4gd2hhdCBiYXJyaWVyIGlz
IGluIHBsYWNlIHRvIHByZXZlbnQgZGV2aWNlDQo+ID4gPiA+ID4gPiB1c2FnZSBwcmlvciB0byBy
ZWFjaGluZyB0aGlzIHZpYWJsZSBzdGF0ZS4NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIG1ham9yIHNl
Y3VyaXR5IGNoZWNrcG9pbnQgZm9yIHRoZSBncm91cCBpcyBvbiB0aGUgVkZJTyBzaWRlLiAgV2UN
Cj4gPiA+ID4gbXVzdCByZXF1aXJlIHRoZSBncm91cCBiZWZvcmUgdXNlcnNwYWNlIGNhbiBiZSBh
bGxvd2VkIGFjY2VzcyB0byBhbnkNCj4gPiA+ID4gZGV2aWNlIHJlZ2lzdGVycy4gT2J0YWluaW5n
IHRoZSBkZXZpY2VfZmQgZnJvbSB0aGUgZ3JvdXBfZmQgZG9lcyB0aGlzDQo+ID4gPiA+IHRvZGF5
IGFzIHRoZSBncm91cF9mZCBpcyB0aGUgc2VjdXJpdHkgcHJvb2YuDQo+ID4gPiA+DQo+ID4gPiA+
IEFjdHVhbGx5LCB0aGlua2luZyBhYm91dCB0aGlzIHNvbWUgbW9yZS4uIElmIHRoZSBvbmx5IHdh
eSB0byBnZXQgYQ0KPiA+ID4gPiB3b3JraW5nIGRldmljZV9mZCBpbiB0aGUgZmlyc3QgcGxhY2Ug
aXMgdG8gZ2V0IGl0IGZyb20gdGhlIGdyb3VwX2ZkDQo+ID4gPiA+IGFuZCB0aHVzIHBhc3MgYSBn
cm91cC1iYXNlZCBzZWN1cml0eSBjaGVjaywgd2h5IGRvIHdlIG5lZWQgdG8gZG8NCj4gPiA+ID4g
YW55dGhpbmcgYXQgdGhlIGlvYXNpZCBsZXZlbD8NCj4gPiA+ID4NCj4gPiA+ID4gVGhlIHNlY3Vy
aXR5IGNvbmNlcHQgb2YgaXNvbGF0aW9uIHdhcyBzYXRpc2ZpZWQgYXMgc29vbiBhcyB1c2Vyc3Bh
Y2UNCj4gPiA+ID4gb3BlbmVkIHRoZSBncm91cF9mZC4gV2hhdCBkbyBtb3JlIGNoZWNrcyBpbiB0
aGUga2VybmVsIGFjY29tcGxpc2g/DQo+ID4gPg0KPiA+ID4gT3BlbmluZyB0aGUgZ3JvdXAgaXMg
bm90IHRoZSBleHRlbnQgb2YgdGhlIHNlY3VyaXR5IGNoZWNrIGN1cnJlbnRseQ0KPiA+ID4gcmVx
dWlyZWQsIHRoZSBncm91cCBtdXN0IGJlIGFkZGVkIHRvIGEgY29udGFpbmVyIGFuZCBhbiBJT01N
VSBtb2RlbA0KPiA+ID4gY29uZmlndXJlZCBmb3IgdGhlIGNvbnRhaW5lciAqYmVmb3JlKiB0aGUg
dXNlciBjYW4gZ2V0IGEgZGV2aWNlZmQuDQo+ID4gPiBFYWNoIGRldmljZWZkIGNyZWF0ZXMgYSBy
ZWZlcmVuY2UgdG8gdGhpcyBzZWN1cml0eSBjb250ZXh0LCB0aGVyZWZvcmUNCj4gPiA+IGFjY2Vz
cyB0byBhIGRldmljZSBkb2VzIG5vdCBleGlzdCB3aXRob3V0IHN1Y2ggYSBjb250ZXh0Lg0KPiA+
DQo+ID4gSUlVQyBlYWNoIGRldmljZSBoYXMgYSBkZWZhdWx0IGRvbWFpbiB3aGVuIGl0J3MgcHJv
YmVkIGJ5IGlvbW11IGRyaXZlcg0KPiA+IGF0IGJvb3QgdGltZS4gVGhpcyBkb21haW4gaW5jbHVk
ZXMgYW4gZW1wdHkgcGFnZSB0YWJsZSwgaW1wbHlpbmcgdGhhdA0KPiA+IGRldmljZSBpcyBhbHJl
YWR5IGluIGEgc2VjdXJpdHkgY29udGV4dCBiZWZvcmUgaXQncyBwcm9iZWQgYnkgZGV2aWNlIGRy
aXZlci4NCj4gDQo+IFRoZSBkZWZhdWx0IGRvbWFpbiBjb3VsZCBiZSBwYXNzdGhyb3VnaCB0aG91
Z2gsIHJpZ2h0Pw0KDQpHb29kIHBvaW50Lg0KDQo+IA0KPiA+IE5vdyB3aGVuIHRoaXMgZGV2aWNl
IGlzIGFkZGVkIHRvIHZmaW8sIHZmaW8gY3JlYXRlcyBhbm90aGVyIHNlY3VyaXR5DQo+ID4gY29u
dGV4dCB0aHJvdWdoIGFib3ZlIHNlcXVlbmNlLiBUaGlzIHNlcXVlbmNlIHJlcXVpcmVzIHRoZSBk
ZXZpY2UgdG8NCj4gPiBzd2l0Y2ggZnJvbSBkZWZhdWx0IHNlY3VyaXR5IGNvbnRleHQgdG8gdGhp
cyBuZXcgb25lLCBiZWZvcmUgaXQgY2FuIGJlDQo+ID4gYWNjZXNzZWQgYnkgdXNlci4NCj4gDQo+
IFRoaXMgaXMgdHJ1ZSBjdXJyZW50bHksIHdlIHVzZSBncm91cCBzZW1hbnRpY3Mgd2l0aCB0aGUg
dHlwZTEgSU9NTVUNCj4gYmFja2VuZCB0byBhdHRhY2ggYWxsIGRldmljZXMgaW4gdGhlIGdyb3Vw
IHRvIGEgc2VjdXJlIGNvbnRleHQsDQo+IHJlZ2FyZGxlc3Mgb2YgdGhlIGRlZmF1bHQgZG9tYWlu
Lg0KPiANCj4gPiBUaGVuIEkgd29uZGVyIHdoZXRoZXIgaXQncyByZWFsbHkgbmVjZXNzYXJ5LiBB
cyBsb25nIGFzIGEgZGV2aWNlIGlzIGluDQo+ID4gYSBzZWN1cml0eSBjb250ZXh0IGF0IGFueSB0
aW1lLCBhY2Nlc3MgdG8gYSBkZXZpY2UgY2FuIGJlIGFsbG93ZWQuIFRoZQ0KPiA+IHVzZXIgaXRz
ZWxmIHNob3VsZCBlbnN1cmUgdGhhdCB0aGUgYWNjZXNzIGhhcHBlbnMgb25seSBhZnRlciB0aGUg
ZGV2aWNlDQo+ID4gY3JlYXRlcyBhIHJlZmVyZW5jZSB0byB0aGUgbmV3IHNlY3VyaXR5IGNvbnRl
eHQgdGhhdCBpcyBkZXNpcmVkIGJ5IHRoaXMNCj4gPiB1c2VyLg0KPiA+DQo+ID4gVGhlbiB3aGF0
IGRvZXMgZ3JvdXAgcmVhbGx5IGJyaW5nIHRvIHVzPw0KPiANCj4gQnkgZGVmaW5pdGlvbiBhbiBJ
T01NVSBncm91cCBpcyB0aGUgc21hbGxlc3Qgc2V0IG9mIGRldmljZXMgdGhhdCB3ZQ0KPiBjYW4g
Y29uc2lkZXIgaXNvbGF0ZWQgZnJvbSBhbGwgb3RoZXIgZGV2aWNlcy4gIFRoZXJlZm9yZSBkZXZp
Y2VzIGluIGENCj4gZ3JvdXAgYXJlIG5vdCBuZWNlc3NhcmlseSBpc29sYXRlZCBmcm9tIGVhY2gg
b3RoZXIuICBUaGVyZWZvcmUgaWYgYW55DQo+IGRldmljZSB3aXRoaW4gYSBncm91cCBpcyBub3Qg
aXNvbGF0ZWQsIHRoZSBncm91cCBpcyBub3QgaXNvbGF0ZWQuICBWRklPDQo+IG5lZWRzIHRvIGtu
b3cgd2hlbiBpdCdzIHNhZmUgdG8gcHJvdmlkZSB1c2Vyc3BhY2UgYWNjZXNzIHRvIHRoZSBkZXZp
Y2UsDQo+IGJ1dCB0aGUgZGV2aWNlIGlzb2xhdGlvbiBpcyBkZXBlbmRlbnQgb24gdGhlIGdyb3Vw
IGlzb2xhdGlvbi4gIFRoZQ0KPiBncm91cCBpcyB0aGVyZWZvcmUgcGFydCBvZiB0aGlzIHBpY3R1
cmUgd2hldGhlciBpbXBsaWNpdCBvciBleHBsaWNpdC4NCj4gDQo+ID4gV2l0aCB0aGlzIG5ldyBw
cm9wb3NhbCB3ZSBqdXN0IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgYSBkZXZpY2UgY2Fubm90DQo+
ID4gYmUgYXR0YWNoZWQgdG8gYW55IElPQVNJRCBiZWZvcmUgYWxsIGRldmljZXMgaW4gaXRzIGdy
b3VwIGFyZSBib3VuZCB0bw0KPiA+IHRoZSBJT0FTSURmZC4gSWYgd2Ugd2FudCB0byBzdGFydCB3
aXRoIGEgdmZpby1saWtlIHBvbGljeSwgdGhlbiBhbGwgZGV2aWNlcw0KPiA+IGluIHRoZSBncm91
cCBtdXN0IGJlIGF0dGFjaGVkIHRvIHRoZSBzYW1lIElPQVNJRC4gT3IgYXMgSmFzb24gc3VnZ2Vz
dHMsDQo+ID4gdGhleSBjYW4gYXR0YWNoIHRvIGRpZmZlcmVudCBJT0FTSURzIChpZiBpbiB0aGUg
Z3JvdXAgZHVlIHRvICFBQ1MpIGlmIHRoZQ0KPiA+IHVzZXIgd2FudHMsIG9yIGhhdmUgc29tZSBk
ZXZpY2VzIGF0dGFjaGVkIHdoaWxlIG90aGVycyBkZXRhY2hlZCBzaW5jZQ0KPiA+IGJvdGggYXJl
IGluIGEgc2VjdXJpdHkgY29udGV4dCBhbnl3YXkuDQo+IA0KPiBCdXQgaWYgaXQncyB0aGUgZGV2
aWNlIGF0dGFjaG1lbnQgdG8gdGhlIElPQVNJRCB0aGF0IHByb3ZpZGVzIHRoZQ0KPiBpc29sYXRp
b24gYW5kIHRoZSB1c2VyIG1pZ2h0IGF0dGFjaCBhIGRldmljZSB0byBtdWx0aXBsZSBJT0FTSURz
IHdpdGhpbg0KPiB0aGUgc2FtZSBJT0FTSURmZCwgYW5kIHByZXN1bWFibHkgbWFrZSBjaGFuZ2Vz
IHRvIHRoZSBtYXBwaW5nIG9mIGRldmljZQ0KPiB0byBJT0FTSUQgZHluYW1pY2FsbHksIGFyZSB3
ZSBpbnRlcnJ1cHRpbmcgdXNlciBhY2Nlc3MgYXJvdW5kIGVhY2ggb2YNCj4gdGhvc2UgY2hhbmdl
cz8gIEhvdyB3b3VsZCB2ZmlvIGJlIGFibGUgdG8gdHJhY2sgdGhpcywgYW5kIG5vdCBvbmx5DQo+
IHRyYWNrIGl0IHBlciBkZXZpY2UsIGJ1dCBmb3IgYWxsIGRldmljZXMgaW4gdGhlIGdyb3VwLiAg
U3VnZ2VzdGluZyBhDQo+IHVzZXIgbmVlZHMgdG8gZXhwbGljaXRseSBhdHRhY2ggZXZlcnkgZGV2
aWNlIGluIHRoZSBncm91cCBpcyBhbHNvIGENCj4gc2VtYW50aWMgY2hhbmdlIHZlcnN1cyBleGlz
dGluZyB2ZmlvLCB3aGVyZSBvdGhlciBkZXZpY2VzIGluIHRoZSBncm91cA0KPiBtdXN0IG9ubHkg
YmUgY29uc2lkZXJlZCB0byBiZSBpbiBhIHNhZmUgc3RhdGUgZm9yIHRoZSBncm91cCB0byBiZQ0K
PiB1c2FibGUuDQo+IA0KPiBUaGUgZGVmYXVsdCBkb21haW4gbWF5IGluZGVlZCBiZSBhIHNvbHV0
aW9uIHRvIHRoZSBwcm9ibGVtLCBidXQgd2UgbmVlZA0KPiB0byBlbmZvcmNlIGEgc2VjdXJlIGRl
ZmF1bHQgZG9tYWluIGZvciBhbGwgZGV2aWNlcyBpbiB0aGUgZ3JvdXAuICBUbyBtZQ0KPiB0aGF0
IHN1Z2dlc3RzIHRoYXQgYmluZGluZyB0aGUgKmdyb3VwKiB0byBhbiBJT0FTSURmZCBpcyB0aGUg
cG9pbnQgYXQNCj4gd2hpY2ggZGV2aWNlIGFjY2VzcyBiZWNvbWVzIHNlY3VyZS4gIFZGSU8gc2hv
dWxkIGJlIGFibGUgdG8gY29uc2lkZXINCj4gdGhhdCB0aGUgSU9BU0lEZmQgYmluZGluZyBoYXMg
dGFrZW4gb3ZlciBvd25lcnNoaXAgb2YgdGhlIERNQSBjb250ZXh0DQo+IGZvciB0aGUgZGV2aWNl
IGFuZCBpdCB3aWxsIGFsd2F5cyBiZSBlaXRoZXIgYW4gZW1wdHksIGlzb2xhdGVkLCBkZWZhdWx0
DQo+IGRvbWFpbiBvciBhIHVzZXIgZGVmaW5lZCBJT0FTSUQuDQoNClllcywgdGhpcyBpcyBvbmUg
d2F5IG9mIGVuZm9yY2luZyB0aGUgZ3JvdXAgc2VjdXJpdHkuDQoNCkluIHRoZSBtZWFudGltZSwg
SSdtIHRoaW5raW5nIGFib3V0IGFub3RoZXIgd2F5IHdoZXRoZXIgZ3JvdXAgDQpzZWN1cml0eSBj
YW4gYmUgZW5mb3JjZWQgaW4gdGhlIGlvbW11IGxheWVyIHRvIHJlbGF4IHRoZSB1QVBJIGRlc2ln
bi4gDQpJZiBhIGRldmljZSBjYW4gYmUgYWx3YXlzIGJsb2NrZWQgZnJvbSBhY2Nlc3NpbmcgbWVt
b3J5IGluIHRoZSANCklPTU1VIGJlZm9yZSBpdCdzIGJvdW5kIHRvIGEgZHJpdmVyIG9yIG1vcmUg
c3BlY2lmaWNhbGx5IGJlZm9yZQ0KdGhlIGRyaXZlciBtb3ZlcyBpdCB0byBhIG5ldyBzZWN1cml0
eSBjb250ZXh0LCB0aGVuIHRoZXJlIGlzIG5vIG5lZWQNCmZvciBWRklPIHRvIHRyYWNrIHdoZXRo
ZXIgSU9BU0lEZmQgaGFzIHRha2VuIG92ZXIgb3duZXJzaGlwIG9mDQp0aGUgRE1BIGNvbnRleHQg
Zm9yIGFsbCBkZXZpY2VzIHdpdGhpbiBhIGdyb3VwLg0KDQpCdXQgYXMgeW91IHNhaWQgdGhpcyBj
YW5ub3QgYmUgYWNoaWV2ZWQgdmlhIGV4aXN0aW5nIGRlZmF1bHQgZG9tYWluDQphcHByb2FjaC4g
U28gZmFyIGEgZGV2aWNlIGlzIGFsd2F5cyBhdHRhY2hlZCB0byBhIGRvbWFpbjoNCg0KLSBET01B
SU5fSURFTlRJVFk6IGEgZGVmYXVsdCBkb21haW4gd2l0aG91dCBETUEgcHJvdGVjdGlvbg0KLSBE
T01BSU5fRE1BOiBhIGRlZmF1bHQgZG9tYWluIHdpdGggRE1BIHByb3RlY3Rpb24gdmlhIERNQSAN
CiAgQVBJIGFuZCBpb21tdSBjb3JlDQotIERPTUFJTl9VTk1BTkFHRUQ6IGEgZHJpdmVyLWNyZWF0
ZWQgZG9tYWluIHdoaWNoIGlzIG5vdA0KICAgbWFuYWdlZCBieSBpb21tdSBjb3JlLg0KDQpUaGUg
c3BlY2lhbCBzZXF1ZW5jZSBpbiBjdXJyZW50IHZmaW8gZ3JvdXAgZGVzaWduIGlzIHRvIG1pdGln
YXRlDQp0aGUgMXN0IGNhc2UsIGkuZS4gaWYgYSBkZXZpY2UgaXMgbGVmdCBpbiBwYXNzdGhyb3Vn
aCBtb2RlIGJlZm9yZQ0KYm91bmQgdG8gVkZJTyBpdCdzIGRlZmluaXRlbHkgaW5zZWN1cmUgdG8g
YWxsb3cgdXNlciB0byBhY2Nlc3MgaXQuDQpUaGVuIHRoZSBzZXF1ZW5jZSBlbnN1cmVzIHRoYXQg
dGhlIHVzZXIgYWNjZXNzIGlzIGdyYW50ZWQgb24gaXQNCm9ubHkgYWZ0ZXIgYWxsIGRldmljZXMg
d2l0aGluIGEgZ3JvdXAgc3dpdGNoIHRvIGEgc2VjdXJpdHkgY29udGV4dC4NCg0KTm93IGlmIHRo
ZSBuZXcgcHJvcG9zZWQgc2NoZW1lIGNhbiBiZSBzdXBwb3J0ZWQsIGEgZGV2aWNlDQppcyBhbHdh
eXMgaW4gYSBzZWN1cml0eSBjb250ZXh0IChibG9jay1kbWEpIGJlZm9yZSBpdCdzIHN3aXRjaGVk
IA0KdG8gYSBuZXcgc2VjdXJpdHkgY29udGV4dCBhbmQgZXhpc3RpbmcgZG9tYWluIHR5cGVzIHNo
b3VsZCBiZSANCmFwcGxpZWQgb25seSBpbiB0aGUgbmV3IGNvbnRleHQgd2hlbiB0aGUgZGV2aWNl
IHN0YXJ0cyB0byBkbyANCkRNQXMuIEZvciBWRklPIGNhc2UgdGhpcyBzd2l0Y2ggaGFwcGVucyBl
eHBsaWNpdGx5IHdoZW4gYXR0YWNoaW5nIA0KdGhlIGRldmljZSB0byBhbiBJT0FTSUQuIEZvciBr
ZXJuZWwgZHJpdmVyIGl0J3MgaW1wbGljaXQgZS5nLiBjb3VsZA0KaGFwcGVuIHdoZW4gdGhlIDFz
dCBETUEgQVBJIGNhbGwgaXMgcmVjZWl2ZWQuIA0KDQpJZiB0aGlzIHdvcmtzIEkgZGlkbid0IHNl
ZSB0aGUgbmVlZCBmb3IgdmZpbyB0byBrZWVwIHRoZSBzZXF1ZW5jZS4gDQpWRklPIHN0aWxsIGtl
ZXBzIGdyb3VwIGZkIHRvIGNsYWltIG93bmVyc2hpcCBvZiBhbGwgZGV2aWNlcyBpbiBhIA0KZ3Jv
dXAuIE9uY2UgaXQncyBkb25lLCB2ZmlvIGRvZXNuJ3QgbmVlZCB0byB0cmFjayB0aGUgZGV2aWNl
IGF0dGFjaCANCnN0YXR1cyBhbmQgdXNlciBhY2Nlc3MgY2FuIGJlIGFsd2F5cyBncmFudGVkIHJl
Z2FyZGxlc3Mgb2YgDQpob3cgdGhlIGF0dGFjaCBzdGF0dXMgY2hhbmdlcy4gTW92aW5nIGEgZGV2
aWNlIGZyb20gSU9BU0lEMSANCnRvIElPQVNJRDIgaW52b2x2ZXMgZGV0YWNoaW5nIGZyb20gSU9B
U0lEMSAoYmFjayB0byBibG9ja2VkDQpkbWEgY29udGV4dCkgYW5kIHRoZW4gcmVhdHRhY2hpbmcg
dG8gSU9BU0lEMiAoc3dpdGNoIHRvIGENCm5ldyBzZWN1cml0eSBjb250ZXh0KS4NCg0KRm9sbG93
aW5nIHRoaXMgZGlyZWN0aW9uIGV2ZW4gSU9BU0lEZmQgZG9lc24ndCBuZWVkIHRvIHZlcmlmeQ0K
dGhlIGdyb3VwIGF0dGFjaCB1cG9uIHN1Y2ggZ3VhcmFudGVlIGZyb20gdGhlIGlvbW11IGxheWVy
LiANClRoZSBkZXZpY2VzIHdpdGhpbiBhIGdyb3VwIGNhbiBiZSBpbiBkaWZmZXJlbnQgc2VjdXJp
dHkgY29udGV4dHMsDQplLmcuIHdpdGggc29tZSBkZXZpY2VzIGF0dGFjaGVkIHRvIEdQQSBJT0FT
SUQgd2hpbGUgb3RoZXJzIG5vdCANCmF0dGFjaGVkLiBJbiB0aGlzIHdheSB2ZmlvIHVzZXJzcGFj
ZSBjb3VsZCBjaG9vc2UgdG8gbm90IGF0dGFjaCANCmV2ZXJ5IGRldmljZSBvZiBhIGdyb3VwIHRv
IHN1c3RhaW4gdGhlIGN1cnJlbnQgc2VtYW50aWNzLg0KDQo+IA0KPiBNYXliZSB0aGUgbW9kZWwg
cmVsYXRpdmUgdG8gdmZpbyBpcyBzb21ldGhpbmcgbGlrZToNCj4gDQo+ICAxLiBiaW5kIGEgZ3Jv
dXAgdG8gYW4gSU9BU0lEZmQNCj4gICAgIFZGSU9fR1JPVVBfQklORF9JT0FTSURfRkQoZ3JvdXBm
ZCwgaW9hc2lkZmQpDQo+ICAyLiBjcmVhdGUgYW4gSU9BU0lEIGxhYmVsIGZvciBlYWNoIGRldmlj
ZQ0KPiAgICAgVkZJT19ERVZJQ0VfU0VUX0lPQVNJRF9MQUJFTChkZXZpY2VmZCwgZGV2aWNlX2lv
YXNpZF9sYWJlbCkNCj4gDQo+IFZGSU8gY2FuIG9wZW4gYWNjZXNzIHRvIHRoZSBkZXZpY2UgYWZ0
ZXIgc3RlcCAxLCB0aGUgSU9BU0lEZmQgdGFrZXMNCj4gcmVzcG9uc2liaWxpdHkgZm9yIHRoZSBk
ZXZpY2UgSU9NTVUgY29udGV4dC4gIEFmdGVyIHN0ZXAgMiwgc2hvdWxkbid0DQo+IHRoZSB1c2Vy
IHN3aXRjaCB0byB0aGUgSU9BU0lEIHVBUEk/ICBJIGRvbid0IHNlZSB3aHkgdmZpbyB3b3VsZCBi
ZQ0KPiBpbnZvbHZlZCBpbiBhdHRhY2hpbmcgZGV2aWNlcyB0byBzcGVjaWZpYyBJT0FTSUQgY29u
dGV4dHMgd2l0aGluIHRoZQ0KPiBJT0FTSURmZCBhdCB0aGF0IHBvaW50LCB3ZSBtaWdodCBuZWVk
IGludGVybmFsIGNvbXBhdGliaWxpdHkNCj4gaW50ZXJmYWNlcywgYnV0IGEgbmF0aXZlIElPQVNJ
RCB1c2VyIHNob3VsZCBoYXZlIGFsbCB0aGV5IG5lZWQgdG8NCj4gYXR0YWNoIGRldmljZSBsYWJl
bHMgdG8gSU9BU0lEcyB1c2luZyB0aGUgSU9BU0lEZmQgYXQgdGhpcyBwb2ludC4NCg0KSW4gdGhp
cyBwcm9wb3NhbCBWRklPIGRldmljZSBkcml2ZXIgaXMgYWxzbyByZXNwb25zaWJsZSBmb3IgUEFT
SUQgDQp2aXJ0dWFsaXphdGlvbiBzaW5jZSBpdCdzIGEgcGVyLWRldmljZSBwb2xpY3kgdGhhdCBv
bmx5IFZGSU8ga25vd3MuIA0KVkZJTyBuZWVkcyB0byBwcm92aWRlIFBBU0lEIGFzIHJvdXRpbmcg
aW5mb3JtYXRpb24gd2hlbiBkb2luZyANCmRldmljZSBiaW5kLiBUaGlzIGlzIG9uZSBvcGVuIHdo
aWNoIGhhc24ndCBiZWVuIHRob3JvdWdobHkgDQpkaXNjdXNzZWQgaW4gdjEgYW5kIEknbGwgaGF2
ZSBtb3JlIGNsYXJpZmljYXRpb24gb24gdGhpcyBwYXJ0IGluIHYyLg0KDQo+IA0KPiBXZSdsbCBu
ZWVkIHRvIGZpZ3VyZSBvdXQgd2hhdCB0aGUgcmVsZWFzZSBtb2RlbCBsb29rcyBsaWtlIHRvby4g
IEENCj4gZ3JvdXAgc2hvdWxkIGhvbGQgYSByZWZlcmVuY2Ugb24gdGhlIElPQVNJRGZkIGFuZCBl
YWNoIG9wZW4gZGV2aWNlDQo+IHNob3VsZCBob2xkIGEgcmVmZXJlbmNlIG9uIHRoZSBncm91cCBz
byB0aGF0IHRoZSBpc29sYXRpb24gb2YgdGhlIGdyb3VwDQo+IGNhbm5vdCBiZSBicm9rZW4gd2hp
bGUgYW55IGRldmljZSBpcyBvcGVuLg0KPiANCj4gPiA+IFRoaXMgcHJvcG9zYWwgaGFzIG9mIGNv
dXJzZSBwdXQgdGhlIGRldmljZSBiZWZvcmUgdGhlIGdyb3VwLCB3aGljaCB0aGVuDQo+ID4gPiBt
YWtlcyBpdCBtb3JlIGRpZmZpY3VsdCBmb3IgdmZpbyB0byByZXRyb2FjdGl2ZWx5IGVuZm9yY2Ug
c2VjdXJpdHkuDQo+ID4gPg0KPiA+ID4gPiBZZXMsIHdlIGhhdmUgdGhlIGlzc3VlIHdoZXJlIHNv
bWUgZ3JvdXBzIHJlcXVpcmUgYWxsIGRldmljZXMgdG8gdXNlDQo+ID4gPiA+IHRoZSBzYW1lIElP
QVNJRCwgYnV0IG9uY2Ugc29tZW9uZSBoYXMgdGhlIGdyb3VwX2ZkIHRoYXQgaXMgbm8gbG9uZ2Vy
DQo+IGENCj4gPiA+ID4gc2VjdXJpdHkgaXNzdWUuIFdlIGNhbiBmYWlsIFZGSU9fREVWSUNFX0FU
VEFDSF9JT0FTSUQgY2FsbHNzIHRoYXQNCj4gPiA+ID4gZG9uJ3QgbWFrZSBzZW5zZS4NCj4gPiA+
DQo+ID4gPiBUaGUgZ3JvdXBmZCBvbmx5IHByb3ZlcyB0aGUgdXNlciBoYXMgYW4gb3duZXJzaGlw
IGNsYWltIHRvIHRoZSBkZXZpY2VzLA0KPiA+ID4gaXQgZG9lcyBub3QgaXRzZWxmIHByb3ZlIHRo
YXQgdGhlIGRldmljZXMgYXJlIGluIGFuIGlzb2xhdGVkIGNvbnRleHQuDQo+ID4gPiBEZXZpY2Ug
YWNjZXNzIGlzIG5vdCBncmFudGVkIHVudGlsIHRoYXQgaXNvbGF0ZWQgY29udGV4dCBpcyBjb25m
aWd1cmVkLg0KPiA+ID4NCj4gPiA+IHZmaW8gb3ducyB0aGUgZGV2aWNlLCBzbyBpdCB3b3VsZCBt
YWtlIHNlbnNlIGZvciB2ZmlvIHRvIGVuZm9yY2UgdGhlDQo+ID4gPiBzZWN1cml0eSBvZiBkZXZp
Y2UgYWNjZXNzIG9ubHkgaW4gYSBzZWN1cmUgY29udGV4dCwgYnV0IGhvdyBkbyB3ZSBrbm93DQo+
ID4gPiBhIGRldmljZSBpcyBpbiBhIHNlY3VyZSBjb250ZXh0Pw0KPiA+ID4NCj4gPiA+IElzIGl0
IHN1ZmZpY2llbnQgdG8gdHJhY2sgdGhlIHZmaW8gZGV2aWNlIGlvY3RscyBmb3IgYXR0YWNoL2Rl
dGFjaCBmb3INCj4gPiA+IGFuIElPQVNJRCBvciB3aWxsIHRoZSB1c2VyIGJlIGFibGUgdG8gbWFu
aXB1bGF0ZSBJT0FTSUQgY29uZmlndXJhdGlvbg0KPiA+ID4gZm9yIGEgZGV2aWNlIGRpcmVjdGx5
IHZpYSB0aGUgSU9BU0lEZmQ/DQo+ID4gPg0KPiA+ID4gV2hhdCBoYXBwZW5zIG9uIGRldGFjaD8g
IEFzIHdlJ3ZlIGRpc2N1c3NlZCBlbHNld2hlcmUgaW4gdGhpcyB0aHJlYWQsDQo+ID4gPiByZXZv
a2luZyBhY2Nlc3MgaXMgbW9yZSBkaWZmaWN1bHQgdGhhbiBob2xkaW5nIGEgcmVmZXJlbmNlIHRv
IHRoZQ0KPiA+ID4gc2VjdXJlIGNvbnRleHQsIGJ1dCBJJ20gdW5kZXIgdGhlIGltcHJlc3Npb24g
dGhhdCBtb3ZpbmcgYSBkZXZpY2UNCj4gPiA+IGJldHdlZW4gSU9BU0lEcyBjb3VsZCBiZSBzdGFu
ZGFyZCBwcmFjdGljZSBpbiB0aGlzIG5ldyBtb2RlbC4gIEEgZGV2aWNlDQo+ID4gPiB0aGF0J3Mg
ZGV0YWNoZWQgZnJvbSBhIHNlY3VyZSBjb250ZXh0LCBldmVuIHRlbXBvcmFyaWx5LCBpcyBhIHBy
b2JsZW0uDQo+ID4gPiBBY2Nlc3MgdG8gb3RoZXIgZGV2aWNlcyBpbiB0aGUgc2FtZSBncm91cCBh
cyBhIGRldmljZSBkZXRhY2hlZCBmcm9tIGENCj4gPiA+IHNlY3VyZSBjb250ZXh0IGlzIGEgcHJv
YmxlbS4NCj4gPg0KPiA+IGFzIGxvbmcgYXMgdGhlIGRldmljZSBpcyBzd2l0Y2hlZCBiYWNrIHRv
IHRoZSBkZWZhdWx0IHNlY3VyaXR5IGNvbnRleHQNCj4gPiBhZnRlciBkZXRhY2ggdGhlbiBpdCBz
aG91bGQgYmUgZmluZS4NCj4gDQo+IFNvIGxvbmcgYXMgdGhlIGRlZmF1bHQgY29udGV4dCBpcyBz
ZWN1cmUsIGFuZCBpZGVhbGx5IGlmIElPTU1VIGNvbnRleHQNCj4gc3dpdGNoZXMgYXJlIGF0b21p
Yy4NCg0KYXMgbG9uZyBhcyBldmVyeSBzd2l0Y2ggaXMgdG8vZnJvbSBhIGJsb2NrLWRtYSBjb250
ZXh0LCB0aGVuIGl0IHNob3VsZCB3b3JrLiDwn5iKDQoNCj4gDQo+ID4gPiA+ID4gPiA+ID4gR3Jv
dXBzIHNob3VsZCBiZSBwcmltYXJpbHkgYWJvdXQgaXNvbGF0aW9uIHNlY3VyaXR5LCBub3QgYWJv
dXQNCj4gPiA+IElPQVNJRA0KPiA+ID4gPiA+ID4gPiA+IG1hdGNoaW5nLg0KPiA+ID4gPiA+ID4g
Pg0KPiA+ID4gPiA+ID4gPiBUaGF0IGRvZXNuJ3QgbWFrZSBhbnkgc2Vuc2UsIHdoYXQgZG8geW91
IG1lYW4gYnkgJ0lPQVNJRA0KPiBtYXRjaGluZyc/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4g
T25lIG9mIHRoZSBwcm9ibGVtcyB3aXRoIHRoZSB2ZmlvIGludGVyZmFjZSB1c2Ugb2YgZ3JvdXBz
IGlzIHRoYXQgd2UNCj4gPiA+ID4gPiA+IGNvbmZsYXRlIHRoZSBJT01NVSBncm91cCBmb3IgYm90
aCBpc29sYXRpb24gYW5kIGdyYW51bGFyaXR5LiAgSQ0KPiB0aGluaw0KPiA+ID4gPiA+ID4gd2hh
dCBKYXNvbiBpcyByZWZlcnJpbmcgdG8gaGVyZSBpcyB0aGF0IHdlIHN0aWxsIHdhbnQgZ3JvdXBz
IHRvIGJlIHRoZQ0KPiA+ID4gPiA+ID4gYmFzaXMgb2YgaXNvbGF0aW9uLCBidXQgd2UgZG9uJ3Qg
d2FudCBhIHVBUEkgdGhhdCBwcmVzdW1lcyBhbGwNCj4gZGV2aWNlcw0KPiA+ID4gPiA+ID4gd2l0
aGluIHRoZSBncm91cCBtdXN0IHVzZSB0aGUgc2FtZSBJT0FTSUQuDQo+ID4gPiA+DQo+ID4gPiA+
IFllcywgdGhhbmtzIGFnYWluIEFsZXgNCj4gPiA+ID4NCj4gPiA+ID4gPiA+IEZvciBleGFtcGxl
LCBpZiBhIHVzZXIgb3ducyBhbiBJT01NVSBncm91cCBjb25zaXN0aW5nIG9mDQo+ID4gPiA+ID4g
PiBub24taXNvbGF0ZWQgZnVuY3Rpb25zIG9mIGEgbXVsdGktZnVuY3Rpb24gZGV2aWNlLCB0aGV5
IHNob3VsZCBiZQ0KPiA+ID4gPiA+ID4gYWJsZSB0byBjcmVhdGUgYSB2SU9NTVUgVk0gd2hlcmUg
ZWFjaCBvZiB0aG9zZSBmdW5jdGlvbnMgaGFzIGl0cw0KPiA+ID4gPiA+ID4gb3duIGFkZHJlc3Mg
c3BhY2UuICBUaGF0IGNhbid0IGJlIGRvbmUgdG9kYXksIHRoZSBlbnRpcmUgZ3JvdXANCj4gPiA+
ID4gPiA+IHdvdWxkIG5lZWQgdG8gYmUgYXR0YWNoZWQgdG8gdGhlIFZNIHVuZGVyIGEgUENJZS10
by1QQ0kgYnJpZGdlIHRvDQo+ID4gPiA+ID4gPiByZWZsZWN0IHRoZSBhZGRyZXNzIHNwYWNlIGxp
bWl0YXRpb24gaW1wb3NlZCBieSB0aGUgdmZpbyBncm91cA0KPiA+ID4gPiA+ID4gdUFQSSBtb2Rl
bC4gIFRoYW5rcywNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEhtbSwgbGlrZWx5IGRpc2N1c3NlZCBw
cmV2aW91c2x5IGluIHRoZXNlIHRocmVhZHMsIGJ1dCBJIGNhbid0IGNvbWUgdXANCj4gPiA+ID4g
PiB3aXRoIHRoZSBhcmd1bWVudCB0aGF0IHByZXZlbnRzIHVzIGZyb20gbWFraW5nIHRoZSBCSU5E
IGludGVyZmFjZQ0KPiA+ID4gPiA+IGF0IHRoZSBncm91cCBsZXZlbCBidXQgdGhlIEFUVEFDSCBp
bnRlcmZhY2UgYXQgdGhlIGRldmljZSBsZXZlbD8gIEZvcg0KPiA+ID4gPiA+IGV4YW1wbGU6DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiAgLSBWRklPX0dST1VQX0JJTkRfSU9BU0lEX0ZEDQo+ID4gPiA+
ID4gIC0gVkZJT19ERVZJQ0VfQVRUQUNIX0lPQVNJRA0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQUZB
SUNUIHRoYXQgbWFrZXMgdGhlIGdyb3VwIG93bmVyc2hpcCBtb3JlIGV4cGxpY2l0IGJ1dCBzdGls
bCBhbGxvd3MNCj4gPiA+ID4gPiB0aGUgZGV2aWNlIGxldmVsIElPQVNJRCBncmFudWxhcml0eS4g
IExvZ2ljYWxseSB0aGlzIGlzIGp1c3QgYW4NCj4gPiA+ID4gPiBpbnRlcm5hbCBpb21tdV9ncm91
cF9mb3JfZWFjaF9kZXYoKSBpbiB0aGUgQklORCBpb2N0bC4gIFRoYW5rcywNCj4gPiA+ID4NCj4g
PiA+ID4gQXQgYSBoaWdoIGxldmVsIGl0IHNvdW5kcyBPSy4NCj4gPiA+ID4NCj4gPiA+ID4gSG93
ZXZlciBJIHRoaW5rIHlvdXIgYWJvdmUgcXVlc3Rpb24gbmVlZHMgdG8gYmUgYW5zd2VyZWQgLSB3
aGF0IGRvDQo+IHdlDQo+ID4gPiA+IHdhbnQgdG8gZW5mb3JjZSBvbiB0aGUgaW9tbXVfZmQgYW5k
IHdoeT8NCj4gPiA+ID4NCj4gPiA+ID4gQWxzbywgdGhpcyBjcmVhdGVzIGEgcHJvYmxlbSB3aXRo
IHRoZSBkZXZpY2UgbGFiZWwgaWRlYSwgd2Ugc3RpbGwNCj4gPiA+ID4gbmVlZCB0byBhc3NvY2lh
dGUgZWFjaCBkZXZpY2VfZmQgd2l0aCBhIGxhYmVsLCBzbyB5b3VyIGFib3ZlIHNlcXVlbmNlDQo+
ID4gPiA+IGlzIHByb2JhYmx5Og0KPiA+ID4gPg0KPiA+ID4gPiAgIFZGSU9fR1JPVVBfQklORF9J
T0FTSURfRkQoZ3JvdXAgZmQpDQo+ID4gPiA+ICAgVkZJT19CSU5EX0lPQVNJRF9GRChkZXZpY2Ug
ZmQgMSwgZGV2aWNlX2xhYmVsKQ0KPiA+ID4gPiAgIFZGSU9fQklORF9JT0FTSURfRkQoZGV2aWNl
IGZkIDIsIGRldmljZV9sYWJlbCkNCj4gPiA+ID4gICBWRklPX0RFVklDRV9BVFRBQ0hfSU9BU0lE
KC4uKQ0KPiA+ID4gPg0KPiA+ID4gPiBBbmQgdGhlbiBJIHRoaW5rIHdlIGFyZSBiYWNrIHRvIHdo
ZXJlIEkgaGFkIHN0YXJ0ZWQsIHdlIGNhbiB0cmlnZ2VyDQo+ID4gPiA+IHdoYXRldmVyIFZGSU9f
R1JPVVBfQklORF9JT0FTSURfRkQgZG9lcyBhdXRvbWF0aWNhbGx5IGFzIHNvb24gYXMNCj4gYWxs
DQo+ID4gPiA+IG9mIHRoZSBkZXZpY2VzIGluIHRoZSBncm91cCBoYXZlIGJlZW4gYm91bmQuDQo+
ID4gPg0KPiA+ID4gSG93IHRvIGxhYmVsIGEgZGV2aWNlIHNlZW1zIGxpa2UgYSByZWxhdGl2ZWx5
IG11bmRhbmUgaXNzdWUgcmVsYXRpdmUgdG8NCj4gPiA+IG93bmVyc2hpcCBhbmQgaXNvbGF0ZWQg
Y29udGV4dHMgb2YgZ3JvdXBzIGFuZCBkZXZpY2VzLiAgVGhlIGxhYmVsIGlzDQo+ID4gPiBlc3Nl
bnRpYWxseSBqdXN0IGNyZWF0aW5nIGFuIGlkZW50aWZpZXIgdG8gZGV2aWNlIG1hcHBpbmcsIHdo
ZXJlIHRoZQ0KPiA+ID4gaWRlbnRpZmllciAobGFiZWwpIHdpbGwgYmUgdXNlZCBpbiB0aGUgSU9B
U0lEIGludGVyZmFjZSwgcmlnaHQ/ICBBcyBJDQo+ID4NCj4gPiBUaHJlZSB1c2FnZXMgaW4gdjI6
DQo+ID4NCj4gPiAxKSB3aGVuIHJlcG9ydGluZyBwZXItZGV2aWNlIGNhcGFiaWxpdHkvZm9ybWF0
IGluZm8gdG8gdXNlcjsNCj4gPiAyKSB3aGVuIGhhbmRsaW5nIGRldmljZS13aWRlIGlvdGxiIGlu
dmFsaWRhdGlvbiBmcm9tIHVzZXI7DQo+ID4gMykgd2hlbiByZXBvcnRpbmcgZGV2aWNlLXNwZWNp
ZmljIGZhdWx0IGRhdGEgdG8gdXNlcjsNCj4gDQo+IEFzIGFib3ZlLCBpdCBzZWVtcyBtb3JlIGNv
bXBsZXRlIHRvIG1lIHRvIG1vdmUgYXR0YWNoL2RldGFjaCBvZiBkZXZpY2VzDQo+IHRvIElPQVNJ
RHMgdXNpbmcgdGhlIGxhYmVscyBhcyB3ZWxsLiAgVGhhbmtzLA0KPiANCg0KVGhhbmtzDQpLZXZp
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaW9tbXUg
bWFpbGluZyBsaXN0CmlvbW11QGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlz
dHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lvbW11
