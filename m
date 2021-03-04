Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 727EC32D9D6
	for <lists.iommu@lfdr.de>; Thu,  4 Mar 2021 19:59:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21AB143262;
	Thu,  4 Mar 2021 18:59:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1VBqsLXt1f0H; Thu,  4 Mar 2021 18:59:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F4EF43288;
	Thu,  4 Mar 2021 18:59:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C54A8C0012;
	Thu,  4 Mar 2021 18:59:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A1C3C0001
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 18:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 501AF43285
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 18:59:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hPlGPh9t79JY for <iommu@lists.linux-foundation.org>;
 Thu,  4 Mar 2021 18:59:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7243143262
 for <iommu@lists.linux-foundation.org>; Thu,  4 Mar 2021 18:59:32 +0000 (UTC)
IronPort-SDR: 3wV6VYx/J6/zb+H9an1Mztb+4PYkVHNxyLSLe+IpC21t1B2gTHqrpXj0sfIiH30BHpinqS1tya
 00Zj42fB4lMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="174599166"
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; d="scan'208";a="174599166"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 10:59:31 -0800
IronPort-SDR: NbqFzMbMSGkhCygtH0In0Xtszb1NnhzOwThNk0wCxsqlTYeCynz4T+5CvB+YvlRK43kFtk5qJf
 wDisfAEJFTig==
X-IronPort-AV: E=Sophos;i="5.81,223,1610438400"; d="scan'208";a="445844611"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2021 10:59:28 -0800
Date: Thu, 4 Mar 2021 11:01:44 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 15/18] cgroup: Introduce ioasids controller
Message-ID: <20210304110144.39ef0941@jacob-builder>
In-Reply-To: <20210304175402.GG4247@nvidia.com>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614463286-97618-16-git-send-email-jacob.jun.pan@linux.intel.com>
 <YD+u3CXhwOi2LC+4@slm.duckdns.org>
 <20210303131726.7a8cb169@jacob-builder>
 <20210303160205.151d114e@jacob-builder> <YECtMZNqSgh7jkGP@myrica>
 <20210304094603.4ab6c1c4@jacob-builder>
 <20210304175402.GG4247@nvidia.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, "Tian,
 Kevin" <kevin.tian@intel.com>, Alex Williamson <alex.williamson@redhat.com>,
 Raj Ashok <ashok.raj@intel.com>, Jonathan
 Corbet <corbet@lwn.net>, Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 iommu@lists.linux-foundation.org, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, cgroups@vger.kernel.org, Wu Hao <hao.wu@intel.com>,
 David Woodhouse <dwmw2@infradead.org>
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

Hi Jason,

On Thu, 4 Mar 2021 13:54:02 -0400, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Thu, Mar 04, 2021 at 09:46:03AM -0800, Jacob Pan wrote:
> 
> > Right, I was assuming have three use cases of IOASIDs:
> > 1. host supervisor SVA (not a concern, just one init_mm to bind)
> > 2. host user SVA, either one IOASID per process or perhaps some private
> > IOASID for private address space
> > 3. VM use for guest SVA, each IOASID is bound to a guest process
> > 
> > My current cgroup proposal applies to #3 with IOASID_SET_TYPE_MM, which
> > is allocated by the new /dev/ioasid interface.
> > 
> > For #2, I was thinking you can limit the host process via PIDs cgroup?
> > i.e. limit fork. So the host IOASIDs are currently allocated from the
> > system pool with quota of chosen by iommu_sva_init() in my patch, 0
> > means unlimited use whatever is available.
> > https://lkml.org/lkml/2021/2/28/18  
> 
> Why do we need two pools?
> 
> If PASID's are limited then why does it matter how the PASID was
> allocated? Either the thing requesting it is below the limit, or it
> isn't.
> 
you are right. it should be tracked based on the process regardless it is
allocated by the user (/dev/ioasid) or indirectly by kernel drivers during
iommu_sva_bind_device(). Need to consolidate both 2 and 3 and
decouple cgroup and IOASID set.

> For something like qemu I'd expect to put the qemu process in a cgroup
> with 1 PASID. Who cares what qemu uses the PASID for, or how it was
> allocated?
> 
For vSVA, we will need one PASID per guest process. But that is up to the
admin based on whether or how many SVA capable devices are directly
assigned.

> Jason


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
