Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5C81AE8AE
	for <lists.iommu@lfdr.de>; Sat, 18 Apr 2020 01:46:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 0FA3B8828E;
	Fri, 17 Apr 2020 23:46:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rpgzyvPHTBKO; Fri, 17 Apr 2020 23:46:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 004DD88287;
	Fri, 17 Apr 2020 23:46:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E6DD3C1D8D;
	Fri, 17 Apr 2020 23:46:22 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 21146C0172
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 23:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0A8BD8773D
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 23:46:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDBkufi7cz0R for <iommu@lists.linux-foundation.org>;
 Fri, 17 Apr 2020 23:46:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E0B2187689
 for <iommu@lists.linux-foundation.org>; Fri, 17 Apr 2020 23:46:19 +0000 (UTC)
IronPort-SDR: 268iQzSHb4dxJGw0ml83gYBjGaLe1dMtPp3rEm15cGRng2+JftWCX2fla8BXBdD63wjw/H2whp
 ny+OpSO8+Gdg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2020 16:46:19 -0700
IronPort-SDR: ASTM0DenDX4diKwnGTttR6Xv7iDqv3xnQHPdpPTR7mJ4hGFXK2+44Gcq/V1yQWM1yzhcI/Jldu
 X9SO2dbxBxhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,395,1580803200"; d="scan'208";a="280903732"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by orsmga008.jf.intel.com with ESMTP; 17 Apr 2020 16:46:18 -0700
Received: from fmsmsx114.amr.corp.intel.com (10.18.116.8) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 17 Apr 2020 16:46:18 -0700
Received: from shsmsx108.ccr.corp.intel.com (10.239.4.97) by
 FMSMSX114.amr.corp.intel.com (10.18.116.8) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 17 Apr 2020 16:46:18 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX108.ccr.corp.intel.com ([169.254.8.7]) with mapi id 14.03.0439.000;
 Sat, 18 Apr 2020 07:46:14 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>, Auger Eric
 <eric.auger@redhat.com>
Subject: RE: [PATCH v11 05/10] iommu/vt-d: Add bind guest PASID support
Thread-Topic: [PATCH v11 05/10] iommu/vt-d: Add bind guest PASID support
Thread-Index: AQHWCebOp12IiW87IUSByO2zgM/w7qhv6qkAgAJcu4CACNZVgIABkaSw///PdICAAIEBgIABEGEg
Date: Fri, 17 Apr 2020 23:46:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D826F9D@SHSMSX104.ccr.corp.intel.com>
References: <1585939334-21396-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1585939334-21396-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <ab57b85b-235f-dc80-1c25-9b3d42dc5f4e@redhat.com>
 <20200410124557.4012b99b@jacob-builder>
 <6d9721a8-2198-5ecd-6c8b-fc43ff2ad7e1@redhat.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D824106@SHSMSX104.ccr.corp.intel.com>
 <2025736d-e7f2-d746-e030-e609b2f465e2@redhat.com>
 <20200417082839.45d6321e@jacob-builder>
In-Reply-To: <20200417082839.45d6321e@jacob-builder>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: Yi L <yi.l.liu@linux.intel.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, David
 Woodhouse <dwmw2@infradead.org>, Jonathan Cameron <jic23@kernel.org>
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

> From: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Sent: Friday, April 17, 2020 11:29 PM
> 
> On Fri, 17 Apr 2020 09:46:55 +0200
> Auger Eric <eric.auger@redhat.com> wrote:
> 
> > Hi Kevin,
> > On 4/17/20 4:45 AM, Tian, Kevin wrote:
> > >> From: Auger Eric
> > >> Sent: Thursday, April 16, 2020 6:43 PM
> > >>
> > > [...]
> > >>>>> +	if (svm) {
> > >>>>> +		/*
> > >>>>> +		 * If we found svm for the PASID, there must
> > >>>>> be at
> > >>>>> +		 * least one device bond, otherwise svm should
> > >>>>> be freed.
> > >>>>> +		 */
> > >>>>> +		if (WARN_ON(list_empty(&svm->devs))) {
> > >>>>> +			ret = -EINVAL;
> > >>>>> +			goto out;
> > >>>>> +		}
> > >>>>> +
> > >>>>> +		for_each_svm_dev(sdev, svm, dev) {
> > >>>>> +			/* In case of multiple sub-devices of
> > >>>>> the same pdev
> > >>>>> +			 * assigned, we should allow multiple
> > >>>>> bind calls with
> > >>>>> +			 * the same PASID and pdev.
> > >>>>> +			 */
> > >>>>> +			sdev->users++;
> > >>>> What if this is not an mdev device. Is it also allowed?
> > >>> Yes. IOMMU and VT-d driver is not mdev aware. Here mdev is just an
> > >>> example of normal use case. You can bind the same PCI device (PF
> > >>> or SRIOV VF) more than once to the same PASID. Just need to
> > >>> unbind also.
> > >>
> > >> I don't get the point of binding a non mdev device several times
> > >> with the same PASID. Do you intend to allow that at userspace
> > >> level or prevent this from happening in VFIO?
> > >
> > > I feel it's better to prevent this from happening, otherwise VFIO
> > > also needs to track the bind count and do multiple unbinds at
> > > mm_exit. But it's not necessary to prevent it in VFIO. We can check
> > > here upon whether aux_domain is valid, and if not return -EBUSY.
> > Ah OK. So if we can detect the case here it is even better
> >
> I don't understand why VFIO cannot track, since it is mdev aware. if we
> don;t refcount the users, one mdev unbind will result unbind for all
> mdev under the same pdev. That may not be the right thing to do.
> 

The open here is not for mdev, which refcount is still required. Eric's
point is for non-mdev endpoints. It's meaningless and not intuitive 
to allow binding a PASID multiple-times to the same device. 

Thanks
Kevin
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
