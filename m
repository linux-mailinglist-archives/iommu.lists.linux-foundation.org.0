Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 347C034230B
	for <lists.iommu@lfdr.de>; Fri, 19 Mar 2021 18:12:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE68E4014F;
	Fri, 19 Mar 2021 17:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 99pisO9ghMYB; Fri, 19 Mar 2021 17:12:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 163394014E;
	Fri, 19 Mar 2021 17:12:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DD3DEC0001;
	Fri, 19 Mar 2021 17:12:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8B71AC0001
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 17:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70DC14ED4C
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 17:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6uo_G6oSpHgu for <iommu@lists.linux-foundation.org>;
 Fri, 19 Mar 2021 17:12:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 975524ED49
 for <iommu@lists.linux-foundation.org>; Fri, 19 Mar 2021 17:12:16 +0000 (UTC)
IronPort-SDR: UQwOQ4zSsI0a1UQQ+sNyZMvpUHVpb8hBy8Td5AAnQ/VHiPeLFkwGtHFrH8yM5417me4/wJ94pU
 8sDoItbJgQSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9928"; a="187585503"
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="187585503"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 10:12:15 -0700
IronPort-SDR: VbTWhJ2rgwdhOkRbc708GpiO2lxB1YMjIYwzSJznSjuXtAGNCMoVpcDc9aFVtXjBLoQ+7KUwO2
 6tf1Q/GpaDgg==
X-IronPort-AV: E=Sophos;i="5.81,262,1610438400"; d="scan'208";a="375012290"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2021 10:12:15 -0700
Date: Fri, 19 Mar 2021 10:14:39 -0700
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH V4 05/18] iommu/ioasid: Redefine IOASID set and
 allocation APIs
Message-ID: <20210319101439.19f35fd5@jacob-builder>
In-Reply-To: <YFR10eeDVf5ZHV5l@myrica>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614463286-97618-6-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210318172234.3e8c34f7@jacob-builder> <YFR10eeDVf5ZHV5l@myrica>
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

On Fri, 19 Mar 2021 10:58:41 +0100, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:

> > Slightly off the title. As we are moving to use cgroup to limit PASID
> > allocations, it would be much simpler if we enforce on the current
> > task.  
> 
> Yes I think we should do that. Is there a problem with charging the
> process that does the PASID allocation even if the PASID indexes some
> other mm?
Besides complexity, my second concern is that we are sharing the misc
cgroup controller with other resources that do not have such behavior.

Cgroup v2 also has unified hierarchy which also requires coherent behavior
among controllers.

Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
