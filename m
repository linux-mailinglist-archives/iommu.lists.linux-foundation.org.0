Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3D221B5C3
	for <lists.iommu@lfdr.de>; Fri, 10 Jul 2020 15:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 90FDA29476;
	Fri, 10 Jul 2020 13:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IAxtGj2WPwNr; Fri, 10 Jul 2020 13:03:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 28E902049A;
	Fri, 10 Jul 2020 13:03:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 11377C016F;
	Fri, 10 Jul 2020 13:03:10 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D4A7C016F
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 13:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5BA4987E49
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 13:03:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dj0PF11ByWDh for <iommu@lists.linux-foundation.org>;
 Fri, 10 Jul 2020 13:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id ECE8187E2E
 for <iommu@lists.linux-foundation.org>; Fri, 10 Jul 2020 13:03:07 +0000 (UTC)
IronPort-SDR: r8hhUZ8G0W6errQWOMn/wi6d4yREnhCcTrgT2ziNbJz1Wl3+tG4wKNDJ5OND14e78p3Bb26ZX5
 pXfsuEQBBaew==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="213076661"
X-IronPort-AV: E=Sophos;i="5.75,335,1589266800"; d="scan'208";a="213076661"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2020 06:03:06 -0700
IronPort-SDR: Ad9WB9iMZ2mq+eWGxbeLkVTRXDzx78TB5mDNpsuyrEIEzxx38Ubvl+BfCK36SEX5x3agSZTf8T
 yJpo6evtZobQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,335,1589266800"; d="scan'208";a="323540997"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2020 06:03:06 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 10 Jul 2020 06:03:06 -0700
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 10 Jul 2020 06:03:06 -0700
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.50) by
 edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
 (TLS) id 14.3.439.0; Fri, 10 Jul 2020 06:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cwZG3T6AXiIluWQZwL3Uw0rCHQUqeGASh5Wc03GtwV6oMReiCLAMuSfY+H1c0QWQCUS5jR7SWDVigibyBfE03mVWFyqdSGf/eha7RjewPgHIP60ekkyI41hYJjROLHRMKRfAhJ43NXALic1Za/hwnl7uj4b5TnSVQg725ATOepuGnFmL0fJ4CrLajY+SOnMUqwo5HHbrqqFAJ+MvCsPgZmsnHY0C5hdY0idY9/em48f1dWoxqcgMYolqLu31QW2fF+IBkI3RJGpSLkhXZN8t3QeiNangXyoTqRQcchSROdOJOrEiuZp3aKVgrVP0L5DuGNBXR1WANJrGMsUXAoDzLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aveOQeU0/y9EyLb4Vtzl3wSeC6giGldMyfnC8L0D1eY=;
 b=NOyUFFPD5KsKCnaT12eNGx+1ER/mo9u4OozdFrpVoO9IWhw7MaJvyJ5WdhuZRZxo33Tve9ma0gkDwD+d4Nzu9WqHORWwjOmWYVxMwe/YZthvtMCrPgvU4l+WSxRf8+kPhndJtHZSvYTf5UD4q0Lwxk71yGDkTZOK9v/g/d/hOHDn4HcIhM/dlPIHe9Hqx6Wsv+Myth95mIY7rxfpgKpBgJcx+QHLQIB2sMfonMhGvtoC4x45aEfdl/U9+RcedWEg36sqt02s8l5t8Pmcb3EZUFWSiT3GG3jUV5WAa42iN6sJrbxBvugNm3sg5a7oCd74OzzbA6fYljc7+XcikulRpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aveOQeU0/y9EyLb4Vtzl3wSeC6giGldMyfnC8L0D1eY=;
 b=q51Fyo698moz+ZSm92fI7/j08JmYwiFfZez36n0IlnPzHWhNXjlQobcKw/PAR06pZ3xCFREj7K1ZSIvEn6EmWH1uoSp8Kixn7T59hbd/wSfLpuZcZGwI21/LY6rOPWKPRLkOVYJaGcKmOTCLnIURkQMceDwuYWHffo9wsMrNzYk=
Received: from DM5PR11MB1435.namprd11.prod.outlook.com (2603:10b6:4:7::18) by
 DM5PR11MB0025.namprd11.prod.outlook.com (2603:10b6:4:63::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3153.22; Fri, 10 Jul 2020 13:03:04 +0000
Received: from DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364]) by DM5PR11MB1435.namprd11.prod.outlook.com
 ([fe80::9002:97a2:d8c0:8364%10]) with mapi id 15.20.3174.023; Fri, 10 Jul
 2020 13:03:04 +0000
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: RE: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Topic: [PATCH v3 06/14] vfio/type1: Add VFIO_IOMMU_PASID_REQUEST
 (alloc/free)
Thread-Index: AQHWSgRRzB2G/Oy5QEmxCHQWFS0FB6j02KQAgACUCyCAB/5SUIAAxDYAgABLnwCAABmKAIAAAO4wgAAFFYCAAAD78IAASzDwgAB/qYCAAOQrQIAAlDkAgAACCBA=
Date: Fri, 10 Jul 2020 13:03:03 +0000
Message-ID: <DM5PR11MB1435D0686B10A833A2687515C3650@DM5PR11MB1435.namprd11.prod.outlook.com>
References: <1592988927-48009-1-git-send-email-yi.l.liu@intel.com>
 <1592988927-48009-7-git-send-email-yi.l.liu@intel.com>
 <20200702151832.048b44d1@x1.home>
 <CY4PR11MB1432DD97F44EB8AA5CCC87D8C36A0@CY4PR11MB1432.namprd11.prod.outlook.com>
 <DM5PR11MB1435B159DA10C8301B89A6F0C3670@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20200708135444.4eac48a4@x1.home>
 <DM5PR11MB14358A8797E3C02E50B37FFEC3640@DM5PR11MB1435.namprd11.prod.outlook.com>
 <MWHPR11MB16456D12135AA36BA16CE4208C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR11MB14357DC99EFCDE7E02944E2EC3640@DM5PR11MB1435.namprd11.prod.outlook.com>
 <MWHPR11MB1645F822D9267005AE5BCE528C640@MWHPR11MB1645.namprd11.prod.outlook.com>
 <DM5PR11MB143577F0C21EDB82B82EEB35C3640@DM5PR11MB1435.namprd11.prod.outlook.com>
 <DM5PR11MB143584D5A0AAE13E0D2D04B7C3640@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20200709082751.320742ab@x1.home>
 <DM5PR11MB1435AA0A724D4A59B56E8CA8C3650@DM5PR11MB1435.namprd11.prod.outlook.com>
 <20200710065500.2478db37@x1.home>
In-Reply-To: <20200710065500.2478db37@x1.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.38]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b6f97b9f-499f-4768-1216-08d824d1952d
x-ms-traffictypediagnostic: DM5PR11MB0025:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR11MB0025CC13059CBCF01BD6BEB6C3650@DM5PR11MB0025.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 046060344D
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LCZxVCRup5N41Sxf4BTFzbxdshdBegFATQ8hB2BJwkOhjSwrTPnpqVfzHj5VR/7q29hxmF0uI6CnG1n3Xi6kqVJxQL49QtSfKIAtwcVgIUJSavllRxNqhb4up6KYqEjmMWy+r/S3W4IaNgeh7CHuUGVAnCaF4BFMZJJe13SQ8YV69OUp9USjLMsanjBeGF/bjvFl7GR8L+Kbs/Gt5+fnPjh0Z5Z14y0z6cci5c2E0/m90KVP/TOhmZaMJOR4rjIM0omzQ9I7OZxZ8QatDigZ8kGjhCa4WKdrhMDfLXZ8jjZ/T4Mu6g4H+goarfsGvRTIPXExg4fHKVRq6luAzhjdQg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1435.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(346002)(396003)(366004)(376002)(33656002)(2906002)(71200400001)(6916009)(26005)(6506007)(66946007)(8676002)(86362001)(30864003)(7696005)(52536014)(316002)(83380400001)(7416002)(54906003)(66446008)(64756008)(186003)(55016002)(5660300002)(66556008)(478600001)(66476007)(4326008)(8936002)(76116006)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: o7izvSx9xZKpUCztUHtOkOQ/QBUj+1fNnherLcHPXxMklR+OYGKgfMBw3rYX9kbHKKGqlf8jEpYeqtcNSKFXf1syYkg7UAXKDdLF6VuDwnnPbISDVshpDjsk40YOkFav2zyBQgVjJ2jrPt0yXfH8OVnwBN/2MwL10SSdnweqOpfZIMZbE4yTTfgjUhL+QRrFEy8r/1oniXe76QGiej0dfdoPMLS+IibJOg98om8+5m+Kte6DMqOZwl+M2tezudqxsoaRiwpCYWisIhiaFikuAKqwYRhFEIOt0sM0Rb1b6UNQqWBE4enK+CPRgFhP/xmWvkltddWR45d7wT6pwNBXrpX1bbWryfOM9WLQgCSJfgXVwhe+ncbc5pmBeZEu0bysWtZlLr/cGOnhKjZg6WahsNbGeFeidMzJnxBxa3QL4irD6bPH/xJ+yg0tBuE/knwAl8ubTv3x0rDBsmXb08K46DE4xgycdjUgxD949tcroiDbkip0SBP+qeeyGXvkflx5
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6f97b9f-499f-4768-1216-08d824d1952d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2020 13:03:03.9790 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J4rjXK8Wa+G/echB5hMfAcoOZr93WffZj+Pt08m+5QNH7jXV7zZ0X1lJ9Rzpe640q/iEUPGCMLxsltqy+gCSUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB0025
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

> From: Alex Williamson <alex.williamson@redhat.com>
> Sent: Friday, July 10, 2020 8:55 PM
> 
> On Fri, 10 Jul 2020 05:39:57 +0000
> "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> 
> > Hi Alex,
> >
> > > From: Alex Williamson <alex.williamson@redhat.com>
> > > Sent: Thursday, July 9, 2020 10:28 PM
> > >
> > > On Thu, 9 Jul 2020 07:16:31 +0000
> > > "Liu, Yi L" <yi.l.liu@intel.com> wrote:
> > >
> > > > Hi Alex,
> > > >
> > > > After more thinking, looks like adding a r-b tree is still not enough to
> > > > solve the potential problem for free a range of PASID in one ioctl. If
> > > > caller gives [0, MAX_UNIT] in the free request, kernel anyhow should
> > > > loop all the PASIDs and search in the r-b tree. Even VFIO can track the
> > > > smallest/largest allocated PASID, and limit the free range to an accurate
> > > > range, it is still no efficient. For example, user has allocated two PASIDs
> > > > ( 1 and 999), and user gives the [0, MAX_UNIT] range in free request. VFIO
> > > > will limit the free range to be [1, 999], but still needs to loop PASID 1 -
> > > > 999, and search in r-b tree.
> > >
> > > That sounds like a poor tree implementation.  Look at vfio_find_dma()
> > > for instance, it returns a node within the specified range.  If the
> > > tree has two nodes within the specified range we should never need to
> > > call a search function like vfio_find_dma() more than three times.  We
> > > call it once, get the first node, remove it.  Call it again, get the
> > > other node, remove it.  Call a third time, find no matches, we're done.
> > > So such an implementation limits searches to N+1 where N is the number
> > > of nodes within the range.
> >
> > I see. When getting a free range from user. Use the range to find suited
> > PASIDs in the r-b tree. For the example I mentioned, if giving [0, MAX_UNIT],
> > will find two nodes. If giving [0, 100] range, then only one node will be
> > found. But even though, it still take some time if the user holds a bunch
> > of PASIDs and user gives a big free range.
> 
> 
> But that time is bounded.  The complexity of the tree and maximum
> number of operations on the tree are bounded by the number of nodes,
> which is bound by the user's pasid quota.  Thanks,

yes, let me try it. thanks. :-)

Regards,
Yi Liu

> Alex
> 
> > > > So I'm wondering can we fall back to prior proposal which only free one
> > > > PASID for a free request. how about your opinion?
> > >
> > > Doesn't it still seem like it would be a useful user interface to have
> > > a mechanism to free all pasids, by calling with exactly [0, MAX_UINT]?
> > > I'm not sure if there's another use case for this given than the user
> > > doesn't have strict control of the pasid values they get.  Thanks,
> >
> > I don't have such use case neither. perhaps we may allow it in future by
> > adding flag. but if it's still useful, I may try with your suggestion. :-)
> >
> > Regards,
> > Yi Liu
> >
> > > Alex
> > >
> > > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > > Sent: Thursday, July 9, 2020 10:26 AM
> > > > >
> > > > > Hi Kevin,
> > > > >
> > > > > > From: Tian, Kevin <kevin.tian@intel.com>
> > > > > > Sent: Thursday, July 9, 2020 10:18 AM
> > > > > >
> > > > > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > > > > Sent: Thursday, July 9, 2020 10:08 AM
> > > > > > >
> > > > > > > Hi Kevin,
> > > > > > >
> > > > > > > > From: Tian, Kevin <kevin.tian@intel.com>
> > > > > > > > Sent: Thursday, July 9, 2020 9:57 AM
> > > > > > > >
> > > > > > > > > From: Liu, Yi L <yi.l.liu@intel.com>
> > > > > > > > > Sent: Thursday, July 9, 2020 8:32 AM
> > > > > > > > >
> > > > > > > > > Hi Alex,
> > > > > > > > >
> > > > > > > > > > Alex Williamson <alex.williamson@redhat.com>
> > > > > > > > > > Sent: Thursday, July 9, 2020 3:55 AM
> > > > > > > > > >
> > > > > > > > > > On Wed, 8 Jul 2020 08:16:16 +0000 "Liu, Yi L"
> > > > > > > > > > <yi.l.liu@intel.com> wrote:
> > > > > > > > > >
> > > > > > > > > > > Hi Alex,
> > > > > > > > > > >
> > > > > > > > > > > > From: Liu, Yi L < yi.l.liu@intel.com>
> > > > > > > > > > > > Sent: Friday, July 3, 2020 2:28 PM
> > > > > > > > > > > >
> > > > > > > > > > > > Hi Alex,
> > > > > > > > > > > >
> > > > > > > > > > > > > From: Alex Williamson <alex.williamson@redhat.com>
> > > > > > > > > > > > > Sent: Friday, July 3, 2020 5:19 AM
> > > > > > > > > > > > >
> > > > > > > > > > > > > On Wed, 24 Jun 2020 01:55:19 -0700 Liu Yi L
> > > > > > > > > > > > > <yi.l.liu@intel.com> wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > > This patch allows user space to request PASID
> > > > > > > > > > > > > > allocation/free,
> > > > > > > e.g.
> > > > > > > > > > > > > > when serving the request from the guest.
> > > > > > > > > > > > > >
> > > > > > > > > > > > > > PASIDs that are not freed by userspace are
> > > > > > > > > > > > > > automatically freed
> > > > > > > > > when
> > > > > > > > > > > > > > the IOASID set is destroyed when process exits.
> > > > > > > > > > > [...]
> > > > > > > > > > > > > > +static int vfio_iommu_type1_pasid_request(struct
> > > > > > > > > > > > > > +vfio_iommu
> > > > > > > > > *iommu,
> > > > > > > > > > > > > > +					  unsigned long
> arg) {
> > > > > > > > > > > > > > +	struct vfio_iommu_type1_pasid_request req;
> > > > > > > > > > > > > > +	unsigned long minsz;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	minsz = offsetofend(struct
> > > > > > vfio_iommu_type1_pasid_request,
> > > > > > > > > > range);
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	if (copy_from_user(&req, (void __user *)arg,
> minsz))
> > > > > > > > > > > > > > +		return -EFAULT;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	if (req.argsz < minsz || (req.flags &
> > > > > > > > > > ~VFIO_PASID_REQUEST_MASK))
> > > > > > > > > > > > > > +		return -EINVAL;
> > > > > > > > > > > > > > +
> > > > > > > > > > > > > > +	if (req.range.min > req.range.max)
> > > > > > > > > > > > >
> > > > > > > > > > > > > Is it exploitable that a user can spin the kernel for a
> > > > > > > > > > > > > long time in the case of a free by calling this with [0,
> > > > > > > > > > > > > MAX_UINT] regardless of their
> > > > > > > > > > actual
> > > > > > > > > > > > allocations?
> > > > > > > > > > > >
> > > > > > > > > > > > IOASID can ensure that user can only free the PASIDs
> > > > > > > > > > > > allocated to the
> > > > > > > > > user.
> > > > > > > > > > but
> > > > > > > > > > > > it's true, kernel needs to loop all the PASIDs within the
> > > > > > > > > > > > range provided by user.
> > > > > > > > > > it
> > > > > > > > > > > > may take a long time. is there anything we can do? one
> > > > > > > > > > > > thing may limit
> > > > > > > > > the
> > > > > > > > > > range
> > > > > > > > > > > > provided by user?
> > > > > > > > > > >
> > > > > > > > > > > thought about it more, we have per-VM pasid quota (say
> > > > > > > > > > > 1000), so even if user passed down [0, MAX_UNIT], kernel
> > > > > > > > > > > will only loop the
> > > > > > > > > > > 1000 pasids at most. do you think we still need to do something
> on
> > > it?
> > > > > > > > > >
> > > > > > > > > > How do you figure that?  vfio_iommu_type1_pasid_request()
> > > > > > > > > > accepts the user's min/max so long as (max > min) and passes
> > > > > > > > > > that to vfio_iommu_type1_pasid_free(), then to
> > > > > > > > > > vfio_pasid_free_range() which loops as:
> > > > > > > > > >
> > > > > > > > > > 	ioasid_t pasid = min;
> > > > > > > > > > 	for (; pasid <= max; pasid++)
> > > > > > > > > > 		ioasid_free(pasid);
> > > > > > > > > >
> > > > > > > > > > A user might only be able to allocate 1000 pasids, but
> > > > > > > > > > apparently they can ask to free all they want.
> > > > > > > > > >
> > > > > > > > > > It's also not obvious to me that calling ioasid_free() is only
> > > > > > > > > > allowing the user to free their own passid.  Does it?  It
> > > > > > > > > > would be a pretty
> > > > > > > >
> > > > > > > > Agree. I thought ioasid_free should at least carry a token since
> > > > > > > > the user
> > > > > > > space is
> > > > > > > > only allowed to manage PASIDs in its own set...
> > > > > > > >
> > > > > > > > > > gaping hole if a user could free arbitrary pasids.  A r-b tree
> > > > > > > > > > of passids might help both for security and to bound spinning in a
> > > loop.
> > > > > > > > >
> > > > > > > > > oh, yes. BTW. instead of r-b tree in VFIO, maybe we can add an
> > > > > > > > > ioasid_set parameter for ioasid_free(), thus to prevent the user
> > > > > > > > > from freeing PASIDs that doesn't belong to it. I remember Jacob
> > > > > > > > > mentioned it
> > > > > > > before.
> > > > > > > > >
> > > > > > > >
> > > > > > > > check current ioasid_free:
> > > > > > > >
> > > > > > > >         spin_lock(&ioasid_allocator_lock);
> > > > > > > >         ioasid_data = xa_load(&active_allocator->xa, ioasid);
> > > > > > > >         if (!ioasid_data) {
> > > > > > > >                 pr_err("Trying to free unknown IOASID %u\n", ioasid);
> > > > > > > >                 goto exit_unlock;
> > > > > > > >         }
> > > > > > > >
> > > > > > > > Allow an user to trigger above lock paths with MAX_UINT times
> > > > > > > > might still
> > > > > > > be bad.
> > > > > > >
> > > > > > > yeah, how about the below two options:
> > > > > > >
> > > > > > > - comparing the max - min with the quota before calling ioasid_free().
> > > > > > >   If max - min > current quota of the user, then should fail it. If
> > > > > > >   max - min < quota, then call ioasid_free() one by one. still trigger
> > > > > > >   the above lock path with quota times.
> > > > > >
> > > > > > This is definitely wrong. [min, max] is about the range of the PASID
> > > > > > value, while quota is about the number of allocated PASIDs. It's a bit
> > > > > > weird to mix two together.
> > > > >
> > > > > got it.
> > > > >
> > > > > > btw what is the main purpose of allowing batch PASID free requests?
> > > > > > Can we just simplify to allow one PASID in each free just like how is
> > > > > > it done in allocation path?
> > > > >
> > > > > it's an intention to reuse the [min, max] range as allocation path. currently,
> > > we
> > > > > don't have such request as far as I can see.
> > > > >
> > > > > > >
> > > > > > > - pass the max and min to ioasid_free(), let ioasid_free() decide.
> should
> > > > > > >   be able to avoid trigger the lock multiple times, and ioasid has have a
> > > > > > >   track on how may PASIDs have been allocated, if max - min is larger
> than
> > > > > > >   the allocated number, should fail anyway.
> > > > > >
> > > > > > What about Alex's r-b tree suggestion? Is there any downside in you
> mind?
> > > > >
> > > > > no downside, I was just wanting to reuse the tracks in ioasid_set. I can add
> a
> > > r-b
> > > > > for allocated PASIDs and find the PASIDs in the r-b tree only do free for
> the
> > > > > PASIDs found in r-b tree, others in the range would be ignored.
> > > > > does it look good?
> > > > >
> > > > > Regards,
> > > > > Yi Liu
> > > > >
> > > > > > Thanks,
> > > > > > Kevin
> > > >
> >

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
