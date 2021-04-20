Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 97815365829
	for <lists.iommu@lfdr.de>; Tue, 20 Apr 2021 13:55:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14A7340214;
	Tue, 20 Apr 2021 11:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rspFY2x5V79Q; Tue, 20 Apr 2021 11:55:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39A73401E2;
	Tue, 20 Apr 2021 11:55:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 09342C0020;
	Tue, 20 Apr 2021 11:55:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6A7FFC000B
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 11:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 425A560800
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 11:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZPLNQx8mvyBU for <iommu@lists.linux-foundation.org>;
 Tue, 20 Apr 2021 11:55:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12FAB607E3
 for <iommu@lists.linux-foundation.org>; Tue, 20 Apr 2021 11:55:42 +0000 (UTC)
IronPort-SDR: mHOvzJ4C8G0cfCFbZN2TR6OdtMlVmyZCR898xLzXa3T9ORoMzHy3wnWNZJKB4Wk8m1SGE31i9T
 45nrTOUTU/Yw==
X-IronPort-AV: E=McAfee;i="6200,9189,9959"; a="192304174"
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="192304174"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 04:55:40 -0700
IronPort-SDR: eqdJR0Z+KYTp2Lh8lgAxQf2fBxsMYAQFpBEefuDaRAiStsxvTQ/V2n2z2nowR9PKUs6BTiDxQL
 f9ebH8EDBH4w==
X-IronPort-AV: E=Sophos;i="5.82,236,1613462400"; d="scan'208";a="534466127"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 04:55:37 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lYoyb-005jR3-Rr; Tue, 20 Apr 2021 14:55:33 +0300
Date: Tue, 20 Apr 2021 14:55:33 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [RESEND v2] iommu/vt-d: Use passthrough mode for the Intel IPUs
Message-ID: <YH7BNbk/mhq6VXPo@smile.fi.intel.com>
References: <1618886913-6594-1-git-send-email-bingbu.cao@intel.com>
 <YH6q+FCTQheO6FHi@smile.fi.intel.com>
 <c9a0fc75-8b7b-e0ae-572e-8ca030a04537@linux.intel.com>
 <20210420105640.GI3@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210420105640.GI3@paasikivi.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: rajatja@google.com, will@kernel.org, grundler@chromium.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 senozhatsky@chromium.org, iommu@lists.linux-foundation.org,
 bhelgaas@google.com, Bingbu Cao <bingbu.cao@intel.com>, dwmw2@infradead.org,
 Bingbu Cao <bingbu.cao@linux.intel.com>
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

On Tue, Apr 20, 2021 at 01:56:40PM +0300, Sakari Ailus wrote:
> On Tue, Apr 20, 2021 at 06:34:26PM +0800, Bingbu Cao wrote:
> > On 4/20/21 6:20 PM, Andy Shevchenko wrote:
> > > On Tue, Apr 20, 2021 at 10:48:33AM +0800, Bingbu Cao wrote:

...

> > > This misses the changelog from v1 followed by the explanation why resent.
> > > 
> > I noticed there was a typo in the recipient list:
> > stable.vger.kernel.org -> stable@vger.kernel.org
> > 
> > no code change for resent.
> 
> When you're submitting a patch and want it reach the stable kernels, you'll
> need to add a Cc tag:
> 
> 	Cc: stable@vger.kernel.org
> 
> But not actually add the address to cc. I dropped stable@vger address from
> distribution.

Does it really matter?

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
