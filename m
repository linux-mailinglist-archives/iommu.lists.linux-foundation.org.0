Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id E5283219527
	for <lists.iommu@lfdr.de>; Thu,  9 Jul 2020 02:33:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 48E10220C5;
	Thu,  9 Jul 2020 00:33:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ag7hOCrt+ZIq; Thu,  9 Jul 2020 00:33:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0DA7221FFB;
	Thu,  9 Jul 2020 00:33:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E11B2C016F;
	Thu,  9 Jul 2020 00:33:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1B6BC077B
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:33:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id CB1608506A
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:32:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oOPzsysOSJgu for <iommu@lists.linux-foundation.org>;
 Thu,  9 Jul 2020 00:32:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1007785008
 for <iommu@lists.linux-foundation.org>; Thu,  9 Jul 2020 00:32:33 +0000 (UTC)
IronPort-SDR: EEYBuXaHUkaTuPQDpI5FHHHblVpLoL4PCtNvRFlmZrU8uz50Kly7v4FrQcLGNELRCSX2mAwJkd
 nHo2kTdtmMJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9676"; a="209448544"
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="209448544"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2020 17:32:32 -0700
IronPort-SDR: BaUwxieJGuqUwT8PtO+JuM2JjifaRRJ8x5siHuOqVfCjZCcM8si5DUiw/qJ/I/w8gI431nTMOv
 VyltOKLssHyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,329,1589266800"; d="scan'208";a="297889269"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by orsmga002.jf.intel.com with ESMTP; 08 Jul 2020 17:32:32 -0700
Received: from fmsmsx123.amr.corp.intel.com (10.18.125.38) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Jul 2020 17:32:29 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx123.amr.corp.intel.com (10.18.125.38) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 8 Jul 2020 17:32:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Wed, 8 Jul 2020 17:32:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICsWRKYZzrJahS5Ua5VeBob4Lb1mLHFTcPA161n9XsS/rQDTVe88KkGMqeN/HALEJbWY1ktlTVIX+sZnyxO+uR6Iu81v3eFrX1HxFMZWMAHIz5o7tkPPWbQhPALjvprpIt6IYmnb8IeAVTSwmBxc12WGUztfWB21/vnWWQxVSXAtOfOJMuMB6e/TDKm7uea0oY/rNheWvVs3QkzeH2aH7ECQDoaM1wDK7imKgM9r0/tEniwRnROA/HKTANEN6n7+KKUB5binbnpaBcyYvCc4l/IiIiWxydCzQnw5oQCZUh68McziB+W1F0jHwY3dbIWp4GIjLZsqTUqxyE5HaFf/lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6AwG8tJAesQ/Esu1JRKsY3eI0ikWGIJ2b+XgOeEZ2M=;
 b=RG+PVyO3BUAZJAuLo+pqWhoPWShGCh2exWkf8qWzYzTni740ZN+gSAy+PmmiXdU1KfHuMl1CDXuU4YbKY7ViZXMc2DzkhOtvFwv9rQnNqv9Ql4ZVGLSvHYPj0QQ5Ehy7oNg2+jWzBwToYHi2R3ZeiCkfMHye+hB7tlJHc/dmzpYCC86Pgdwh1uc+whXfOp/iw4tIkcQ85dhWu//fYCZRzeFL8XejI8J6T5D1XddbKTtxrHkf5A1gs7lLM7LgeRCFVrkjPd2TT6B3KYbs3eRV/bnWMApfAifeQYW4V2ubrUsZG9Yt9FTIazsmKBHO4Dcu++32Ip1nTQnfPHqMstExXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+6AwG8tJAesQ/Esu1JRKsY3eI0ikWGIJ2b+XgOeEZ2M=;
 b=upwa+K4Oz2rt071lAAefxk1h4+dZQfY7lcncpx6hon20Bnf5uFFxyMegd7+1L/auLTjPImcf1E2IX9DFLeglUAqgWpnwwOorEAF0CsF5fkwdjSR+hWx4akjYwIo7E16jAxn5yMqupIkdWDlx/SqzrWGHJXXFSAEv+yomGKUZ9Eg=
Received: from DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) by
 DM6PR11MB4201.namprd11.prod.outlook.com (2603:10b6:5:200::33) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.20; Thu, 9 Jul 2020 00:32:27 +0000
Received: from DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364]) by DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364%10]) with mapi id 15.20.3174.021; Thu, 9 Jul 2020
 00:32:27 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>
Subject: RE: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Topic: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Index: AQHWSgRRzB2G/Oy5QEmxCHQWFS0FB6j02KQAgACUCyCAB/5SUIAAxDYAgABLnwA=
Date: Thu, 9 Jul 2020 00:32:27 +0000
Message-ID: <DM5PR11MB14358A8797E3C02E50B37FFEC3640@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1592988927-48009-1-git-send-email-yi.l.liu@intel.com>
 <1592988927-48009-7-git-send-email-yi.l.liu@intel.com>
 <20200702151832.048b44d1@x1.home>
 <CY4PR11MB1432DD97F44EB8AA5CCC87D8C36A0@CY4PR11MB1432.namprd11.prod.outlook.com>
 <DM5PR11MB1435B159DA10C8301B89A6F0C3670@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20200708135444.4eac48a4@x1.home>
In-Reply-To: <20200708135444.4eac48a4@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [117.169.230.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db8bf2f3-3cef-4357-9a45-08d8239f8e8c
x-ms-traffictypediagnostic: DM6PR11MB4201:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4201875888E394293263A056C3640@DM6PR11MB4201.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A1ET7/XyJyfwUOxfH+0I6JhTpYCIRkrX4SDBRFeCbZU97EuBQLid0kQOYM06sVvTLHfV7JzmEbPmrBJiEEsEPgtcurRhxa/C6KJPrbPgbWLaInMJshTHK48YcO2ALsz0tnBSHTWaMd4nILtw7jFkVCjooU5YMh6S8tZ0GN6IeeHjNNTdsmJbqP05LyOZA12qBG4Rg+iXPCoc1jISo31LiHfFyH03PPkhcLtVNTtZIunMu3uzdw1P7LYqb3Mc2BVeOXd+Q45bn/fHymWrA03DRTfttYaVlY4PuFMwD/+7QIkzf1o/jUZraja2OnAbWlDm7sTU/2F08dsYPluyBeYLow==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1435.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(26005)(33656002)(8676002)(316002)(71200400001)(8936002)(478600001)(66556008)(66476007)(66946007)(64756008)(76116006)(66446008)(5660300002)(52536014)(186003)(4326008)(110136005)(7416002)(54906003)(55016002)(9686003)(83380400001)(7696005)(86362001)(2906002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: 3bpw7ou1zzrTkaaNNFk6SAUFq6iJgaa5L3RqgFim+eSNYlbf5BuWBmVAvdCvO/1wUSDVK97yC1izKOFIRoskCFwycXUaonCLGkSE3aYxn99hYXU7HnJB9qAKwN/MbRZnY8c5Bm+svE6rLEij1b4dPdZti3dFt9MR1aUb6QmYSsoHZWl33B1tysNAddjh1nGr0QGIbzGVg9GT2HPw+CD4+Db+BfYnYUZgg33/P0x4001PiKqunK6Zle+kr3oEvb1J1f5NnLH9RGT+qpI4qhWKNNcLIksg3vNesc0X/38wkbso2WkIM3Qs6En74aatmvMiWqIGouSiSzB2kNrYhDEy4H5emQc15C6ESuK6bbI39TKexX/RGtZTHusd58QHFdKGQzp+c7ZHX4C++55ddvglKzw64ANumw/aqvi51bXHxbyKIjf2+N456wJqyEkgf2nvoef++0KULO1M8X6XJLtPosZ92mIPJlBlKpBjzHFAw2HU5jOWb3jq04gGD7iGoy9G
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8bf2f3-3cef-4357-9a45-08d8239f8e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 00:32:27.0516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +4geHyDl5JmQHtp61P7TQWso4n9e7E5Z++IMrQB+6cBmjCl1UvFeLQdJw6BiKjZ/uwgWebgQNB+WryQH+N8KPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4201
X-OriginatorOrg: intel.com
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>, "Tian,
 Jun J" <jun.j.tian@intel.com>
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

Hi Alex,

> Alex Williamson <alex.williamson@redhat.com>
> Sent: Thursday, July 9, 2020 3:55 AM
> 
> On Wed, 8 Jul 2020 08:16:16 +0000
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> 
> > Hi Alex,
> >
> > > From: Liu, Yi L < yi.l.liu@intel.com>
> > > Sent: Friday, July 3, 2020 2:28 PM
> > >
> > > Hi Alex,
> > >
> > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > Sent: Friday, July 3, 2020 5:19 AM
> > > >
> > > > On Wed, 24 Jun 2020 01:55:19 -0700
> > > > Liu Yi L <yi.l.liu@intel.com> wrote:
> > > >
> > > > > This patch allows user space to request PASID allocation/free, e.g.
> > > > > when serving the request from the guest.
> > > > >
> > > > > PASIDs that are not freed by userspace are automatically freed when
> > > > > the IOASID set is destroyed when process exits.
> > [...]
> > > > > +static int vfio_iommu_type1_pasid_request(struct vfio_iommu *iommu,
> > > > > +					  unsigned long arg)
> > > > > +{
> > > > > +	struct vfio_iommu_type1_pasid_request req;
> > > > > +	unsigned long minsz;
> > > > > +
> > > > > +	minsz = offsetofend(struct vfio_iommu_type1_pasid_request,
> range);
> > > > > +
> > > > > +	if (copy_from_user(&req, (void __user *)arg, minsz))
> > > > > +		return -EFAULT;
> > > > > +
> > > > > +	if (req.argsz < minsz || (req.flags &
> ~VFIO_PASID_REQUEST_MASK))
> > > > > +		return -EINVAL;
> > > > > +
> > > > > +	if (req.range.min > req.range.max)
> > > >
> > > > Is it exploitable that a user can spin the kernel for a long time in
> > > > the case of a free by calling this with [0, MAX_UINT] regardless of their
> actual
> > > allocations?
> > >
> > > IOASID can ensure that user can only free the PASIDs allocated to the user.
> but
> > > it's true, kernel needs to loop all the PASIDs within the range provided
> > > by user.
> it
> > > may take a long time. is there anything we can do? one thing may limit the
> range
> > > provided by user?
> >
> > thought about it more, we have per-VM pasid quota (say 1000), so even if
> > user passed down [0, MAX_UNIT], kernel will only loop the 1000 pasids at
> > most. do you think we still need to do something on it?
> 
> How do you figure that?  vfio_iommu_type1_pasid_request() accepts the
> user's min/max so long as (max > min) and passes that to
> vfio_iommu_type1_pasid_free(), then to vfio_pasid_free_range()  which
> loops as:
> 
> 	ioasid_t pasid = min;
> 	for (; pasid <= max; pasid++)
> 		ioasid_free(pasid);
> 
> A user might only be able to allocate 1000 pasids, but apparently they
> can ask to free all they want.
> 
> It's also not obvious to me that calling ioasid_free() is only allowing
> the user to free their own passid.  Does it?  It would be a pretty
> gaping hole if a user could free arbitrary pasids.  A r-b tree of
> passids might help both for security and to bound spinning in a loop.

oh, yes. BTW. instead of r-b tree in VFIO, maybe we can add an ioasid_set
parameter for ioasid_free(), thus to prevent the user from freeing PASIDs
that doesn't belong to it. I remember Jacob mentioned it before.

@Jacob, is it still in your plan?

Regards,
Yi Liu

> Thanks,
> 
> Alex

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
