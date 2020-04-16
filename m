Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4F71AC269
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 15:28:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 806F583365;
	Thu, 16 Apr 2020 13:28:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5eQfs9EviqGP; Thu, 16 Apr 2020 13:28:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F3FA682835;
	Thu, 16 Apr 2020 13:28:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D1224C0172;
	Thu, 16 Apr 2020 13:28:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 149D9C0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 13:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id F108687E9C
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 13:28:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9ZAzgWrgNBca for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 13:28:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by hemlock.osuosl.org (Postfix) with ESMTPS id EA27787C88
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 13:28:44 +0000 (UTC)
IronPort-SDR: SR9eNHynhR0/l9NoFYynkd9ByEcBt8VujjF9WFKgJt7uSutchJ15L+A87HafhJudlO7MY60Chy
 hvrgH+BeubNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 06:28:44 -0700
IronPort-SDR: hCh7AzQtuis5XzjRp/Va1DylvUrD4N93ZNPeTBW6dLIM0g6L3tJeUWHmmKVyRpePbJF+LpKbz7
 YIHrBxwoVq3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,391,1580803200"; d="scan'208";a="299303786"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by FMSMGA003.fm.intel.com with ESMTP; 16 Apr 2020 06:28:43 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 06:28:44 -0700
Received: from shsmsx151.ccr.corp.intel.com (10.239.6.50) by
 FMSMSX102.amr.corp.intel.com (10.18.124.200) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Apr 2020 06:28:43 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX151.ccr.corp.intel.com ([169.254.3.22]) with mapi id 14.03.0439.000;
 Thu, 16 Apr 2020 21:28:41 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Auger Eric <eric.auger@redhat.com>, "Liu, Yi L" <yi.l.liu@intel.com>,
 "Alex Williamson" <alex.williamson@redhat.com>
Subject: RE: [PATCH v1 7/8] vfio/type1: Add VFIO_IOMMU_CACHE_INVALIDATE
Thread-Topic: [PATCH v1 7/8] vfio/type1: Add VFIO_IOMMU_CACHE_INVALIDATE
Thread-Index: AQHWAEUdbUtKvEWiiEiZu1SnRvWegKhl0sQAgAEuFaCAABNDAIAUHAOAgACdTsD//4TxAIAAkflQ
Date: Thu, 16 Apr 2020 13:28:41 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D823543@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-8-git-send-email-yi.l.liu@intel.com>
 <20200402142428.2901432e@w520.home>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D807C4A@SHSMSX104.ccr.corp.intel.com>
 <20200403093436.094b1928@w520.home>
 <A2975661238FB949B60364EF0F2C25743A231BAA@SHSMSX104.ccr.corp.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D82336C@SHSMSX104.ccr.corp.intel.com>
 <7d13bdbb-e972-c301-0970-90f63ecf69fc@redhat.com>
In-Reply-To: <7d13bdbb-e972-c301-0970-90f63ecf69fc@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "jean-philippe@linaro.org" <jean-philippe@linaro.org>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "Tian, Jun J" <jun.j.tian@intel.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

> From: Auger Eric <eric.auger@redhat.com>
> Sent: Thursday, April 16, 2020 8:43 PM
> 
> Hi Kevin,
> On 4/16/20 2:09 PM, Tian, Kevin wrote:
> >> From: Liu, Yi L <yi.l.liu@intel.com>
> >> Sent: Thursday, April 16, 2020 6:40 PM
> >>
> >> Hi Alex,
> >> Still have a direction question with you. Better get agreement with you
> >> before heading forward.
> >>
> >>> From: Alex Williamson <alex.williamson@redhat.com>
> >>> Sent: Friday, April 3, 2020 11:35 PM
> >> [...]
> >>>>>> + *
> >>>>>> + * returns: 0 on success, -errno on failure.
> >>>>>> + */
> >>>>>> +struct vfio_iommu_type1_cache_invalidate {
> >>>>>> +	__u32   argsz;
> >>>>>> +	__u32   flags;
> >>>>>> +	struct	iommu_cache_invalidate_info cache_info;
> >>>>>> +};
> >>>>>> +#define VFIO_IOMMU_CACHE_INVALIDATE      _IO(VFIO_TYPE,
> >>> VFIO_BASE
> >>>>> + 24)
> >>>>>
> >>>>> The future extension capabilities of this ioctl worry me, I wonder if
> >>>>> we should do another data[] with flag defining that data as
> >> CACHE_INFO.
> >>>>
> >>>> Can you elaborate? Does it mean with this way we don't rely on iommu
> >>>> driver to provide version_to_size conversion and instead we just pass
> >>>> data[] to iommu driver for further audit?
> >>>
> >>> No, my concern is that this ioctl has a single function, strictly tied
> >>> to the iommu uapi.  If we replace cache_info with data[] then we can
> >>> define a flag to specify that data[] is struct
> >>> iommu_cache_invalidate_info, and if we need to, a different flag to
> >>> identify data[] as something else.  For example if we get stuck
> >>> expanding cache_info to meet new demands and develop a new uapi to
> >>> solve that, how would we expand this ioctl to support it rather than
> >>> also create a new ioctl?  There's also a trade-off in making the ioctl
> >>> usage more difficult for the user.  I'd still expect the vfio layer to
> >>> check the flag and interpret data[] as indicated by the flag rather
> >>> than just passing a blob of opaque data to the iommu layer though.
> >>> Thanks,
> >>
> >> Based on your comments about defining a single ioctl and a unified
> >> vfio structure (with a @data[] field) for pasid_alloc/free, bind/
> >> unbind_gpasid, cache_inv. After some offline trying, I think it would
> >> be good for bind/unbind_gpasid and cache_inv as both of them use the
> >> iommu uapi definition. While the pasid alloc/free operation doesn't.
> >> It would be weird to put all of them together. So pasid alloc/free
> >> may have a separate ioctl. It would look as below. Does this direction
> >> look good per your opinion?
> >>
> >> ioctl #22: VFIO_IOMMU_PASID_REQUEST
> >> /**
> >>   * @pasid: used to return the pasid alloc result when flags ==
> ALLOC_PASID
> >>   *         specify a pasid to be freed when flags == FREE_PASID
> >>   * @range: specify the allocation range when flags == ALLOC_PASID
> >>   */
> >> struct vfio_iommu_pasid_request {
> >> 	__u32	argsz;
> >> #define VFIO_IOMMU_ALLOC_PASID	(1 << 0)
> >> #define VFIO_IOMMU_FREE_PASID	(1 << 1)
> >> 	__u32	flags;
> >> 	__u32	pasid;
> >> 	struct {
> >> 		__u32	min;
> >> 		__u32	max;
> >> 	} range;
> >> };
> >>
> >> ioctl #23: VFIO_IOMMU_NESTING_OP
> >> struct vfio_iommu_type1_nesting_op {
> >> 	__u32	argsz;
> >> 	__u32	flags;
> >> 	__u32	op;
> >> 	__u8	data[];
> >> };
> >>
> >> /* Nesting Ops */
> >> #define VFIO_IOMMU_NESTING_OP_BIND_PGTBL        0
> >> #define VFIO_IOMMU_NESTING_OP_UNBIND_PGTBL      1
> >> #define VFIO_IOMMU_NESTING_OP_CACHE_INVLD       2
> >>
> >
> > Then why cannot we just put PASID into the header since the
> > majority of nested usage is associated with a pasid?
> >
> > ioctl #23: VFIO_IOMMU_NESTING_OP
> > struct vfio_iommu_type1_nesting_op {
> > 	__u32	argsz;
> > 	__u32	flags;
> > 	__u32	op;
> > 	__u32   pasid;
> > 	__u8	data[];
> > };
> >
> > In case of SMMUv2 which supports nested w/o PASID, this field can
> > be ignored for that specific case.
> On my side I would prefer keeping the pasid in the data[]. This is not
> always used.
> 
> For instance, in iommu_cache_invalidate_info/iommu_inv_pasid_info we
> devised flags to tell whether the PASID is used.
> 

But don't we include a PASID in both invalidate structures already?

struct iommu_inv_addr_info {
#define IOMMU_INV_ADDR_FLAGS_PASID      (1 << 0)
#define IOMMU_INV_ADDR_FLAGS_ARCHID     (1 << 1)
#define IOMMU_INV_ADDR_FLAGS_LEAF       (1 << 2)
        __u32   flags;
        __u32   archid;
        __u64   pasid;
        __u64   addr;
        __u64   granule_size;
        __u64   nb_granules;
};

struct iommu_inv_pasid_info {
#define IOMMU_INV_PASID_FLAGS_PASID     (1 << 0)
#define IOMMU_INV_PASID_FLAGS_ARCHID    (1 << 1)
        __u32   flags;
        __u32   archid;
        __u64   pasid;
};

then consolidating the pasid field into generic header doesn't
hurt. the specific handler still rely on flags to tell whether it
is used?

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
