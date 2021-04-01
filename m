Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE6D351715
	for <lists.iommu@lfdr.de>; Thu,  1 Apr 2021 19:08:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA7A04185F;
	Thu,  1 Apr 2021 17:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRlKaIaYvYUL; Thu,  1 Apr 2021 17:08:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E5841866;
	Thu,  1 Apr 2021 17:08:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 698DFC0012;
	Thu,  1 Apr 2021 17:08:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 20A70C000A
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C48F84A4C
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M2W8RNiyLiBc for <iommu@lists.linux-foundation.org>;
 Thu,  1 Apr 2021 17:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96B7B84A28
 for <iommu@lists.linux-foundation.org>; Thu,  1 Apr 2021 17:07:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A366661391;
 Thu,  1 Apr 2021 17:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617296878;
 bh=qFocNvtPsf8pAsFshLPeo3aKoGr3THZgmZB1NTwW9/w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JAIYYfUn3RhCo4ZlQdbcFNHvyHYBatFPqxCXKTPP+iq474Dc5Sjcvp4yVsRsj1m6b
 w+gUCeSvoV5fo2+4P6Yg2EVHtuRhF1Ww0HfsZJ6CxKPikoELJYI7yb3RASqk39k5GL
 lM5SktP9m2fwyioniLazyU6S+ZyX4yhsKsDD78B6n2G2I5uJVFjPz2Kyvonk0/Z8i/
 Q5mhyhbJf0x8ptgTmu83TCHwNg++7ju+IjYUGbwmJgfUM4MWvMvP1GVApjwTTh5nVH
 E4HSGMchCOQEWcxLU8/5WhXWfLR0S6xwl3RY82Lc/NnSZzO48YAw8mSqnV7k4YIqlB
 UhWuS9IoV3JcQ==
Date: Thu, 1 Apr 2021 18:07:52 +0100
From: Will Deacon <will@kernel.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH v14 07/10] iommu/arm-smmu-v3: Maintain a SID->device
 structure
Message-ID: <20210401170752.GA9447@willie-the-truck>
References: <20210401154718.307519-1-jean-philippe@linaro.org>
 <20210401154718.307519-8-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210401154718.307519-8-jean-philippe@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: devicetree@vger.kernel.org, kevin.tian@intel.com,
 linux-acpi@vger.kernel.org, sudeep.holla@arm.com, rjw@rjwysocki.net,
 vivek.gautam@arm.com, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 linux-accelerators@lists.ozlabs.org, guohanjun@huawei.com,
 zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

On Thu, Apr 01, 2021 at 05:47:16PM +0200, Jean-Philippe Brucker wrote:
> When handling faults from the event or PRI queue, we need to find the
> struct device associated with a SID. Add a rb_tree to keep track of
> SIDs.
> 
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

Acked-by: Will Deacon <will@kernel.org>

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
