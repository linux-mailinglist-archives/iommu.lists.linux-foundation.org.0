Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AC2446067
	for <lists.iommu@lfdr.de>; Fri,  5 Nov 2021 09:04:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 774EC40647;
	Fri,  5 Nov 2021 08:04:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U3mLBjBCc5-m; Fri,  5 Nov 2021 08:04:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9DD2440648;
	Fri,  5 Nov 2021 08:04:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B91AC0021;
	Fri,  5 Nov 2021 08:04:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E9C11C000E
 for <iommu@lists.linux-foundation.org>; Fri,  5 Nov 2021 08:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D16ED81A92
 for <iommu@lists.linux-foundation.org>; Fri,  5 Nov 2021 08:04:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wv28sl1kg8LI for <iommu@lists.linux-foundation.org>;
 Fri,  5 Nov 2021 08:04:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52DF08190B
 for <iommu@lists.linux-foundation.org>; Fri,  5 Nov 2021 08:04:31 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="231706191"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="231706191"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 01:04:30 -0700
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="490253444"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.18])
 ([10.254.213.18])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 01:04:28 -0700
Message-ID: <716e2940-a426-60d7-e4a7-9ff6187a6af8@linux.intel.com>
Date: Fri, 5 Nov 2021 16:04:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Content-Language: en-US
To: Joerg Roedel <joro@8bytes.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <YYPrNkweZahTdAbA@8bytes.org>
 <CAHk-=whX_ygSHr02mhWXO38kddFE_t7ntBHf_sehz=asFfzFKA@mail.gmail.com>
 <YYTezKfKDCTiDcij@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [git pull] IOMMU Updates for Linux v5.16
In-Reply-To: <YYTezKfKDCTiDcij@8bytes.org>
Cc: iommu <iommu@lists.linux-foundation.org>, Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021/11/5 15:35, Joerg Roedel wrote:
> On Thu, Nov 04, 2021 at 11:10:53AM -0700, Linus Torvalds wrote:
>> That too seems to be stale and unused since commit 9bfecd058339
>> ("x86/cpufeatures: Force disable X86_FEATURE_ENQCMD and remove
>> update_pasid()")
>>
>> I left it alone because I didn't want to do any extra development in
>> the merge commit itself, but it looks to me like there's some room for
>> more cleanips. No?
> 
> Yes, looks like this define is unused now. I talk to Baolu whether this
> can be cleaned up too, Baolu?

Yes.

PASID_DISABLED is unused after

commit 9bfecd058339 ("x86/cpufeatures: Force disable X86_FEATURE_ENQCMD
and remove update_pasid()").

and

commit 00ecd5401349a ("iommu/vt-d: Clean up unused PASID updating
functions")

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
