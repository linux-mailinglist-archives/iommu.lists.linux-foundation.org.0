Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA5A434B51
	for <lists.iommu@lfdr.de>; Wed, 20 Oct 2021 14:40:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B903140714;
	Wed, 20 Oct 2021 12:39:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UFCH68wZcXfQ; Wed, 20 Oct 2021 12:39:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id C70E840737;
	Wed, 20 Oct 2021 12:39:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 95717C000D;
	Wed, 20 Oct 2021 12:39:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27625C000D
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 12:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2329C83870
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 12:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=intel.onmicrosoft.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id znzU-7WTCMcF for <iommu@lists.linux-foundation.org>;
 Wed, 20 Oct 2021 12:39:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5FC0D8382D
 for <iommu@lists.linux-foundation.org>; Wed, 20 Oct 2021 12:39:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10142"; a="208870499"
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="208870499"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 05:39:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,166,1631602800"; d="scan'208";a="662229092"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by orsmga005.jf.intel.com with ESMTP; 20 Oct 2021 05:39:54 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 20 Oct 2021 05:39:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 20 Oct 2021 05:39:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 20 Oct 2021 05:39:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFh+X+5m0irgczEx41ryruHt10GOoTTq+ITjlh6q+B854diR+U0P8ogq7R6PFp62OG5pLqEuUSQNx8hM3G1QbftwM6GQRMTSKA5JxjoxwhIC96Jkw797rOq7dmO5vXafOzbp56asyc+4KbIYp1fQniVJUgTF5+W4yifRpWTU0WosC5uHlOnsMIfRin41NFhjb2LwYeNFut0HqXLmRBkRe1JY0j3L49+gr2QsnsP//0JY6LCqDMf+x8SUZWeb8qtQSd/SeJHWLABCRvEVIKyeLje58UEcvGNoOUvET3OYrSJxumu6d01ZYvgQ7n+Up2O71S5C4r4acC8Y29Jyw+sN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+Le3TmbeIKgQJTK8EgKK5OzKHUEe3keo52/G2LFK4U=;
 b=eoWFswZWJ385xytWuiCCHAPv8owgz6E2dVf7EzMc1OV2DH7TqN+M6k11PXqSQYchODAlDJkoUKp2hNuTNtWQia/vBkL4BTuRibCAYLeV1fbiF0Rv2QRMIXCrei+a1FRdDyF/gvBNO97nJSrt5VyfqE0AB9Js7wAHXY7jBYb6JBGUnWUYBaqHGYaYbdxMXI1X5JgndlcD79TUOWDWSmNzrPRSmbAyznsqTRvIi9egp250OhIsvqxpBNKQGYIOms/hynYai5Fj44uJN4A+1nUVMSYIkZnWCOz0Qe4MTp7mJXR/izwt0LQ00ect8SJj6UvH32AZwsw34M+aB4jeXj1yZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+Le3TmbeIKgQJTK8EgKK5OzKHUEe3keo52/G2LFK4U=;
 b=XhowLqP1cM8mLpIOGS9UMG0OwbLe1r0LT8Ynu7KIi6AltZL+b2DPr1bSjeGxcLnf89yAmhPoqzbBieKtFlD5Qu4iId3M0T03SQrUAXwZ/bj+plsl1zJXD41epUACIuZ/NV3abbEIMo7r5rXbv0wlVHpNhUfn4wDaJUZ5L+CQWMY=
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH0PR11MB5593.namprd11.prod.outlook.com (2603:10b6:510:e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 12:39:49 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::5009:9c8c:4cb4:e119]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::5009:9c8c:4cb4:e119%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 12:39:49 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [RFC 02/20] vfio: Add device class for /dev/vfio/devices
Thread-Topic: [RFC 02/20] vfio: Add device class for /dev/vfio/devices
Thread-Index: AQHXrSFuEUBAJXc9I0mCP8LXFMJv/au6U6uAgCGxC2A=
Date: Wed, 20 Oct 2021 12:39:49 +0000
Message-ID: <PH0PR11MB5658EC0B109256853904232DC3BE9@PH0PR11MB5658.namprd11.prod.outlook.com>
References: <20210919063848.1476776-1-yi.l.liu@intel.com>
 <20210919063848.1476776-3-yi.l.liu@intel.com> <YVPKu/F3IpPMtGCh@yekko>
In-Reply-To: <YVPKu/F3IpPMtGCh@yekko>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.200.16
dlp-product: dlpe-windows
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85465cb4-c712-420b-1baa-08d993c6b4e9
x-ms-traffictypediagnostic: PH0PR11MB5593:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <PH0PR11MB55932F1A7A8EAE26AE5C1609C3BE9@PH0PR11MB5593.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C2+RDm1JfVDHHb0YEpQMyIJPcedBfeQMSBV9tweYsxX/6M/Uq50G6g+8ocZ5Cs8+BJg+NGvln5MQSLkv8xjFml4Jttmo5aqzxx69PGuWF4ddcY7AwLDhel8uREZJBFVV9d6qwsl/djFjFALiqYYQS8sOV8y4x2Ob568Eq8LMTOcxIG3/k3L/lXxOuhWGiN/9zBtKdjtK9OTFjorEOxgRefI95BXnwl+l+5A1/LaH5FlQ5oI/a1HSU5KyFoEwMW/iGRebr7O2JFIZTfDMoLi5FsYDSfitW3z6a8eKlUuYGYln+CnzDTFqxg3qOGHcNVbPwCqCiBQYeLubr7ANqjjcO2AXkgWzsY0mH+aGcbMAxuVhRPqXRzpM5M2nSgP4YYwMAQ485tQIwiuwdoFv+Bu1qXpJZmu7ndn81wls8loHpd8bbqpmeJnTLkxk64do6IKVj+s8kwtQ1tCKmi0C483I5ZfSvFmIvyYTYcZixw1rDUzS+O1UsA+EIji9YnkFIuiTIEPg3N1sZGN+JqwevkFrIPIt67ybd3ffj1ZPFgwOkyTdbigp2nQTtmQZkeBElPzLJgp5tFO7fKJuazxByTpervXFg0P0F81OYtocQxXwiQSvRUTw6FnhV/8X6BYKJM4p7KicpxG08ouc2AvemIjS56NHZK0SF7ZELB1E0d4r+TLhz1uZZ+4OYPEh+Q5TdpSb8/YN+LqrDOezDY4fuwlZ/g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5658.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(55016002)(4744005)(82960400001)(4326008)(7696005)(38070700005)(38100700002)(9686003)(6916009)(26005)(52536014)(2906002)(66946007)(6506007)(66446008)(64756008)(66556008)(7416002)(66476007)(76116006)(83380400001)(33656002)(508600001)(8936002)(8676002)(5660300002)(186003)(54906003)(316002)(86362001)(71200400001)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Za+kyViE4Q2PO7wQ/EWxmP+4X9EuLn2WpBgJNepPURzplyfBYoIZVjf/X+AA?=
 =?us-ascii?Q?NUDMzDf63p+3Mumkhff2A5JCspXC8kiwMvp4W0BQyfbOn6ZtwbP4fTDtklZ3?=
 =?us-ascii?Q?LbCQ66h2TTzW9V/GxkH+De+HAdxPSdDCtWrPclKbWOV6cCAWABz/AaQJBm2e?=
 =?us-ascii?Q?XDEoM92LD4koYVH+P+cqcgur0VKGYmLaV6+N1hMrMEOOWk1nzptu5uF7fIdz?=
 =?us-ascii?Q?BZtONbWRnH+qK1+OWb+o14R4kPqwo2KajbkSt8n+FErr/KxlDAqlEi1jndZK?=
 =?us-ascii?Q?VO9JNPyNknMrM2jT+7HS/vpGngrf1cxEIZZdqTm6dTy9ldIfyj4p4ZY5UCCL?=
 =?us-ascii?Q?tGJ2omC3aRFC9Y63IxAgOZ8D2PtDKSHmmjKEss+Jf029sbn8/Bm2aU0qIrDS?=
 =?us-ascii?Q?DgWDniiUiSBzNltNcXYSbUPBbR0Z8Uhm3jiuLBhMwQ7MiHS0pjlYiqX3qK8L?=
 =?us-ascii?Q?3rqcjQL2nIKgCZgmnS+HEFzHU+heUFcwigLCwooi3vz4At5liX5Fg4TFjnGc?=
 =?us-ascii?Q?yE73pxRAOK6dqR4NJPFwN6OTs6ODBkGcAH3Tt9da4tXFDabWKwa+QbwEo2ZB?=
 =?us-ascii?Q?jxHybn+6fEQqT+SPvAINF954/2+CdFedTMyT+PwBKuFSI36XMIZTkvG1nrJu?=
 =?us-ascii?Q?3bpBoYjpYjBGB+0DKznImYm5AeEW56sKvSZJ6hdNrqz607yVC4RJnqSEy6KC?=
 =?us-ascii?Q?w8ejwBcnszNUfIYCxymLxS8LJ8SIuPHpSXng8p85ixMj2LZ4VTAtSlgaLflW?=
 =?us-ascii?Q?znr5aaQp+Ko0BwWzxbJYpzawu7Rk3AtcApAuaqm5DHwEmQE6Bu9TwStXBCBd?=
 =?us-ascii?Q?18YLZHoJ2jiGfSrjQFkY8J4M0EPtYf4mL2cdMRAYc53er0Ap0bRdrBxSATt1?=
 =?us-ascii?Q?Icm5ueWxEbXfKurSw/PdFSx0RkxnzwSlEjX+XZsCyeIsgWEMFSZGAAZ6tLdZ?=
 =?us-ascii?Q?Djf9KoaZUKQm5k/wfhJlhoLzS2SfQo1gc9+nt9WZZdyNLWK/Af3JKMJS2rbF?=
 =?us-ascii?Q?Y6iFU0if17TId6+xgG9Q1koRqWyEAbrTI/13IdBgvsKKeyqSm42QQ1MsvTsL?=
 =?us-ascii?Q?tT04btCtiiQCM/C9vIrZrmFiP+B18uXCqZ2RfTixR+pHGUayX5SDm57SQUUz?=
 =?us-ascii?Q?BVhYeMespCkuACt79jbhCumx78AwKF/RqlY5QRoiJJPBoCJdWOwIcAE5VkoG?=
 =?us-ascii?Q?RVHML3Mamn/QecUZHBiJyYdQF75LGM7sKOtUHs7SkOz0KRu9EoQiHJJexD8/?=
 =?us-ascii?Q?ajTN7vA8d+Klc12Yvm21tZCjWX8glXchJ34ynwW9FGzpWHKoh2g16ilF5KUu?=
 =?us-ascii?Q?qUeEegSBfS0gfZfvmjCwdTD9?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85465cb4-c712-420b-1baa-08d993c6b4e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 12:39:49.4970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Uhy+8jY9ubPY18tFWWBp+cwtRR+mXwWEQQoQCycs0awK8maZ7ynz8abX7e0sA8S4vL1ZYMa5exUR4Z+FjC+4lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5593
X-OriginatorOrg: intel.com
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kwankhede@nvidia.com" <kwankhede@nvidia.com>, "hch@lst.de" <hch@lst.de>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Jiang,
 Dave" <dave.jiang@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "corbet@lwn.net" <corbet@lwn.net>, "jgg@nvidia.com" <jgg@nvidia.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, "parav@mellanox.com" <parav@mellanox.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "lkml@metux.net" <lkml@metux.net>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lushenming@huawei.com" <lushenming@huawei.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>
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

> From: David Gibson <david@gibson.dropbear.id.au>
> Sent: Wednesday, September 29, 2021 10:09 AM
> 
> On Sun, Sep 19, 2021 at 02:38:30PM +0800, Liu Yi L wrote:
> > This patch introduces a new interface (/dev/vfio/devices/$DEVICE) for
> > userspace to directly open a vfio device w/o relying on container/group
> > (/dev/vfio/$GROUP). Anything related to group is now hidden behind
> > iommufd (more specifically in iommu core by this RFC) in a device-centric
> > manner.
> >
> > In case a device is exposed in both legacy and new interfaces (see next
> > patch for how to decide it), this patch also ensures that when the device
> > is already opened via one interface then the other one must be blocked.
> >
> > Signed-off-by: Liu Yi L <yi.l.liu@intel.com>
> [snip]
> 
> > +static bool vfio_device_in_container(struct vfio_device *device)
> > +{
> > +	return !!(device->group && device->group->container);
> 
> You don't need !! here.  && is already a logical operation, so returns
> a valid bool.

got it. thanks.

Regards,
Yi Liu

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
