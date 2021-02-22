Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F66321834
	for <lists.iommu@lfdr.de>; Mon, 22 Feb 2021 14:15:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A1AD985F0E;
	Mon, 22 Feb 2021 13:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9ltyxGMVt18J; Mon, 22 Feb 2021 13:15:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E510985F15;
	Mon, 22 Feb 2021 13:15:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C9771C0012;
	Mon, 22 Feb 2021 13:15:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 151B1C0001
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 13:15:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03BF56F571
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 13:15:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BZaU0RExQGxk for <iommu@lists.linux-foundation.org>;
 Mon, 22 Feb 2021 13:15:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D82246F56F
 for <iommu@lists.linux-foundation.org>; Mon, 22 Feb 2021 13:15:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: gtucker) with ESMTPSA id 4087B1F44D43
Subject: Re: [PATCH] iommu/tegra-smmu: Fix mc errors on tegra124-nyan
To: Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
 thierry.reding@gmail.com, will@kernel.org
References: <20210218220702.1962-1-nicoleotsuka@gmail.com>
From: Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <7a664911-41bf-2647-716d-0836acd8078a@collabora.com>
Date: Mon, 22 Feb 2021 13:15:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218220702.1962-1-nicoleotsuka@gmail.com>
Content-Language: en-US
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
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

On 18/02/2021 22:07, Nicolin Chen wrote:
> Commit 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> removed certain hack in the tegra_smmu_probe() by relying on IOMMU core to
> of_xlate SMMU's SID per device, so as to get rid of tegra_smmu_find() and
> tegra_smmu_configure() that are typically done in the IOMMU core also.
> 
> This approach works for both existing devices that have DT nodes and other
> devices (like PCI device) that don't exist in DT, on Tegra210 and Tegra3
> upon testing. However, Page Fault errors are reported on tegra124-Nyan:
> 
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 EMEM address decode error (SMMU translation error [--S])
>   tegra-mc 70019000.memory-controller: display0a: read @0xfe056b40:
> 	 Page fault (SMMU translation error [--S])
> 
> After debugging, I found that the mentioned commit changed some function
> callback sequence of tegra-smmu's, resulting in enabling SMMU for display
> client before display driver gets initialized. I couldn't reproduce exact
> same issue on Tegra210 as Tegra124 (arm-32) differs at arch-level code.
> 
> Actually this Page Fault is a known issue, as on most of Tegra platforms,
> display gets enabled by the bootloader for the splash screen feature, so
> it keeps filling the framebuffer memory. A proper fix to this issue is to
> 1:1 linear map the framebuffer memory to IOVA space so the SMMU will have
> the same address as the physical address in its page table. Yet, Thierry
> has been working on the solution above for a year, and it hasn't merged.
> 
> Therefore, let's partially revert the mentioned commit to fix the errors.
> 
> The reason why we do a partial revert here is that we can still set priv
> in ->of_xlate() callback for PCI devices. Meanwhile, devices existing in
> DT, like display, will go through tegra_smmu_configure() at the stage of
> bus_set_iommu() when SMMU gets probed(), as what it did before we merged
> the mentioned commit.
> 
> Once we have the linear map solution for framebuffer memory, this change
> can be cleaned away.
> 
> [Big thank to Guillaume who reported and helped debugging/verification]
> 
> Fixes: 25938c73cd79 ("iommu/tegra-smmu: Rework tegra_smmu_probe_device()")
> Reported-by: Guillaume Tucker <guillaume.tucker@collabora.com>

You're welcome.  I would actually prefer to see it as reported by
kernelci.org since I wouldn't have found it without the automated
testing and bisection.  If you're OK to change this trailer:

  Reported-by: "kernelci.org bot" <bot@kernelci.org>

> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
> 
> Guillaume, would you please give a "Tested-by" to this change? Thanks!

Sure. https://lava.collabora.co.uk/scheduler/job/3249387

  Tested-by: Guillaume Tucker <guillaume.tucker@collabora.com>

Thanks,
Guillaume
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
