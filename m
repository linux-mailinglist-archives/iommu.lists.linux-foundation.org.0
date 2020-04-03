Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D42719D6EA
	for <lists.iommu@lfdr.de>; Fri,  3 Apr 2020 14:45:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id B4638882F5;
	Fri,  3 Apr 2020 12:44:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FeqfDMqxTIT2; Fri,  3 Apr 2020 12:44:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2F068882CB;
	Fri,  3 Apr 2020 12:44:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 13749C1D89;
	Fri,  3 Apr 2020 12:44:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E641C07FF
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 12:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 3D5DA88C91
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 12:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-H+A7D40qFW for <iommu@lists.linux-foundation.org>;
 Fri,  3 Apr 2020 12:44:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9E1E988C9C
 for <iommu@lists.linux-foundation.org>; Fri,  3 Apr 2020 12:44:56 +0000 (UTC)
IronPort-SDR: wgV3pJzfhrF2OEFcuTtlDoZsZDHqkSNpAMyhMOQeU+Ms0VaGM3oZZ7xg2KCm5H1uiFCUBQXFtw
 U9VMdtAb70UA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 05:44:56 -0700
IronPort-SDR: FIByPhSWdOnN913/D0S6XqXWgpwqP9R8Y5o3SECqUjmkpTTNF6mFEYXqyZxYOkHQre5oHzJlEz
 TAdvK2BZqRGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="241115423"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by fmsmga007.fm.intel.com with ESMTP; 03 Apr 2020 05:44:56 -0700
Received: from fmsmsx157.amr.corp.intel.com (10.18.116.73) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 05:44:55 -0700
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX157.amr.corp.intel.com (10.18.116.73) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 3 Apr 2020 05:44:55 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.225]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.129]) with mapi id 14.03.0439.000;
 Fri, 3 Apr 2020 20:44:51 +0800
From: "Liu, Yi L" <yi.l.liu@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: RE: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Thread-Topic: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
Thread-Index: AQHWAEUbC4GB74LMekup8jIcF6WIFqhlZUwAgAH1tzD//4hGgIAAhuqA
Date: Fri, 3 Apr 2020 12:44:51 +0000
Message-ID: <A2975661238FB949B60364EF0F2C25743A220AE4@SHSMSX104.ccr.corp.intel.com>
References: <1584880325-10561-1-git-send-email-yi.l.liu@intel.com>
 <1584880325-10561-2-git-send-email-yi.l.liu@intel.com>
 <20200402135240.GE1176452@myrica>
 <A2975661238FB949B60364EF0F2C25743A2209E3@SHSMSX104.ccr.corp.intel.com>
 <20200403123951.GA1410438@myrica>
In-Reply-To: <20200403123951.GA1410438@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Raj,
 Ashok" <ashok.raj@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "Sun,
 Yi Y" <yi.y.sun@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "Tian,
 Jun J" <jun.j.tian@intel.com>, "Wu, Hao" <hao.wu@intel.com>
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

> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Sent: Friday, April 3, 2020 8:40 PM
> Subject: Re: [PATCH v1 1/8] vfio: Add VFIO_IOMMU_PASID_REQUEST(alloc/free)
> 
> On Fri, Apr 03, 2020 at 11:56:09AM +0000, Liu, Yi L wrote:
> > > >  /**
> > > > + * VFIO_MM objects - create, release, get, put, search
> > > > + * Caller of the function should have held vfio.vfio_mm_lock.
> > > > + */
> > > > +static struct vfio_mm *vfio_create_mm(struct mm_struct *mm) {
> > > > +	struct vfio_mm *vmm;
> > > > +	struct vfio_mm_token *token;
> > > > +	int ret = 0;
> > > > +
> > > > +	vmm = kzalloc(sizeof(*vmm), GFP_KERNEL);
> > > > +	if (!vmm)
> > > > +		return ERR_PTR(-ENOMEM);
> > > > +
> > > > +	/* Per mm IOASID set used for quota control and group operations */
> > > > +	ret = ioasid_alloc_set((struct ioasid_set *) mm,
> > >
> > > Hmm, either we need to change the token of ioasid_alloc_set() to
> > > "void *", or pass an actual ioasid_set struct, but this cast doesn't
> > > look good :)
> > >
> > > As I commented on the IOASID series, I think we could embed a struct
> > > ioasid_set into vfio_mm, pass that struct to all other ioasid_*
> > > functions, and get rid of ioasid_sid.
> >
> > I think change to "void *" is better as we needs the token to ensure
> > all threads within a single VM share the same ioasid_set.
> 
> Don't they share the same vfio_mm?

that's right. then both works well for me.

Regards,
Yi Liu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
