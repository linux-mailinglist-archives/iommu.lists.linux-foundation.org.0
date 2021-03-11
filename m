Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 743A23380EC
	for <lists.iommu@lfdr.de>; Thu, 11 Mar 2021 23:53:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEAB4ED03;
	Thu, 11 Mar 2021 22:53:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oViJpDB_xk_P; Thu, 11 Mar 2021 22:53:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AF504ED01;
	Thu, 11 Mar 2021 22:53:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA58CC0001;
	Thu, 11 Mar 2021 22:53:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 40592C0001
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 22:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19EB84ED01
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 22:53:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kX5Yq-9HDZxW for <iommu@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 22:53:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A1D54ED00
 for <iommu@lists.linux-foundation.org>; Thu, 11 Mar 2021 22:53:17 +0000 (UTC)
IronPort-SDR: NBwI8gBA8nZJU6osOVk9fWdbFkyxHAL+/7CAVURNHBqYueQ4N13DOuvzLquBoZA6L5Hpe740+K
 CdV9PfWeFObA==
X-IronPort-AV: E=McAfee;i="6000,8403,9920"; a="168025548"
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="168025548"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:53:14 -0800
IronPort-SDR: BnU1jTB+qrvPQr9QBSa1HELuTsIJnS5daNkpyismq4WJ6r58rUNJ+KBsbgbfqudFcqDQrCbdJE
 AMHvxLTGZ7SA==
X-IronPort-AV: E=Sophos;i="5.81,241,1610438400"; d="scan'208";a="448439603"
Received: from jacob-builder.jf.intel.com (HELO jacob-builder) ([10.7.199.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2021 14:53:14 -0800
Date: Thu, 11 Mar 2021 14:55:34 -0800
From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC PATCH 18/18] ioasid: Add /dev/ioasid for userspace
Message-ID: <20210311145534.6fe9bb9a@jacob-builder>
In-Reply-To: <20210310192301.GC2356281@nvidia.com>
References: <1614463286-97618-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1614463286-97618-19-git-send-email-jacob.jun.pan@linux.intel.com>
 <20210310192301.GC2356281@nvidia.com>
Organization: OTC
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: "Tian, Kevin" <kevin.tian@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>, Raj Ashok <ashok.raj@intel.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>,
 LKML <linux-kernel@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 iommu@lists.linux-foundation.org, Li Zefan <lizefan@huawei.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 cgroups@vger.kernel.org, Wu Hao <hao.wu@intel.com>,
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

Thanks for the review.

On Wed, 10 Mar 2021 15:23:01 -0400, Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Sat, Feb 27, 2021 at 02:01:26PM -0800, Jacob Pan wrote:
> 
> > +/* -------- IOCTLs for IOASID file descriptor (/dev/ioasid) -------- */
> > +
> > +/**
> > + * IOASID_GET_API_VERSION - _IO(IOASID_TYPE, IOASID_BASE + 0)
> > + *
> > + * Report the version of the IOASID API.  This allows us to bump the
> > entire
> > + * API version should we later need to add or change features in
> > incompatible
> > + * ways.
> > + * Return: IOASID_API_VERSION
> > + * Availability: Always
> > + */
> > +#define IOASID_GET_API_VERSION		_IO(IOASID_TYPE,
> > IOASID_BASE + 0)  
> 
> I think this is generally a bad idea, if you change the API later then
> also change the ioctl numbers and everything should work out
> 
> eg use the 4th argument to IOC to specify something about the ABI
> 
Let me try to understand the idea, do you mean something like this?
#define IOASID_GET_INFO _IOC(_IOC_NONE, IOASID_TYPE, IOASID_BASE + 1,
sizeof(struct ioasid_info))

If we later change the size of struct ioasid_info, IOASID_GET_INFO would be
a different ioctl number. Then we will break the existing user space that
uses the old number. So I am guessing you meant we need to have a different
name also. i.e.

#define IOASID_GET_INFO_V2 _IOC(_IOC_NONE, IOASID_TYPE, IOASID_BASE + 1,
sizeof(struct ioasid_info_v2))

We can get rid of the API version, just have individual IOCTL version.
Is that right?

> Jason


Thanks,

Jacob
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
