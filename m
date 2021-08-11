Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7F3E9336
	for <lists.iommu@lfdr.de>; Wed, 11 Aug 2021 16:03:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B7F740568;
	Wed, 11 Aug 2021 14:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1gYJjQNdh2n; Wed, 11 Aug 2021 14:02:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7AB46404F4;
	Wed, 11 Aug 2021 14:02:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 47613C000E;
	Wed, 11 Aug 2021 14:02:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 095B5C000E
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEA296060F
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Abua7nFCFzPW for <iommu@lists.linux-foundation.org>;
 Wed, 11 Aug 2021 14:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A56C605F0
 for <iommu@lists.linux-foundation.org>; Wed, 11 Aug 2021 14:02:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="300715932"
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="300715932"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 07:02:53 -0700
X-IronPort-AV: E=Sophos;i="5.84,313,1620716400"; d="scan'208";a="516745657"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.213.159])
 ([10.254.213.159])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 07:02:51 -0700
Subject: Re: [PATCH v1 1/2] iommu/vt-d: Move intel_iommu_ops to header file
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20210729163538.40101-1-andriy.shevchenko@linux.intel.com>
 <3c7663db-5b1e-3e00-3ff1-381c7a107ac9@linux.intel.com>
 <YQOyzka9VDJU3NhU@smile.fi.intel.com>
 <17a2b3f2-747d-2798-7fea-5846eec0b1fe@linux.intel.com>
 <YRPVfES0aTbfaHES@smile.fi.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <f0f98e37-2486-fe79-7950-0a117a59b303@linux.intel.com>
Date: Wed, 11 Aug 2021 22:02:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRPVfES0aTbfaHES@smile.fi.intel.com>
Content-Language: en-US
Cc: Joerg Roedel <jroedel@suse.de>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2021/8/11 21:49, Andy Shevchenko wrote:
> On Fri, Jul 30, 2021 at 09:01:41PM +0800, Lu Baolu wrote:
>> On 2021/7/30 16:05, Andy Shevchenko wrote:
>>> On Fri, Jul 30, 2021 at 10:20:08AM +0800, Lu Baolu wrote:
>>>> On 7/30/21 12:35 AM, Andy Shevchenko wrote:
>>>>> Compiler is not happy about hidden declaration of intel_iommu_ops.
>>>>>
>>>>> .../drivers/iommu/intel/iommu.c:414:24: warning: symbol 'intel_iommu_ops' was not declared. Should it be static?
>>>>>
>>>>> Move declaration to header file to make compiler happy.
>>>>
>>>> Thanks for the cleanup. Sharing data structures between different files
>>>> doesn't seem to be a good design. How about adding a helper so that the
>>>> intel_iommu_ops could be a static one?
>>>
>>> Whatever suits the purpose.
>>> Can you apply patch 2 of this series, please?
>>>
>>
>> Yes, I will. Thanks!
> 
> Gentle reminder.
> 

Thanks. Normally I will queue the vt-d patches to Joerg in the rc6 week.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
