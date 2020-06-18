Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E1F1FF67B
	for <lists.iommu@lfdr.de>; Thu, 18 Jun 2020 17:22:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E492C88709;
	Thu, 18 Jun 2020 15:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8sn1scSngnuU; Thu, 18 Jun 2020 15:22:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF6F588722;
	Thu, 18 Jun 2020 15:22:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A0653C016E;
	Thu, 18 Jun 2020 15:22:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B3C3C016E
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:22:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 22EC287EE9
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:22:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1aoZ8FeATSXr for <iommu@lists.linux-foundation.org>;
 Thu, 18 Jun 2020 15:22:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7BD6387EAE
 for <iommu@lists.linux-foundation.org>; Thu, 18 Jun 2020 15:22:43 +0000 (UTC)
IronPort-SDR: k6u90w4ov4CHmZryNtjJI29havT8bd6RJxSccV7MOHSFqTOX5KpOxYgIRPyMB7X+ESWMvQuqRF
 FhnTMhxJ+tRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9655"; a="140949084"
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="140949084"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2020 08:22:42 -0700
IronPort-SDR: XgeIFWNm/rUPs3f8JBvzlSgZi/FudpaujhzTcJqwZYy14jIQfuwr/srpYtcNR3RxtTUZceiA85
 vFX4SaXyTU2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,251,1589266800"; d="scan'208";a="291802011"
Received: from romley-ivt3.sc.intel.com ([172.25.110.60])
 by orsmga002.jf.intel.com with ESMTP; 18 Jun 2020 08:22:41 -0700
Date: Thu, 18 Jun 2020 08:22:41 -0700
From: Fenghua Yu <fenghua.yu@intel.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v3 01/13] iommu: Change type of pasid to unsigned int
Message-ID: <20200618152240.GD15763@romley-ivt3.sc.intel.com>
References: <1592418233-17762-1-git-send-email-fenghua.yu@intel.com>
 <1592418233-17762-2-git-send-email-fenghua.yu@intel.com>
 <20200618071206.GA7294@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618071206.GA7294@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Ashok Raj <ashok.raj@intel.com>, Ravi V Shankar <ravi.v.shankar@intel.com>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, iommu@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Jacob Jun Pan <jacob.jun.pan@intel.com>, H Peter Anvin <hpa@zytor.com>,
 Christoph Hellwig <hch@infradeed.org>, Thomas Gleixner <tglx@linutronix.de>,
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

On Thu, Jun 18, 2020 at 12:12:06AM -0700, Christoph Hellwig wrote:
> On Wed, Jun 17, 2020 at 11:23:41AM -0700, Fenghua Yu wrote:
> > PASID is defined as a few different types in iommu including "int",
> > "u32", and "unsigned int". To be consistent and to match with ioasid's
> > type, define PASID and its variations (e.g. max PASID) as "unsigned int".
> 
> Wouldn't u32 be a little more explicit (besides being shorter and
> matching the uapi definitions)?

"unsigned int" matches ioasid_t type definition. Very (very) few places
define pasid as "u32". If changing to u32, this patch will be much bigger.

include/uapi/linux/iommu.h defines pasid as either __u32 or __u64. It's
not just __u32.

Thanks.

-Fenghua
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
