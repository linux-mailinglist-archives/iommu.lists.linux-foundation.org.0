Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id D15253DB4D8
	for <lists.iommu@lfdr.de>; Fri, 30 Jul 2021 10:05:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6942682E9C;
	Fri, 30 Jul 2021 08:05:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di1U9rYhU3Sm; Fri, 30 Jul 2021 08:05:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id ABE4F82CD4;
	Fri, 30 Jul 2021 08:05:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C97DC0022;
	Fri, 30 Jul 2021 08:05:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B65BC000E
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 08:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1606782CCB
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 08:05:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ObyguIvtBkJd for <iommu@lists.linux-foundation.org>;
 Fri, 30 Jul 2021 08:05:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B47982CC7
 for <iommu@lists.linux-foundation.org>; Fri, 30 Jul 2021 08:05:44 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10060"; a="200225443"
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="200225443"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 01:05:42 -0700
X-IronPort-AV: E=Sophos;i="5.84,281,1620716400"; d="scan'208";a="499554323"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 01:05:40 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1m9NWQ-003JRr-1Z; Fri, 30 Jul 2021 11:05:34 +0300
Date: Fri, 30 Jul 2021 11:05:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v1 1/2] iommu/vt-d: Move intel_iommu_ops to header file
Message-ID: <YQOyzka9VDJU3NhU@smile.fi.intel.com>
References: <20210729163538.40101-1-andriy.shevchenko@linux.intel.com>
 <3c7663db-5b1e-3e00-3ff1-381c7a107ac9@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3c7663db-5b1e-3e00-3ff1-381c7a107ac9@linux.intel.com>
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

On Fri, Jul 30, 2021 at 10:20:08AM +0800, Lu Baolu wrote:
> On 7/30/21 12:35 AM, Andy Shevchenko wrote:
> > Compiler is not happy about hidden declaration of intel_iommu_ops.
> > 
> > .../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
> > 
> > Move declaration to header file to make compiler happy.
> 
> Thanks for the cleanup. Sharing data structures between different files
> doesn't seem to be a good design. How about adding a helper so that the
> intel_iommu_ops could be a static one?

Whatever suits the purpose.
Can you apply patch 2 of this series, please?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
