Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1227032E
	for <lists.iommu@lfdr.de>; Fri, 18 Sep 2020 19:24:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 943F5874DD;
	Fri, 18 Sep 2020 17:24:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jbMqGS7SxY0; Fri, 18 Sep 2020 17:24:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 30BAD874E3;
	Fri, 18 Sep 2020 17:24:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 18A74C0051;
	Fri, 18 Sep 2020 17:24:35 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5F610C0051
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 17:24:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4794287A97
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 17:24:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7B6YHuHUwdzK for <iommu@lists.linux-foundation.org>;
 Fri, 18 Sep 2020 17:24:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4E38087A85
 for <iommu@lists.linux-foundation.org>; Fri, 18 Sep 2020 17:24:32 +0000 (UTC)
IronPort-SDR: rFl0mJJF8u4GpRAxcZVSirj4zZ7pzVp+GxQzSk+GqZpBze1Cw2a848/oUgj0Iu/SzyaddQgNiO
 FUkpE9WIB5QQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="160050811"
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="160050811"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:24:28 -0700
IronPort-SDR: rr9f3VCLLmOjz9hSvF10aX5G17aKu+w6kiEVPPxj6fmpFYwliE+msfw5gaIXAy7ffw00MoPXAF
 vHMwD0c575Bg==
X-IronPort-AV: E=Sophos;i="5.77,274,1596524400"; d="scan'208";a="347074562"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2020 10:24:27 -0700
Date: Fri, 18 Sep 2020 10:26:30 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v9 0/7] IOMMU user API enhancement
Message-ID: <20200918102630.6d592442@jacob-builder>
In-Reply-To: <20200918100235.GQ31590@8bytes.org>
References: <1599861476-53416-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <20200918100235.GQ31590@8bytes.org>
Organization: OTC
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Jacob Pan <jacob.pan.linux@gmail.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Yi Sun <yi.y.sun@intel.com>
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

Hi Joerg,

On Fri, 18 Sep 2020 12:02:36 +0200, Joerg Roedel <joro@8bytes.org> wrote:

> Hi Jacob,
> 
> On Fri, Sep 11, 2020 at 02:57:49PM -0700, Jacob Pan wrote:
> > IOMMU user API header was introduced to support nested DMA translation
> > and related fault handling. The current UAPI data structures consist of
> > three areas that cover the interactions between host kernel and guest:
> >  - fault handling
> >  - cache invalidation
> >  - bind guest page tables, i.e. guest PASID
> > 
> > Future extensions are likely to support more architectures and vIOMMU
> > features.
> > 
> > In the previous discussion, using user-filled data size and feature
> > flags is made a preferred approach over a unified version number.
> > https://lkml.org/lkml/2020/1/29/45
> > 
> > In addition to introduce argsz field to data structures, this patchset
> > is also trying to document the UAPI design, usage, and extension rules.
> > VT-d driver changes to utilize the new argsz field is included, VFIO
> > usage is to follow.
> > 
> > This set is available at:
> > https://github.com/jacobpan/linux.git vsva_v5.9_uapi_v9  
> 
> This changes user visible structs in incompatible ways, are you sure
> those are not used yet anywhere?
> 
These structs are not used yet in that IOMMU UAPI does not provide
direct user IOCTLs. For guest SVA of assigned devices, VFIO is used. Yi's
companion patches are here.
https://lore.kernel.org/linux-iommu/5dd95fbf-054c-3bbc-e76b-2d5636214ff2@redhat.com/T/#t

These user structs can also be used by other framework in the future, such
as vDPA.

> Please address Randy's comments on patch 1 and my comment about the
> build-time checking and repost with linux-api@vger.kernel.org on Cc.
> 
Will do.

> Regards,
> 
> 	Joerg


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
