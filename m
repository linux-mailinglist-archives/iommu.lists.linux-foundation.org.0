Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 534D52573B8
	for <lists.iommu@lfdr.de>; Mon, 31 Aug 2020 08:30:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6DFB08601B;
	Mon, 31 Aug 2020 06:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shgh-HBuoGhg; Mon, 31 Aug 2020 06:30:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA2B385E14;
	Mon, 31 Aug 2020 06:30:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 705D4C0051;
	Mon, 31 Aug 2020 06:30:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 12AF8C0051
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 06:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EC2A685AF1
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 06:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pwdGt4EK4jIz for <iommu@lists.linux-foundation.org>;
 Mon, 31 Aug 2020 06:30:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 60DDD85A88
 for <iommu@lists.linux-foundation.org>; Mon, 31 Aug 2020 06:30:43 +0000 (UTC)
IronPort-SDR: 1WnmAzQDvzUXoAFlmS6POVhEIuHvU6DYtl/FqLoHCVUAOBnQOvYpIjHGkFdXHMUkVwbnHeRE83
 ioiXvbqGyhig==
X-IronPort-AV: E=McAfee;i="6000,8403,9729"; a="156921026"
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="156921026"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2020 23:30:42 -0700
IronPort-SDR: QqZ3v+VRCxqUbT8HoSOCPgPI6ho1omcYL0G4pItQsWDj1P+vJVxA3MojHHJpj4EvS4hRX5XHfl
 wf26Tl6L/u7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,374,1592895600"; d="scan'208";a="330594797"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 30 Aug 2020 23:30:41 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kCdKw-00CtKk-UN; Mon, 31 Aug 2020 09:30:38 +0300
Date: Mon, 31 Aug 2020 09:30:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v1] iommu/vt-d: Move intel_iommu_ops to header file
Message-ID: <20200831063038.GV1891694@smile.fi.intel.com>
References: <20200828160502.65695-1-andriy.shevchenko@linux.intel.com>
 <20200829065846.GB31681@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829065846.GB31681@infradead.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Sat, Aug 29, 2020 at 07:58:46AM +0100, Christoph Hellwig wrote:
> On Fri, Aug 28, 2020 at 07:05:02PM +0300, Andy Shevchenko wrote:
> > Compiler is not happy about hidden declaration of intel_iommu_ops.
> > 
> > .../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
> > 
> > Move declaration to header file to make compiler happy.
> 
> What about a factoring out a helper that does iommu_device_sysfs_add +
> iommu_device_set_ops + iommu_device_register and then mark
> intel_iommu_ops static?

I am okay with this proposal, but I think the better if IOMMU folks can answer
to this before I'm going to invest time into it.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
