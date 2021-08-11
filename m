Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A14B23E939B
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 16:23:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09F06607B9;
	Wed, 11 Aug 2021 14:23:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MHmPnEvhqmor; Wed, 11 Aug 2021 14:23:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 13F05608A5;
	Wed, 11 Aug 2021 14:23:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8130C001F;
	Wed, 11 Aug 2021 14:23:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0308DC000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:23:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 003D183750
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y88QcDawjV7W for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 14:23:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6557782A17
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:23:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="276167110"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="276167110"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 07:23:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="445941829"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 07:23:12 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mDp8L-0086Xg-AU; Wed, 11 Aug 2021 17:23:05 +0300
Date: Wed, 11 Aug 2021 17:23:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 1/2] iommu/vt-d: Move intel_iommu_ops to header file
Message-ID: <YRPdSX8fQ+z+EehZ@smile.fi.intel.com>
References: <20210729163538.40101-1-andriy.shevchenko@linux.intel.com>
 <3c7663db-5b1e-3e00-3ff1-381c7a107ac9@linux.intel.com>
 <YQOyzka9VDJU3NhU@smile.fi.intel.com>
 <17a2b3f2-747d-2798-7fea-5846eec0b1fe@linux.intel.com>
 <YRPVfES0aTbfaHES@smile.fi.intel.com>
 <f0f98e37-2486-fe79-7950-0a117a59b303@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0f98e37-2486-fe79-7950-0a117a59b303@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Joerg Roedel <jroedel@suse.de>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>
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

On Wed, Aug 11, 2021 at 10:02:48PM +0800, Lu Baolu wrote:
> On 2021/8/11 21:49, Andy Shevchenko wrote:
> > On Fri, Jul 30, 2021 at 09:01:41PM +0800, Lu Baolu wrote:
> > > On 2021/7/30 16:05, Andy Shevchenko wrote:
> > > > On Fri, Jul 30, 2021 at 10:20:08AM +0800, Lu Baolu wrote:
> > > > > On 7/30/21 12:35 AM, Andy Shevchenko wrote:
> > > > > > Compiler is not happy about hidden declaration of intel_iommu_ops.
> > > > > > 
> > > > > > .../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
> > > > > > 
> > > > > > Move declaration to header file to make compiler happy.
> > > > > 
> > > > > Thanks for the cleanup. Sharing data structures between different files
> > > > > doesn't seem to be a good design. How about adding a helper so that the
> > > > > intel_iommu_ops could be a static one?
> > > > 
> > > > Whatever suits the purpose.
> > > > Can you apply patch 2 of this series, please?
> > > 
> > > Yes, I will. Thanks!
> > 
> > Gentle reminder.
> 
> Thanks. Normally I will queue the vt-d patches to Joerg in the rc6 week.

I see, but don't we need to have them in Linux Next for a few weeks for
testing? Perhaps you need to add your tree to be integrated in the Linux Next?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
