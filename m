Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E34FB2E0F14
	for <lists.iommu@lfdr.de>; Tue, 22 Dec 2020 20:49:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AACAF85D41;
	Tue, 22 Dec 2020 19:49:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pIYbVAw6ZrOD; Tue, 22 Dec 2020 19:49:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B4FD85DDB;
	Tue, 22 Dec 2020 19:49:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 235EDC0893;
	Tue, 22 Dec 2020 19:49:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1F6CFC0893
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 19:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id E7ABC23265
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KLHyiQUQM9O2 for <iommu@lists.linux-foundation.org>;
 Tue, 22 Dec 2020 19:49:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from so254-31.mailgun.net (so254-31.mailgun.net [198.61.254.31])
 by silver.osuosl.org (Postfix) with ESMTPS id 616DB20459
 for <iommu@lists.linux-foundation.org>; Tue, 22 Dec 2020 19:49:37 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608666578; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=1/n4spgUgB5z8HHtSAnD/C3uM02O7wS2g73gRhhMe3Y=;
 b=kl/lX1vpBjPNSjXh16oS/gUixZwbuTXeQmJPq85xCYUOw0CMcZRtVvxm0jsJtyX4GB1KweGz
 dxn21r84z6b+dTXrpRFiN2TiRgjIroBakBalBa5eYIdz+1LQg3S5xXec4AIbJ+sgmkIr3NR+
 uOPpddPoJyNSP++eTTvOTaclre0=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fe24dcdda47198188e9a024 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Dec 2020 19:49:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2596CC433C6; Tue, 22 Dec 2020 19:49:33 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: isaacm)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43125C433CA;
 Tue, 22 Dec 2020 19:49:32 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 22 Dec 2020 11:49:32 -0800
From: isaacm@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 3/7] iommu/arm-smmu: Add dependency on io-pgtable
 format modules
In-Reply-To: <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-4-git-send-email-isaacm@codeaurora.org>
 <3b0c191d-3fd0-73db-c1e3-4a80aa7953d7@arm.com>
Message-ID: <e47f14b81d90772346ef28c9a7fd3365@codeaurora.org>
X-Sender: isaacm@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: kernel-team@android.com, will@kernel.org, pdaly@codeaurora.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 pratikp@codeaurora.org
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

On 2020-12-22 11:27, Robin Murphy wrote:
> On 2020-12-22 00:44, Isaac J. Manjarres wrote:
>> The SMMU driver depends on the availability of the ARM LPAE and
>> ARM V7S io-pgtable format code to work properly. In preparation
> 
> Nit: we don't really depend on v7s - we *can* use it if it's
> available, address constraints are suitable, and the SMMU
> implementation actually supports it (many don't), but we can still
> quite happily not use it even so. LPAE is mandatory in the
> architecture so that's our only hard requirement, embodied in the
> kconfig select.
> 
> This does mean there may technically still be a corner case involving
> ARM_SMMU=y and IO_PGTABLE_ARM_V7S=m, but at worst it's now a runtime
> failure rather than a build error, so unless and until anyone
> demonstrates that it actually matters I don't feel particularly
> inclined to give it much thought.
> 
> Robin.
> 
Okay, I'll fix up the commit message, as well as the code, so that it
only depends on io-pgtable-arm.

Thanks,
Isaac
>> for having the io-pgtable formats as modules, add a "pre"
>> dependency with MODULE_SOFTDEP() to ensure that the io-pgtable
>> format modules are loaded before loading the ARM SMMU driver module.
>> 
>> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>
>> ---
>>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 1 +
>>   1 file changed, 1 insertion(+)
>> 
>> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c 
>> b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> index d8c6bfd..a72649f 100644
>> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
>> @@ -2351,3 +2351,4 @@ MODULE_DESCRIPTION("IOMMU API for ARM 
>> architected SMMU implementations");
>>   MODULE_AUTHOR("Will Deacon <will@kernel.org>");
>>   MODULE_ALIAS("platform:arm-smmu");
>>   MODULE_LICENSE("GPL v2");
>> +MODULE_SOFTDEP("pre: io-pgtable-arm io-pgtable-arm-v7s");
>> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
