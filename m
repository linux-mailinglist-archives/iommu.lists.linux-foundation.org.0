Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D12932DE968
	for <lists.iommu@lfdr.de>; Fri, 18 Dec 2020 19:59:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6951387A2A;
	Fri, 18 Dec 2020 18:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RvRQe5KRT54z; Fri, 18 Dec 2020 18:59:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8A6CB87A26;
	Fri, 18 Dec 2020 18:59:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 754F7C0893;
	Fri, 18 Dec 2020 18:59:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 45F9DC0893
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 3495B2E322
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:59:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3n7vsdqbrAXz for <iommu@lists.linux-foundation.org>;
 Fri, 18 Dec 2020 18:59:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from m43-15.mailgun.net (m43-15.mailgun.net [69.72.43.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 39F8C2E12C
 for <iommu@lists.linux-foundation.org>; Fri, 18 Dec 2020 18:59:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608317992; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nF9RFWeNhCu7EW9KQEudAqRr4pp7cUZ/0UDWA00fXd4=;
 b=RCroycVE0fu465il7gYnic3riZqJU/Qvr1TVJpKUwzYH45f40wI1WLZWDHw46ojBStnufxYk
 P80xcQxiX1YvPr8nAUkYXDy8Vwxw+vN4PVEYVqyD0UODDaaH6KlT5s99PKDT2f+UgPOub1tY
 +1jr5DYfK9u2zOi/Sl5fnc8dHi4=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5fdcfc1f75ab652e87a2f045 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Dec 2020 18:59:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BC1E8C433CA; Fri, 18 Dec 2020 18:59:43 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 97B71C433C6;
 Fri, 18 Dec 2020 18:59:42 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 18 Dec 2020 10:59:42 -0800
From: isaacm@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/3] iommu/io-pgtable-arm: Prepare for modularization
In-Reply-To: <309ff39d-5fc5-83c6-d423-2d66f503c60c@arm.com>
References: <1608280722-19841-1-git-send-email-isaacm@codeaurora.org>
 <1608280722-19841-2-git-send-email-isaacm@codeaurora.org>
 <309ff39d-5fc5-83c6-d423-2d66f503c60c@arm.com>
Message-ID: <34ea1af8569e4115e2dd1de61ae95bb6@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: kernel-team@android.com, pdaly@codeaurora.org, pratikp@codeaurora.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 will@kernel.org, linux-arm-kernel@lists.infradead.org
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

On 2020-12-18 04:38, Robin Murphy wrote:
> On 2020-12-18 08:38, Isaac J. Manjarres wrote:
>> The io-pgtable-arm and io-pgtable-arm-v7s source files will
>> be compiled as separate modules, along with the io-pgtable
>> source. Export the symbols for the io-pgtable init function
>> structures for the io-pgtable module to use.
> 
> In my current build tree, the io-pgtable glue itself is a whopping 379
> bytes of code and data - is there really any benefit to all the
> additional overhead of making that modular? Given the number of
> different users (including AMD now), I think at this point we should
> start considering this as part of the IOMMU core, and just tweak the
> interface such that formats can register their own init_fns
> dynamically instead of the static array that's always horrible.
> 
> Robin.
> 
Thanks for the feedback, Robin. This is an avenue I had explored a bit 
when modularizing the code. However,
I came up with a few problems that I couldn't get around.

1) If we leave the io-pgtable glue as part of the core kernel, we need 
to ensure that the io-pgtable format
modules get loaded prior to any driver that might use them (e.g. IOMMU 
drivers/other callers of alloc_io_pgtable_ops).
     a) This can get a bit messy, as there's no symbol dependencies 
between the callers of the io-pgtable
        code, and the page table format modules, since everything is 
through function pointers. This is handled
        for the IOMMU drivers through the devlink feature, but I don't 
see how we can leverage something like that
        here. I guess this isn't too much of a problem when everything is 
built-in, as the registration can happen
        in one of the earlier initcall levels.

     b) If we do run into a scenario where a client of io-pgtable tries 
to allocate a page table instance prior
        to the io-pgtable format module being loaded, I couldn't come up 
with a way of distinguishing between
        format module is not available at the moment vs  format module 
will never be available. I don't think
        returning EPROBE_DEFER would be something nice to do in that 
case.

2) We would have to ensure that the format module cannot be unloaded 
while other clients are using it. I suppose
this isn't as big as point #1 though, since it's something that can 
probably be handled through a similar ref count
mechanism that we're using for modular IOMMU drivers.

Given the two reasons above, I went with the current approach, since it 
avoids both issues by creating symbol dependencies
between client drivers, the io-pgtable drivers, and the io-pgtable 
format drivers, so that ensures that they are loaded
in the correct order, and also prevents them from being removed, unless 
there aren't any users present.

Thanks,
Isaac
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> ---
>>   drivers/iommu/io-pgtable-arm-v7s.c | 4 ++++
>>   drivers/iommu/io-pgtable-arm.c     | 8 ++++++++
>>   2 files changed, 12 insertions(+)
>> 
>> diff --git a/drivers/iommu/io-pgtable-arm-v7s.c 
>> b/drivers/iommu/io-pgtable-arm-v7s.c
>> index 1d92ac9..f062c1c 100644
>> --- a/drivers/iommu/io-pgtable-arm-v7s.c
>> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
>> @@ -28,6 +28,7 @@
>>   #include <linux/iommu.h>
>>   #include <linux/kernel.h>
>>   #include <linux/kmemleak.h>
>> +#include <linux/module.h>
>>   #include <linux/sizes.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>> @@ -839,6 +840,7 @@ struct io_pgtable_init_fns 
>> io_pgtable_arm_v7s_init_fns = {
>>   	.alloc	= arm_v7s_alloc_pgtable,
>>   	.free	= arm_v7s_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_v7s_init_fns);
>>     #ifdef CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST
>>   @@ -984,3 +986,5 @@ static int __init arm_v7s_do_selftests(void)
>>   }
>>   subsys_initcall(arm_v7s_do_selftests);
>>   #endif
>> +
>> +MODULE_LICENSE("GPL v2");
>> diff --git a/drivers/iommu/io-pgtable-arm.c 
>> b/drivers/iommu/io-pgtable-arm.c
>> index 87def58..2623d57 100644
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/bitops.h>
>>   #include <linux/io-pgtable.h>
>>   #include <linux/kernel.h>
>> +#include <linux/module.h>
>>   #include <linux/sizes.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>> @@ -1047,26 +1048,31 @@ struct io_pgtable_init_fns 
>> io_pgtable_arm_64_lpae_s1_init_fns = {
>>   	.alloc	= arm_64_lpae_alloc_pgtable_s1,
>>   	.free	= arm_lpae_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_64_lpae_s1_init_fns);
>>     struct io_pgtable_init_fns io_pgtable_arm_64_lpae_s2_init_fns = {
>>   	.alloc	= arm_64_lpae_alloc_pgtable_s2,
>>   	.free	= arm_lpae_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_64_lpae_s2_init_fns);
>>     struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s1_init_fns = {
>>   	.alloc	= arm_32_lpae_alloc_pgtable_s1,
>>   	.free	= arm_lpae_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_32_lpae_s1_init_fns);
>>     struct io_pgtable_init_fns io_pgtable_arm_32_lpae_s2_init_fns = {
>>   	.alloc	= arm_32_lpae_alloc_pgtable_s2,
>>   	.free	= arm_lpae_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_32_lpae_s2_init_fns);
>>     struct io_pgtable_init_fns io_pgtable_arm_mali_lpae_init_fns = {
>>   	.alloc	= arm_mali_lpae_alloc_pgtable,
>>   	.free	= arm_lpae_free_pgtable,
>>   };
>> +EXPORT_SYMBOL_GPL(io_pgtable_arm_mali_lpae_init_fns);
>>     #ifdef CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST
>>   @@ -1252,3 +1258,5 @@ static int __init arm_lpae_do_selftests(void)
>>   }
>>   subsys_initcall(arm_lpae_do_selftests);
>>   #endif
>> +
>> +MODULE_LICENSE("GPL v2");
>> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
