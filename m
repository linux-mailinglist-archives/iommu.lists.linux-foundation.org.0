Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 050A8349779
	for <lists.iommu@lfdr.de>; Thu, 25 Mar 2021 18:00:16 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684E140EDF;
	Thu, 25 Mar 2021 17:00:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlc7Tpw9j6gB; Thu, 25 Mar 2021 17:00:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 497A940EDA;
	Thu, 25 Mar 2021 17:00:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BFE2C000A;
	Thu, 25 Mar 2021 17:00:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B98C1C000A
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B48E784995
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:00:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QvhmzNApPGri for <iommu@lists.linux-foundation.org>;
 Thu, 25 Mar 2021 17:00:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F0A9684984
 for <iommu@lists.linux-foundation.org>; Thu, 25 Mar 2021 17:00:09 +0000 (UTC)
IronPort-SDR: J7CtvYoqn/AIpM/CnIafMVCwCWt1Cdr1gI8nk2LNs30UfkuLZsXilbJKHKaqSx9EHfCnSy2927
 wa2RjjuUSFCQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="252332086"
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="252332086"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:00:09 -0700
IronPort-SDR: 2y+6feWtrUcXYxfBHPesWqNmZ6kIWcDDsLyjiaRoSEn254L4SReT6/Tck0Lc0DbYE10KjtxKlE
 wtU3q2hP7nrw==
X-IronPort-AV: E=Sophos;i="5.81,278,1610438400"; d="scan'208";a="376922132"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 10:00:08 -0700
Date: Thu, 25 Mar 2021 10:02:36 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210325100236.17241a1c@jacob-builder>
In-Reply-To: <YFxkNEz3THJKzW0b@myrica>
References: <20210318172234.3e8c34f7@jacob-builder> <YFR10eeDVf5ZHV5l@myrica>
 <20210319124645.GP2356281@nvidia.com> <YFSqDNJ5yagk4eO+@myrica>
 <20210319135432.GT2356281@nvidia.com>
 <20210319112221.5123b984@jacob-builder> <YFhiMLR35WWMW/Hu@myrica>
 <20210324100246.4e6b8aa1@jacob-builder>
 <20210324170338.GM2356281@nvidia.com>
 <20210324151230.466fd47a@jacob-builder> <YFxkNEz3THJKzW0b@myrica>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 iommu@lists.linux-foundation.org, Li Zefan <lizefan@huawei.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
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

Hi Jean-Philippe,

On Thu, 25 Mar 2021 11:21:40 +0100, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:

> On Wed, Mar 24, 2021 at 03:12:30PM -0700, Jacob Pan wrote:
> > Hi Jason,
> > 
> > On Wed, 24 Mar 2021 14:03:38 -0300, Jason Gunthorpe <jgg@nvidia.com>
> > wrote: 
> > > On Wed, Mar 24, 2021 at 10:02:46AM -0700, Jacob Pan wrote:  
> > > > > Also wondering about device driver allocating auxiliary domains
> > > > > for their private use, to do iommu_map/unmap on private PASIDs (a
> > > > > clean replacement to super SVA, for example). Would that go
> > > > > through the same path as /dev/ioasid and use the cgroup of
> > > > > current task?    
> > > >
> > > > For the in-kernel private use, I don't think we should restrict
> > > > based on cgroup, since there is no affinity to user processes. I
> > > > also think the PASID allocation should just use kernel API instead
> > > > of /dev/ioasid. Why would user space need to know the actual PASID
> > > > # for device private domains? Maybe I missed your idea?    
> > > 
> > > There is not much in the kernel that isn't triggered by a process, I
> > > would be careful about the idea that there is a class of users that
> > > can consume a cgroup controlled resource without being inside the
> > > cgroup.
> > > 
> > > We've got into trouble before overlooking this and with something
> > > greenfield like PASID it would be best built in to the API to prevent
> > > a mistake. eg accepting a cgroup or process input to the allocator.
> > >   
> > Make sense. But I think we only allow charging the current cgroup, how
> > about I add the following to ioasid_alloc():
> > 
> > 	misc_cg = get_current_misc_cg();
> > 	ret = misc_cg_try_charge(MISC_CG_RES_IOASID, misc_cg, 1);
> > 	if (ret) {
> > 		put_misc_cg(misc_cg);
> > 		return ret;
> > 	}  
> 
> Does that allow PASID allocation during driver probe, in kernel_init or
> modprobe context?
> 
Good point. Yes, you can get cgroup subsystem state in kernel_init for
charging/uncharging. I would think module_init should work also since it is
after kernel_init. I have tried the following:
static int __ref kernel_init(void *unused)
 {
        int ret;
+       struct cgroup_subsys_state *css;
+       css = task_get_css(current, pids_cgrp_id);

But that would imply:
1. IOASID has to be built-in, not as module
2. IOASIDs charged on PID1/init would not subject to cgroup limit since it
will be in the root cgroup and we don't support migration nor will migrate.

Then it comes back to the question of why do we try to limit in-kernel
users per cgroup if we can't enforce these cases.

> Thanks,
> Jean
> 


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
