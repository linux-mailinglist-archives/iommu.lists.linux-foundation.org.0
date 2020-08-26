Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C43252E8F
	for <lists.iommu@lfdr.de>; Wed, 26 Aug 2020 14:17:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DAA9E86B19;
	Wed, 26 Aug 2020 12:17:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XF6BHhpMY3n; Wed, 26 Aug 2020 12:17:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BF6FE86B2D;
	Wed, 26 Aug 2020 12:17:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AA3FCC0051;
	Wed, 26 Aug 2020 12:17:46 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77F27C0051
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 67C7A86A48
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c01xTz3l3QP3 for <iommu@lists.linux-foundation.org>;
 Wed, 26 Aug 2020 12:17:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AF1938650E
 for <iommu@lists.linux-foundation.org>; Wed, 26 Aug 2020 12:17:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598444264; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=r/4qUAmqAI0V7gRbqKrmT3zgfbrjj739xnjXpNtJKmA=;
 b=AHAhjrDVOLBOKFAP9fyruXKE3MrzuS68DTnsFaC2cg84Fu20UDTVvJ+/MjkS9vYD3GAT4zon
 C9/fJdc7xonfOH+snB0W2MsSPJlWY67o+KN9tuFFIjmHs7H+EHnN5O6EFk0p+lMUb3ibvr06
 F7sfP5HgN1WK5u5I6ZOSL8GmQPs=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f4652dbe64cc21df87f2fdf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 26 Aug 2020 12:17:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 24441C4339C; Wed, 26 Aug 2020 12:17:31 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: saiprakash.ranjan)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5D919C433CA;
 Wed, 26 Aug 2020 12:17:30 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 26 Aug 2020 17:47:30 +0530
From: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To: Robin Murphy <robin.murphy@arm.com>, Douglas Anderson
 <dianders@chromium.org>
Subject: Re: [PATCH] iommu: Add support to filter non-strict/lazy mode based
 on device names
In-Reply-To: <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
References: <20200825154249.20011-1-saiprakash.ranjan@codeaurora.org>
 <e3e4da33-a44f-0a07-9e2e-0f806875ab0b@arm.com>
Message-ID: <d9b1f1b614057d87279c26e13cbbb1f5@codeaurora.org>
X-Sender: saiprakash.ranjan@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, iommu@lists.linux-foundation.org,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
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

On 2020-08-26 17:07, Robin Murphy wrote:
> On 2020-08-25 16:42, Sai Prakash Ranjan wrote:
>> Currently the non-strict or lazy mode of TLB invalidation can only be 
>> set
>> for all or no domains. This works well for development platforms where
>> setting to non-strict/lazy mode is fine for performance reasons but on
>> production devices, we need a more fine grained control to allow only
>> certain peripherals to support this mode where we can be sure that it 
>> is
>> safe. So add support to filter non-strict/lazy mode based on the 
>> device
>> names that are passed via cmdline parameter "iommu.nonstrict_device".
> 
> There seems to be considerable overlap here with both the existing
> patches for per-device default domain control [1], and the broader
> ongoing development on how to define, evaluate and handle "trusted"
> vs. "untrusted" devices (e.g. [2],[3]). I'd rather see work done to
> make sure those integrate properly together and work well for
> everyone's purposes, than add more disjoint mechanisms that only
> address small pieces of the overall issue.
> 
> Robin.
> 
> [1]
> https://lore.kernel.org/linux-iommu/20200824051726.7xaJRTTszJuzdFWGJ8YNsshCtfNR0BNeMrlILAyqt_0@z/
> [2]
> https://lore.kernel.org/linux-iommu/20200630044943.3425049-1-rajatja@google.com/
> [3]
> https://lore.kernel.org/linux-iommu/20200626002710.110200-2-rajatja@google.com/
> 

Thanks for the links, [1] definitely sounds interesting, I was under the 
impression
that changing such via sysfs is late, but seems like other Sai has got 
it working
for the default domain type. So we can extend that and add a strict 
attribute as well,
we should be definitely OK with system booting with default strict mode 
for all
peripherals as long as we have an option to change that later, Doug?

Thanks,
Sai

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a 
member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
