Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D13FB1C90EC
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 16:56:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 844668748F;
	Thu,  7 May 2020 14:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YG9vCcAJljbm; Thu,  7 May 2020 14:56:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 07F8687483;
	Thu,  7 May 2020 14:56:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7647C07FF;
	Thu,  7 May 2020 14:56:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 94845C07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7C96D26475
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:56:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ylZ8kx4CBvzn for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 14:56:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by silver.osuosl.org (Postfix) with ESMTP id 0D27626428
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 14:56:30 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 75A1C1FB;
 Thu,  7 May 2020 07:56:30 -0700 (PDT)
Received: from [10.57.36.85] (unknown [10.57.36.85])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D63D3F68F;
 Thu,  7 May 2020 07:56:28 -0700 (PDT)
Subject: Re: [PATCH] iomm/arm-smmu: Add stall implementation hook
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>
References: <20200421202004.11686-1-saiprakash.ranjan@codeaurora.org>
 <b491e02ad790a437115fdeab6b21bc48@codeaurora.org>
 <1ced023b-157c-21a0-ac75-1adef7f029f0@arm.com>
 <fad5dc096a2bd9404341ba8738ba8fc9@codeaurora.org>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <80a3b07d-f3a7-07c4-4e8f-76e28563027c@arm.com>
Date: Thu, 7 May 2020 15:56:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fad5dc096a2bd9404341ba8738ba8fc9@codeaurora.org>
Content-Language: en-GB
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On 2020-05-07 1:06 pm, Sai Prakash Ranjan wrote:
[...]
> We could have our own context fault handler in QCOM implementation,
> but that would just be duplicating things from arm-smmu context fault
> handler. So I did not think it makes much sense to have our own
> fault handler in qcom impl just for enabling stall model.

Hmm, it's probably worth thinking ahead a bit here, to the "actually 
doing things with stalls" plan. I don't have a clear picture off-hand of 
how well the new device fault handler API might fit into arm-smmu - at 
the very least trying to make it truly generic implies having to play 
nasty tricks with disable_irq() for the general case given the "IRQ may 
remain asserted while SS is active" possibility, and that isn't 
particularly inviting. Not to mention tying it into the 
pretend-auxdomain stuff that *is* rather dependent on the qcom impl. If 
it turns out that you'll eventually have to reimplement the IRQ handler 
anyway for all that, then starting off down that route *might* work out 
cleaner and less hassle overall.

Robin.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
